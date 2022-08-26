import datetime as dt
import requests
import json
import logging

from pathlib import Path
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.models import DAG

api_key = "1dfb2232-8207-4587-a309-46dfb6c9808a"
tmn_station_code = "s9600384"
requested_date = "2022-08-26"
transport_type = "plane"

default_args = {
    'owner':'airflow',
    'start_date':dt.datetime.strptime("2022-08-26",'%Y-%m-%d'),
    'retries':1,
    'retry_delay':dt.timedelta(minutes=2),
}


json_folder = Path(Path.home(),"airflow_files")

if not json_folder.exists():
    json_folder.mkdir()

file_path = Path(Path.home(),"airflow_files",f"json_{requested_date}.json")

def get_planes_schedule():
    params= {
        "apikey":api_key,
        "station":tmn_station_code,
        "date":requested_date,
        "transport_types":transport_type,
        "direction":"all"
    }
    url_schedule = "https://api.rasp.yandex.net/v3.0/schedule"
    
    req = requests.get(url_schedule,params=params)
    req.raise_for_status()

    with open(file_path,"w",encoding="utf-8") as file_:
        json.dump(req.json(),file_)

def load_to_db():
    
    def check_station(station_dict:dict) -> int:

        def get_station(code:str,title:str) -> tuple:
            sql_exists = f"select * from station where code='{code}' and title='{title}'"
            cursor.execute(sql_exists)
            return cursor.fetchone()

        station = get_station(station_dict['code'],station_dict['title'])

        if station:
            station_id = station[0]
        else:
            rows = [tuple(station_dict[key] for key in sorted(station_dict.keys())),]
            fields = sorted(['code','title','station_type','popular_title','short_title','transport_type','station_type_name','obj_type'])
            hook.insert_rows(
                table='station',
                rows=rows,
                target_fields=fields,
            )
            station = get_station(station_dict['code'],station_dict['title'])
            station_id = station[0]

        return station_id

    def check_carrier(carrier_dict:dict) -> int:

        def get_carrier(code:str,title:str) -> tuple:
            sql_exists = f"select * from carrier where code='{code}' and title='{title}' "
            cursor.execute(sql_exists)
            return cursor.fetchone()
        
        carrier_dict['icao'] = carrier_dict['codes'].pop('icao',None)
        carrier_dict['sirena'] = carrier_dict['codes'].pop('sirena',None)
        carrier_dict['iata'] = carrier_dict['codes'].pop('iata',None)
        carrier_dict.pop('codes',None)
        
        carrier = get_carrier(carrier_dict['code'],carrier_dict['title'])

        if carrier:
            carrier_id = carrier[0]
        else:
            rows = [tuple(carrier_dict[key] for key in sorted(carrier_dict.keys())),]
            fields = sorted(['code','icao','sirena','iata','title'])
            hook.insert_rows(
                table='carrier',
                rows=rows,
                target_fields=fields,
            )
            carrier = get_carrier(carrier_dict['code'],carrier_dict['title'])
            carrier_id = carrier[0]

        return carrier_id

    def check_thread(thread_dict:dict,carrier_id:int) -> int:

        def get_carrier(uid:str,title:str) -> tuple:
            sql_exists = f"select * from thread where uid='{uid}' and title='{title}' "
            cursor.execute(sql_exists)
            return cursor.fetchone()

        thread_dict.pop('transport_subtype',None)
        thread_dict.pop('express_type',None)

        thread = get_carrier(thread_dict['uid'],thread_dict['title'])

        if thread:
            thread_id = thread[0]
        else:
            rows = [tuple(thread_dict[key] if key != "carrier" else carrier_id for key in sorted(thread_dict.keys())),]
            fields = sorted(['uid','title','number','short_title','carrier','transport_type','vehicle'])
            print('check_thread',type(rows),rows,fields)
            hook.insert_rows(
                table='thread',
                rows=rows,
                target_fields=fields,
            )
            thread = get_carrier(thread_dict['uid'],thread_dict['title'])
            thread_id = thread[0]

        return thread_id

    hook = PostgresHook(postgres_conn_id="postgres_default")
    conn = hook.get_conn()
    cursor = conn.cursor()

    with open(file_path,"r") as file_:
        json_ = json.load(file_)

    json_['station']['obj_type'] = json_['station'].pop("type",'')
    station_id = check_station(json_['station'])
    rows = []
    fields = sorted(['except_days','arrival','thread','is_fuzzy','departure','days','terminal'])
    fields.append('station')
    for flight in json_['schedule']:
        flight.pop('platform',None)
        flight.pop('stops',None)

        carrier_id = check_carrier(flight['thread']['carrier'])
        thread_id = check_thread(flight['thread'],carrier_id)
        flight_params = []
        for key in sorted(flight.keys()):
            if key == 'thread':
                flight_params.append(thread_id)
            else:
                flight_params.append(flight[key])
        flight_params.append(station_id)
        rows.append(tuple(flight_params)) 
    
    hook.insert_rows(
        table='flight',
        rows=rows,
        target_fields=fields,
        )


with DAG(dag_id="planes",default_args=default_args) as dag:
    get_planes_schedule_data = PythonOperator(
        task_id="get_planes_schedule",
        python_callable=get_planes_schedule,
        dag=dag
    )
    load_to_db = PythonOperator(
        task_id="load_to_db",
        python_callable=load_to_db,
        dag=dag
    )
    get_planes_schedule_data >> load_to_db