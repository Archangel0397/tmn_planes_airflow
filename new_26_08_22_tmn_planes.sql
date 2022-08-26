--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: station; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.station (
    id integer NOT NULL,
    code text,
    title text,
    station_type text,
    popular_title text,
    short_title text,
    transport_type text,
    station_type_name text,
    obj_type text
);


ALTER TABLE public.station OWNER TO airflow;

--
-- Name: Station_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public."Station_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Station_id_seq" OWNER TO airflow;

--
-- Name: Station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public."Station_id_seq" OWNED BY public.station.id;


--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO airflow;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO airflow;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_id_seq OWNED BY public.ab_permission.id;


--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO airflow;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO airflow;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_view_id_seq OWNED BY public.ab_permission_view.id;


--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO airflow;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO airflow;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_view_role_id_seq OWNED BY public.ab_permission_view_role.id;


--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(256) NOT NULL,
    password character varying(256),
    email character varying(256) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO airflow;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_register_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO airflow;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_register_user_id_seq OWNED BY public.ab_register_user.id;


--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO airflow;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO airflow;

--
-- Name: ab_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_role_id_seq OWNED BY public.ab_role.id;


--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(256) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(256) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO airflow;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO airflow;

--
-- Name: ab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_user_id_seq OWNED BY public.ab_user.id;


--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO airflow;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO airflow;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_user_role_id_seq OWNED BY public.ab_user_role.id;


--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO airflow;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO airflow;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_view_menu_id_seq OWNED BY public.ab_view_menu.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO airflow;

--
-- Name: callback_request; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.callback_request (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    priority_weight integer NOT NULL,
    callback_data json NOT NULL,
    callback_type character varying(20) NOT NULL,
    dag_directory character varying(1000)
);


ALTER TABLE public.callback_request OWNER TO airflow;

--
-- Name: callback_request_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.callback_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_request_id_seq OWNER TO airflow;

--
-- Name: callback_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.callback_request_id_seq OWNED BY public.callback_request.id;


--
-- Name: carrier; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.carrier (
    id integer NOT NULL,
    code text,
    title text,
    icao text,
    sirena text,
    iata text
);


ALTER TABLE public.carrier OWNER TO airflow;

--
-- Name: carrier_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.carrier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrier_id_seq OWNER TO airflow;

--
-- Name: carrier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.carrier_id_seq OWNED BY public.carrier.id;


--
-- Name: connection; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.connection (
    id integer NOT NULL,
    conn_id character varying(250) NOT NULL,
    conn_type character varying(500) NOT NULL,
    host character varying(500),
    schema character varying(500),
    login character varying(500),
    password character varying(5000),
    port integer,
    extra text,
    is_encrypted boolean,
    is_extra_encrypted boolean,
    description text
);


ALTER TABLE public.connection OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connection_id_seq OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.connection_id_seq OWNED BY public.connection.id;


--
-- Name: dag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag (
    dag_id character varying(250) NOT NULL,
    is_paused boolean,
    is_subdag boolean,
    is_active boolean,
    last_parsed_time timestamp with time zone,
    last_pickled timestamp with time zone,
    last_expired timestamp with time zone,
    scheduler_lock boolean,
    pickle_id integer,
    fileloc character varying(2000),
    owners character varying(2000),
    description text,
    default_view character varying(25),
    schedule_interval text,
    root_dag_id character varying(250),
    next_dagrun timestamp with time zone,
    next_dagrun_create_after timestamp with time zone,
    max_active_tasks integer NOT NULL,
    has_task_concurrency_limits boolean NOT NULL,
    max_active_runs integer,
    next_dagrun_data_interval_start timestamp with time zone,
    next_dagrun_data_interval_end timestamp with time zone,
    has_import_errors boolean DEFAULT false,
    timetable_description character varying(1000)
);


ALTER TABLE public.dag OWNER TO airflow;

--
-- Name: dag_code; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_code (
    fileloc_hash bigint NOT NULL,
    fileloc character varying(2000) NOT NULL,
    source_code text NOT NULL,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_code OWNER TO airflow;

--
-- Name: dag_pickle; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_pickle (
    id integer NOT NULL,
    pickle bytea,
    created_dttm timestamp with time zone,
    pickle_hash bigint
);


ALTER TABLE public.dag_pickle OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_pickle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_pickle_id_seq OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_pickle_id_seq OWNED BY public.dag_pickle.id;


--
-- Name: dag_run; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_run (
    id integer NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    state character varying(50),
    run_id character varying(250) NOT NULL,
    external_trigger boolean,
    conf bytea,
    end_date timestamp with time zone,
    start_date timestamp with time zone,
    run_type character varying(50) NOT NULL,
    last_scheduling_decision timestamp with time zone,
    dag_hash character varying(32),
    creating_job_id integer,
    queued_at timestamp with time zone,
    data_interval_start timestamp with time zone,
    data_interval_end timestamp with time zone,
    log_template_id integer
);


ALTER TABLE public.dag_run OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_run_id_seq OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_run_id_seq OWNED BY public.dag_run.id;


--
-- Name: dag_tag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_tag (
    name character varying(100) NOT NULL,
    dag_id character varying(250) NOT NULL
);


ALTER TABLE public.dag_tag OWNER TO airflow;

--
-- Name: flight; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.flight (
    id integer NOT NULL,
    except_days text,
    thread integer NOT NULL,
    is_fuzzy boolean,
    departure timestamp with time zone,
    days text,
    terminal text,
    arrival timestamp with time zone,
    station integer NOT NULL
);


ALTER TABLE public.flight OWNER TO airflow;

--
-- Name: flight_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_id_seq OWNER TO airflow;

--
-- Name: flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.flight_id_seq OWNED BY public.flight.id;


--
-- Name: import_error; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.import_error (
    id integer NOT NULL,
    "timestamp" timestamp with time zone,
    filename character varying(1024),
    stacktrace text
);


ALTER TABLE public.import_error OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.import_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_error_id_seq OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.import_error_id_seq OWNED BY public.import_error.id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.job (
    id integer NOT NULL,
    dag_id character varying(250),
    state character varying(20),
    job_type character varying(30),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    latest_heartbeat timestamp with time zone,
    executor_class character varying(500),
    hostname character varying(500),
    unixname character varying(1000)
);


ALTER TABLE public.job OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.log (
    id integer NOT NULL,
    dttm timestamp with time zone,
    dag_id character varying(250),
    task_id character varying(250),
    event character varying(30),
    execution_date timestamp with time zone,
    owner character varying(500),
    extra text,
    map_index integer
);


ALTER TABLE public.log OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: log_template; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.log_template (
    id integer NOT NULL,
    filename text NOT NULL,
    elasticsearch_id text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.log_template OWNER TO airflow;

--
-- Name: log_template_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.log_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_template_id_seq OWNER TO airflow;

--
-- Name: log_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.log_template_id_seq OWNED BY public.log_template.id;


--
-- Name: rendered_task_instance_fields; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.rendered_task_instance_fields (
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    rendered_fields json NOT NULL,
    k8s_pod_yaml json,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    run_id character varying(250) NOT NULL
);


ALTER TABLE public.rendered_task_instance_fields OWNER TO airflow;

--
-- Name: sensor_instance; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.sensor_instance (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    state character varying(20),
    try_number integer,
    start_date timestamp with time zone,
    operator character varying(1000) NOT NULL,
    op_classpath character varying(1000) NOT NULL,
    hashcode bigint NOT NULL,
    shardcode integer NOT NULL,
    poke_context text NOT NULL,
    execution_context text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sensor_instance OWNER TO airflow;

--
-- Name: sensor_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.sensor_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_instance_id_seq OWNER TO airflow;

--
-- Name: sensor_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.sensor_instance_id_seq OWNED BY public.sensor_instance.id;


--
-- Name: serialized_dag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.serialized_dag (
    dag_id character varying(250) NOT NULL,
    fileloc character varying(2000) NOT NULL,
    fileloc_hash bigint NOT NULL,
    data json,
    last_updated timestamp with time zone NOT NULL,
    dag_hash character varying(32) DEFAULT 'Hash not calculated yet'::character varying NOT NULL,
    data_compressed bytea
);


ALTER TABLE public.serialized_dag OWNER TO airflow;

--
-- Name: session; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.session (
    id integer NOT NULL,
    session_id character varying(255),
    data bytea,
    expiry timestamp without time zone
);


ALTER TABLE public.session OWNER TO airflow;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO airflow;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: sla_miss; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.sla_miss (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    email_sent boolean,
    "timestamp" timestamp with time zone,
    description text,
    notification_sent boolean
);


ALTER TABLE public.sla_miss OWNER TO airflow;

--
-- Name: slot_pool; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.slot_pool (
    id integer NOT NULL,
    pool character varying(256),
    slots integer,
    description text
);


ALTER TABLE public.slot_pool OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.slot_pool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slot_pool_id_seq OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.slot_pool_id_seq OWNED BY public.slot_pool.id;


--
-- Name: task_fail; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_fail (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration integer,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    run_id character varying(250) NOT NULL
);


ALTER TABLE public.task_fail OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_fail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_fail_id_seq OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_fail_id_seq OWNED BY public.task_fail.id;


--
-- Name: task_instance; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_instance (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration double precision,
    state character varying(20),
    try_number integer,
    hostname character varying(1000),
    unixname character varying(1000),
    job_id integer,
    pool character varying(256) NOT NULL,
    queue character varying(256),
    priority_weight integer,
    operator character varying(1000),
    queued_dttm timestamp with time zone,
    pid integer,
    max_tries integer DEFAULT '-1'::integer,
    executor_config bytea,
    pool_slots integer NOT NULL,
    queued_by_job_id integer,
    external_executor_id character varying(250),
    trigger_id integer,
    trigger_timeout timestamp without time zone,
    next_method character varying(1000),
    next_kwargs json,
    map_index integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.task_instance OWNER TO airflow;

--
-- Name: task_map; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_map (
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer NOT NULL,
    length integer NOT NULL,
    keys json,
    CONSTRAINT task_map_length_not_negative CHECK ((length >= 0))
);


ALTER TABLE public.task_map OWNER TO airflow;

--
-- Name: task_reschedule; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_reschedule (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    try_number integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    duration integer NOT NULL,
    reschedule_date timestamp with time zone NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.task_reschedule OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_reschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reschedule_id_seq OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_reschedule_id_seq OWNED BY public.task_reschedule.id;


--
-- Name: thread; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.thread (
    id integer NOT NULL,
    uid text,
    title text,
    number text,
    short_title text,
    carrier integer,
    transport_type text,
    vehicle text
);


ALTER TABLE public.thread OWNER TO airflow;

--
-- Name: thread_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.thread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thread_id_seq OWNER TO airflow;

--
-- Name: thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.thread_id_seq OWNED BY public.thread.id;


--
-- Name: trigger; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.trigger (
    id integer NOT NULL,
    classpath character varying(1000) NOT NULL,
    kwargs json NOT NULL,
    created_date timestamp without time zone NOT NULL,
    triggerer_id integer
);


ALTER TABLE public.trigger OWNER TO airflow;

--
-- Name: trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.trigger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trigger_id_seq OWNER TO airflow;

--
-- Name: trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.trigger_id_seq OWNED BY public.trigger.id;


--
-- Name: variable; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.variable (
    id integer NOT NULL,
    key character varying(250),
    val text,
    is_encrypted boolean,
    description text
);


ALTER TABLE public.variable OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_id_seq OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variable.id;


--
-- Name: xcom; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.xcom (
    dag_run_id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    key character varying(512) NOT NULL,
    value bytea,
    "timestamp" timestamp with time zone NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.xcom OWNER TO airflow;

--
-- Name: ab_permission id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_id_seq'::regclass);


--
-- Name: ab_permission_view id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_id_seq'::regclass);


--
-- Name: ab_permission_view_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_role_id_seq'::regclass);


--
-- Name: ab_register_user id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user ALTER COLUMN id SET DEFAULT nextval('public.ab_register_user_id_seq'::regclass);


--
-- Name: ab_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role ALTER COLUMN id SET DEFAULT nextval('public.ab_role_id_seq'::regclass);


--
-- Name: ab_user id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user ALTER COLUMN id SET DEFAULT nextval('public.ab_user_id_seq'::regclass);


--
-- Name: ab_user_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role ALTER COLUMN id SET DEFAULT nextval('public.ab_user_role_id_seq'::regclass);


--
-- Name: ab_view_menu id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu ALTER COLUMN id SET DEFAULT nextval('public.ab_view_menu_id_seq'::regclass);


--
-- Name: callback_request id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.callback_request ALTER COLUMN id SET DEFAULT nextval('public.callback_request_id_seq'::regclass);


--
-- Name: carrier id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.carrier ALTER COLUMN id SET DEFAULT nextval('public.carrier_id_seq'::regclass);


--
-- Name: connection id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection ALTER COLUMN id SET DEFAULT nextval('public.connection_id_seq'::regclass);


--
-- Name: dag_pickle id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle ALTER COLUMN id SET DEFAULT nextval('public.dag_pickle_id_seq'::regclass);


--
-- Name: dag_run id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run ALTER COLUMN id SET DEFAULT nextval('public.dag_run_id_seq'::regclass);


--
-- Name: flight id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.flight ALTER COLUMN id SET DEFAULT nextval('public.flight_id_seq'::regclass);


--
-- Name: import_error id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error ALTER COLUMN id SET DEFAULT nextval('public.import_error_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: log_template id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log_template ALTER COLUMN id SET DEFAULT nextval('public.log_template_id_seq'::regclass);


--
-- Name: sensor_instance id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.sensor_instance ALTER COLUMN id SET DEFAULT nextval('public.sensor_instance_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: slot_pool id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool ALTER COLUMN id SET DEFAULT nextval('public.slot_pool_id_seq'::regclass);


--
-- Name: station id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.station ALTER COLUMN id SET DEFAULT nextval('public."Station_id_seq"'::regclass);


--
-- Name: task_fail id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail ALTER COLUMN id SET DEFAULT nextval('public.task_fail_id_seq'::regclass);


--
-- Name: task_reschedule id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule ALTER COLUMN id SET DEFAULT nextval('public.task_reschedule_id_seq'::regclass);


--
-- Name: thread id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.thread ALTER COLUMN id SET DEFAULT nextval('public.thread_id_seq'::regclass);


--
-- Name: trigger id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.trigger ALTER COLUMN id SET DEFAULT nextval('public.trigger_id_seq'::regclass);


--
-- Name: variable id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable ALTER COLUMN id SET DEFAULT nextval('public.variable_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_edit
3	can_delete
4	can_create
5	menu_access
6	clear
7	set_failed
8	set_retry
9	set_running
10	set_skipped
11	set_success
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	3	1
2	1	1
3	2	1
4	4	1
5	1	2
6	2	2
7	3	2
8	1	3
9	1	4
10	2	4
11	3	3
12	4	3
13	2	3
14	1	5
15	1	6
16	3	7
17	1	7
18	2	7
19	4	7
20	1	8
21	3	9
22	1	9
23	2	9
24	4	9
25	1	10
26	1	11
27	1	12
28	1	13
29	1	14
30	1	15
31	3	14
32	2	14
33	4	14
34	1	16
35	4	16
36	2	16
37	3	16
38	1	17
39	1	18
40	1	19
41	2	19
42	1	20
43	2	20
44	1	21
45	1	22
46	1	23
47	5	24
48	5	17
49	5	3
50	5	25
51	5	26
52	5	18
53	5	5
54	5	13
55	5	21
56	5	4
57	4	4
58	3	4
59	5	27
60	5	12
61	5	1
62	5	7
63	5	9
64	5	10
65	3	10
66	1	28
67	5	28
68	1	29
69	5	29
70	1	30
71	2	30
72	5	35
73	5	36
74	5	37
75	1	38
76	5	39
77	5	40
78	1	41
79	5	42
80	1	43
81	5	44
82	6	4
83	7	4
84	8	4
85	9	4
86	10	4
87	11	4
88	5	8
89	4	10
90	2	49
91	3	49
92	1	49
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	14	3
2	5	3
3	38	3
4	26	3
5	8	3
6	15	3
7	39	3
8	40	3
9	41	3
10	42	3
11	43	3
12	28	3
13	44	3
14	9	3
15	45	3
16	25	3
17	46	3
18	47	3
19	48	3
20	49	3
21	50	3
22	51	3
23	52	3
24	53	3
25	54	3
26	55	3
27	56	3
28	14	4
29	5	4
30	38	4
31	26	4
32	8	4
33	15	4
34	39	4
35	40	4
36	41	4
37	42	4
38	43	4
39	28	4
40	44	4
41	9	4
42	45	4
43	25	4
44	46	4
45	47	4
46	48	4
47	49	4
48	50	4
49	51	4
50	52	4
51	53	4
52	54	4
53	55	4
54	56	4
55	6	4
56	7	4
57	57	4
58	10	4
59	58	4
60	12	4
61	13	4
62	11	4
63	14	5
64	5	5
65	38	5
66	26	5
67	8	5
68	15	5
69	39	5
70	40	5
71	41	5
72	42	5
73	43	5
74	28	5
75	44	5
76	9	5
77	45	5
78	25	5
79	46	5
80	47	5
81	48	5
82	49	5
83	50	5
84	51	5
85	52	5
86	53	5
87	54	5
88	55	5
89	56	5
90	6	5
91	7	5
92	57	5
93	10	5
94	58	5
95	12	5
96	13	5
97	11	5
98	27	5
99	59	5
100	60	5
101	61	5
102	62	5
103	63	5
104	64	5
105	4	5
106	2	5
107	3	5
108	1	5
109	19	5
110	17	5
111	18	5
112	16	5
113	20	5
114	24	5
115	22	5
116	23	5
117	21	5
118	65	5
119	14	1
120	5	1
121	38	1
122	26	1
123	8	1
124	15	1
125	39	1
126	40	1
127	41	1
128	42	1
129	43	1
130	28	1
131	44	1
132	9	1
133	45	1
134	25	1
135	46	1
136	47	1
137	48	1
138	49	1
139	50	1
140	51	1
141	52	1
142	53	1
143	54	1
144	55	1
145	56	1
146	6	1
147	7	1
148	57	1
149	10	1
150	58	1
151	12	1
152	13	1
153	11	1
154	27	1
155	59	1
156	60	1
157	61	1
158	62	1
159	63	1
160	64	1
161	4	1
162	2	1
163	3	1
164	1	1
165	19	1
166	17	1
167	18	1
168	16	1
169	20	1
170	24	1
171	22	1
172	23	1
173	21	1
174	65	1
175	66	1
176	67	1
177	68	1
178	69	1
179	70	1
180	71	1
181	29	1
182	32	1
183	31	1
184	37	1
185	36	1
186	34	1
187	30	1
188	33	1
189	35	1
190	72	1
191	73	1
192	74	1
193	75	1
194	76	1
195	77	1
196	78	1
197	79	1
198	80	1
199	81	1
200	82	1
201	83	1
202	84	1
203	85	1
204	86	1
205	87	1
206	88	1
207	89	1
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Viewer
4	User
5	Op
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	admin	admin	admin	pbkdf2:sha256:260000$AK2xUAJ0vQoYCF75$05a59ee0e4d29013ab03ad4289c49b4e80f08f01ff24451ae4463ba20f88bca4	t	admin	2022-08-26 14:02:06.857402	1	0	2022-08-26 14:01:57.908906	2022-08-26 14:01:57.908914	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	Connections
2	DAGs
3	DAG Runs
4	Task Instances
5	Audit Logs
6	ImportError
7	Pools
8	Providers
9	Variables
10	XComs
11	DAG Code
12	Configurations
13	Plugins
14	Roles
15	Permissions
16	Users
17	DAG Dependencies
18	Jobs
19	My Password
20	My Profile
21	SLA Misses
22	Task Logs
23	Website
24	Browse
25	Documentation
26	Docs
27	Admin
28	Task Reschedules
29	Triggers
30	Passwords
31	IndexView
32	UtilView
33	LocaleView
34	AuthDBView
35	List Users
36	Security
37	List Roles
38	User Stats Chart
39	User's Statistics
40	Actions
41	View Menus
42	Resources
43	Permission Views
44	Permission Pairs
45	AutocompleteView
46	Airflow
47	DagDependenciesView
48	RedocView
49	DAG:planes
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.alembic_version (version_num) FROM stdin;
f5fcbda3e651
\.


--
-- Data for Name: callback_request; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.callback_request (id, created_at, priority_weight, callback_data, callback_type, dag_directory) FROM stdin;
\.


--
-- Data for Name: carrier; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.carrier (id, code, title, icao, sirena, iata) FROM stdin;
1	680	Turkish Airlines	THY	\N	TK
2	2543	Nordwind	NWS	КЛ	N4
3	29	ЮТэйр	UTA	ЮТ	UT
4	60780	Азимут	\N	А4	A4
5	26	Аэрофлот	AFL	СУ	SU
6	69	Ямал	LLM	ЛА	YC
7	8565	Россия	\N	ФВ	FV
8	9144	Победа	\N	ДР	DP
9	23	S7 Airlines	\N	С7	S7
10	54	Газпромавиа	\N	ОП	4G
11	617	Red Wings	RWZ	ИН	WZ
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.connection (id, conn_id, conn_type, host, schema, login, password, port, extra, is_encrypted, is_extra_encrypted, description) FROM stdin;
1	airflow_db	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
2	aws_default	aws	\N	\N	\N	\N	\N	\N	f	f	\N
3	azure_batch_default	azure_batch	\N	\N	<ACCOUNT_NAME>	\N	\N	{"account_url": "<ACCOUNT_URL>"}	f	f	\N
4	azure_cosmos_default	azure_cosmos	\N	\N	\N	\N	\N	{"database_name": "<DATABASE_NAME>", "collection_name": "<COLLECTION_NAME>" }	f	f	\N
5	azure_data_explorer_default	azure_data_explorer	https://<CLUSTER>.kusto.windows.net	\N	\N	\N	\N	{"auth_method": "<AAD_APP | AAD_APP_CERT | AAD_CREDS | AAD_DEVICE>",\n                    "tenant": "<TENANT ID>", "certificate": "<APPLICATION PEM CERTIFICATE>",\n                    "thumbprint": "<APPLICATION CERTIFICATE THUMBPRINT>"}	f	f	\N
6	azure_data_lake_default	azure_data_lake	\N	\N	\N	\N	\N	{"tenant": "<TENANT>", "account_name": "<ACCOUNTNAME>" }	f	f	\N
7	azure_default	azure	\N	\N	\N	\N	\N	\N	f	f	\N
8	cassandra_default	cassandra	cassandra	\N	\N	\N	9042	\N	f	f	\N
9	databricks_default	databricks	localhost	\N	\N	\N	\N	\N	f	f	\N
10	dingding_default	http		\N	\N	\N	\N	\N	f	f	\N
11	drill_default	drill	localhost	\N	\N	\N	8047	{"dialect_driver": "drill+sadrill", "storage_plugin": "dfs"}	f	f	\N
12	druid_broker_default	druid	druid-broker	\N	\N	\N	8082	{"endpoint": "druid/v2/sql"}	f	f	\N
13	druid_ingest_default	druid	druid-overlord	\N	\N	\N	8081	{"endpoint": "druid/indexer/v1/task"}	f	f	\N
14	elasticsearch_default	elasticsearch	localhost	http	\N	\N	9200	\N	f	f	\N
15	emr_default	emr	\N	\N	\N	\N	\N	\n                {   "Name": "default_job_flow_name",\n                    "LogUri": "s3://my-emr-log-bucket/default_job_flow_location",\n                    "ReleaseLabel": "emr-4.6.0",\n                    "Instances": {\n                        "Ec2KeyName": "mykey",\n                        "Ec2SubnetId": "somesubnet",\n                        "InstanceGroups": [\n                            {\n                                "Name": "Master nodes",\n                                "Market": "ON_DEMAND",\n                                "InstanceRole": "MASTER",\n                                "InstanceType": "r3.2xlarge",\n                                "InstanceCount": 1\n                            },\n                            {\n                                "Name": "Core nodes",\n                                "Market": "ON_DEMAND",\n                                "InstanceRole": "CORE",\n                                "InstanceType": "r3.2xlarge",\n                                "InstanceCount": 1\n                            }\n                        ],\n                        "TerminationProtected": false,\n                        "KeepJobFlowAliveWhenNoSteps": false\n                    },\n                    "Applications":[\n                        { "Name": "Spark" }\n                    ],\n                    "VisibleToAllUsers": true,\n                    "JobFlowRole": "EMR_EC2_DefaultRole",\n                    "ServiceRole": "EMR_DefaultRole",\n                    "Tags": [\n                        {\n                            "Key": "app",\n                            "Value": "analytics"\n                        },\n                        {\n                            "Key": "environment",\n                            "Value": "development"\n                        }\n                    ]\n                }\n            	f	f	\N
16	facebook_default	facebook_social	\N	\N	\N	\N	\N	\n                {   "account_id": "<AD_ACCOUNT_ID>",\n                    "app_id": "<FACEBOOK_APP_ID>",\n                    "app_secret": "<FACEBOOK_APP_SECRET>",\n                    "access_token": "<FACEBOOK_AD_ACCESS_TOKEN>"\n                }\n            	f	f	\N
17	fs_default	fs	\N	\N	\N	\N	\N	{"path": "/"}	f	f	\N
18	google_cloud_default	google_cloud_platform	\N	default	\N	\N	\N	\N	f	f	\N
19	hive_cli_default	hive_cli	localhost	default	\N	\N	10000	{"use_beeline": true, "auth": ""}	f	f	\N
20	hiveserver2_default	hiveserver2	localhost	default	\N	\N	10000	\N	f	f	\N
21	http_default	http	https://www.httpbin.org/	\N	\N	\N	\N	\N	f	f	\N
22	kubernetes_default	kubernetes	\N	\N	\N	\N	\N	\N	f	f	\N
23	kylin_default	kylin	localhost	\N	ADMIN	KYLIN	7070	\N	f	f	\N
24	leveldb_default	leveldb	localhost	\N	\N	\N	\N	\N	f	f	\N
25	livy_default	livy	livy	\N	\N	\N	8998	\N	f	f	\N
26	local_mysql	mysql	localhost	airflow	airflow	airflow	\N	\N	f	f	\N
27	metastore_default	hive_metastore	localhost	\N	\N	\N	9083	{"authMechanism": "PLAIN"}	f	f	\N
28	mongo_default	mongo	mongo	\N	\N	\N	27017	\N	f	f	\N
29	mssql_default	mssql	localhost	\N	\N	\N	1433	\N	f	f	\N
30	mysql_default	mysql	mysql	airflow	root	\N	\N	\N	f	f	\N
31	opsgenie_default	http		\N	\N	\N	\N	\N	f	f	\N
32	oss_default	oss	\N	\N	\N	\N	\N	{\n                "auth_type": "AK",\n                "access_key_id": "<ACCESS_KEY_ID>",\n                "access_key_secret": "<ACCESS_KEY_SECRET>",\n                "region": "<YOUR_OSS_REGION>"}\n                	f	f	\N
33	pig_cli_default	pig_cli	\N	default	\N	\N	\N	\N	f	f	\N
34	pinot_admin_default	pinot	localhost	\N	\N	\N	9000	\N	f	f	\N
35	pinot_broker_default	pinot	localhost	\N	\N	\N	9000	{"endpoint": "/query", "schema": "http"}	f	f	\N
37	presto_default	presto	localhost	hive	\N	\N	3400	\N	f	f	\N
38	qubole_default	qubole	localhost	\N	\N	\N	\N	\N	f	f	\N
39	redis_default	redis	redis	\N	\N	\N	6379	{"db": 0}	f	f	\N
40	redshift_default	redshift	\N	\N	\N	\N	\N	{\n    "iam": true,\n    "cluster_identifier": "<REDSHIFT_CLUSTER_IDENTIFIER>",\n    "port": 5439,\n    "profile": "default",\n    "db_user": "awsuser",\n    "database": "dev",\n    "region": ""\n}	f	f	\N
41	segment_default	segment	\N	\N	\N	\N	\N	{"write_key": "my-segment-write-key"}	f	f	\N
42	sftp_default	sftp	localhost	\N	airflow	\N	22	{"key_file": "~/.ssh/id_rsa", "no_host_key_check": true}	f	f	\N
43	spark_default	spark	yarn	\N	\N	\N	\N	{"queue": "root.default"}	f	f	\N
44	sqlite_default	sqlite	/tmp/sqlite_default.db	\N	\N	\N	\N	\N	f	f	\N
45	sqoop_default	sqoop	rdbms	\N	\N	\N	\N	\N	f	f	\N
46	ssh_default	ssh	localhost	\N	\N	\N	\N	\N	f	f	\N
47	tableau_default	tableau	https://tableau.server.url	\N	user	password	\N	{"site_id": "my_site"}	f	f	\N
48	trino_default	trino	localhost	hive	\N	\N	3400	\N	f	f	\N
49	vertica_default	vertica	localhost	\N	\N	\N	5433	\N	f	f	\N
50	wasb_default	wasb	\N	\N	\N	\N	\N	{"sas_token": null}	f	f	\N
51	webhdfs_default	hdfs	localhost	\N	\N	\N	50070	\N	f	f	\N
52	yandexcloud_default	yandexcloud	\N	default	\N	\N	\N	\N	f	f	\N
36	postgres_default	postgres	127.0.0.1	tmn_planes	airflow	postgres	5432		f	f	
\.


--
-- Data for Name: dag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag (dag_id, is_paused, is_subdag, is_active, last_parsed_time, last_pickled, last_expired, scheduler_lock, pickle_id, fileloc, owners, description, default_view, schedule_interval, root_dag_id, next_dagrun, next_dagrun_create_after, max_active_tasks, has_task_concurrency_limits, max_active_runs, next_dagrun_data_interval_start, next_dagrun_data_interval_end, has_import_errors, timetable_description) FROM stdin;
planes	f	f	t	2022-08-26 21:05:09.904528+05	\N	\N	\N	\N	/home/user/airflow/dags/tmn_planes.py	airflow	\N	grid	{"type": "timedelta", "attrs": {"days": 1, "seconds": 0, "microseconds": 0}}	\N	2022-08-26 05:00:00+05	2022-08-27 05:00:00+05	16	f	16	2022-08-26 05:00:00+05	2022-08-27 05:00:00+05	f	
\.


--
-- Data for Name: dag_code; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_code (fileloc_hash, fileloc, source_code, last_updated) FROM stdin;
62514996347832164	/home/user/airflow/dags/tmn_planes.py	import datetime as dt\nimport requests\nimport json\nimport logging\n\nfrom pathlib import Path\nfrom airflow.operators.python import PythonOperator\nfrom airflow.providers.postgres.hooks.postgres import PostgresHook\nfrom airflow.models import DAG\n\napi_key = "1dfb2232-8207-4587-a309-46dfb6c9808a"\ntmn_station_code = "s9600384"\nrequested_date = "2022-08-26"\ntransport_type = "plane"\n\ndefault_args = {\n    'owner':'airflow',\n    'start_date':dt.datetime.strptime("2022-08-26",'%Y-%m-%d'),\n    'retries':1,\n    'retry_delay':dt.timedelta(minutes=2),\n}\n\n\njson_folder = Path(Path.home(),"airflow_files")\n\nif not json_folder.exists():\n    json_folder.mkdir()\n\nfile_path = Path(Path.home(),"airflow_files",f"json_{requested_date}.json")\n\ndef get_planes_schedule():\n    params= {\n        "apikey":api_key,\n        "station":tmn_station_code,\n        "date":requested_date,\n        "transport_types":transport_type,\n        "direction":"all"\n    }\n    url_schedule = "https://api.rasp.yandex.net/v3.0/schedule"\n    \n    req = requests.get(url_schedule,params=params)\n    req.raise_for_status()\n\n    with open(file_path,"w",encoding="utf-8") as file_:\n        json.dump(req.json(),file_)\n\ndef load_to_db():\n    \n    def check_station(station_dict:dict) -> int:\n\n        def get_station(code:str,title:str) -> tuple:\n            sql_exists = f"select * from station where code='{code}' and title='{title}'"\n            cursor.execute(sql_exists)\n            return cursor.fetchone()\n\n        station = get_station(station_dict['code'],station_dict['title'])\n\n        if station:\n            station_id = station[0]\n        else:\n            rows = [tuple(station_dict[key] for key in sorted(station_dict.keys())),]\n            fields = sorted(['code','title','station_type','popular_title','short_title','transport_type','station_type_name','obj_type'])\n            hook.insert_rows(\n                table='station',\n                rows=rows,\n                target_fields=fields,\n            )\n            station = get_station(station_dict['code'],station_dict['title'])\n            station_id = station[0]\n\n        return station_id\n\n    def check_carrier(carrier_dict:dict) -> int:\n\n        def get_carrier(code:str,title:str) -> tuple:\n            sql_exists = f"select * from carrier where code='{code}' and title='{title}' "\n            cursor.execute(sql_exists)\n            return cursor.fetchone()\n        \n        carrier_dict['icao'] = carrier_dict['codes'].pop('icao',None)\n        carrier_dict['sirena'] = carrier_dict['codes'].pop('sirena',None)\n        carrier_dict['iata'] = carrier_dict['codes'].pop('iata',None)\n        carrier_dict.pop('codes',None)\n        \n        carrier = get_carrier(carrier_dict['code'],carrier_dict['title'])\n\n        if carrier:\n            carrier_id = carrier[0]\n        else:\n            rows = [tuple(carrier_dict[key] for key in sorted(carrier_dict.keys())),]\n            fields = sorted(['code','icao','sirena','iata','title'])\n            hook.insert_rows(\n                table='carrier',\n                rows=rows,\n                target_fields=fields,\n            )\n            carrier = get_carrier(carrier_dict['code'],carrier_dict['title'])\n            carrier_id = carrier[0]\n\n        return carrier_id\n\n    def check_thread(thread_dict:dict,carrier_id:int) -> int:\n\n        def get_carrier(uid:str,title:str) -> tuple:\n            sql_exists = f"select * from thread where uid='{uid}' and title='{title}' "\n            cursor.execute(sql_exists)\n            return cursor.fetchone()\n\n        thread_dict.pop('transport_subtype',None)\n        thread_dict.pop('express_type',None)\n\n        thread = get_carrier(thread_dict['uid'],thread_dict['title'])\n\n        if thread:\n            thread_id = thread[0]\n        else:\n            rows = [tuple(thread_dict[key] if key != "carrier" else carrier_id for key in sorted(thread_dict.keys())),]\n            fields = sorted(['uid','title','number','short_title','carrier','transport_type','vehicle'])\n            print('check_thread',type(rows),rows,fields)\n            hook.insert_rows(\n                table='thread',\n                rows=rows,\n                target_fields=fields,\n            )\n            thread = get_carrier(thread_dict['uid'],thread_dict['title'])\n            thread_id = thread[0]\n\n        return thread_id\n\n    hook = PostgresHook(postgres_conn_id="postgres_default")\n    conn = hook.get_conn()\n    cursor = conn.cursor()\n\n    with open(file_path,"r") as file_:\n        json_ = json.load(file_)\n\n    json_['station']['obj_type'] = json_['station'].pop("type",'')\n    station_id = check_station(json_['station'])\n    rows = []\n    fields = sorted(['except_days','arrival','thread','is_fuzzy','departure','days','terminal'])\n    fields.append('station')\n    for flight in json_['schedule']:\n        flight.pop('platform',None)\n        flight.pop('stops',None)\n\n        carrier_id = check_carrier(flight['thread']['carrier'])\n        thread_id = check_thread(flight['thread'],carrier_id)\n        flight_params = []\n        for key in sorted(flight.keys()):\n            if key == 'thread':\n                flight_params.append(thread_id)\n            else:\n                flight_params.append(flight[key])\n        flight_params.append(station_id)\n        rows.append(tuple(flight_params)) \n    \n    hook.insert_rows(\n        table='flight',\n        rows=rows,\n        target_fields=fields,\n        )\n\n\nwith DAG(dag_id="planes",default_args=default_args) as dag:\n    get_planes_schedule_data = PythonOperator(\n        task_id="get_planes_schedule",\n        python_callable=get_planes_schedule,\n        dag=dag\n    )\n    load_to_db = PythonOperator(\n        task_id="load_to_db",\n        python_callable=load_to_db,\n        dag=dag\n    )\n    get_planes_schedule_data >> load_to_db	2022-08-26 20:42:16.886384+05
\.


--
-- Data for Name: dag_pickle; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_pickle (id, pickle, created_dttm, pickle_hash) FROM stdin;
\.


--
-- Data for Name: dag_run; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_run (id, dag_id, execution_date, state, run_id, external_trigger, conf, end_date, start_date, run_type, last_scheduling_decision, dag_hash, creating_job_id, queued_at, data_interval_start, data_interval_end, log_template_id) FROM stdin;
1	planes	2022-08-26 16:04:21.222846+05	failed	manual__2022-08-26T11:04:21.222846+00:00	t	\\x80057d942e	2022-08-26 16:38:55.216091+05	2022-08-26 16:04:21.606005+05	manual	2022-08-26 16:38:55.213832+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:04:21.244356+05	2022-08-25 16:04:21.222846+05	2022-08-26 16:04:21.222846+05	2
28	planes	2022-08-26 20:35:10.726625+05	failed	manual__2022-08-26T15:35:10.726625+00:00	t	\\x80057d942e	2022-08-26 20:37:15.744382+05	2022-08-26 20:35:10.930173+05	manual	2022-08-26 20:37:15.741953+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:35:10.754275+05	2022-08-25 20:35:10.726625+05	2022-08-26 20:35:10.726625+05	2
13	planes	2022-08-26 18:13:27.127828+05	success	manual__2022-08-26T13:13:27.127828+00:00	t	\\x80057d942e	2022-08-26 18:13:30.855333+05	2022-08-26 18:13:27.763719+05	manual	2022-08-26 18:13:30.853733+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:13:27.149427+05	2022-08-25 18:13:27.127828+05	2022-08-26 18:13:27.127828+05	2
11	planes	2022-08-26 17:18:50.438914+05	success	manual__2022-08-26T12:18:50.438914+00:00	t	\\x80057d942e	2022-08-26 17:18:54.582167+05	2022-08-26 17:18:50.503525+05	manual	2022-08-26 17:18:54.576387+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 17:18:50.470467+05	2022-08-25 17:18:50.438914+05	2022-08-26 17:18:50.438914+05	2
9	planes	2022-08-26 17:03:10.090438+05	failed	manual__2022-08-26T12:03:10.090438+00:00	t	\\x80057d942e	2022-08-26 17:05:15.93401+05	2022-08-26 17:03:10.891825+05	manual	2022-08-26 17:05:15.9326+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 17:03:10.104947+05	2022-08-25 17:03:10.090438+05	2022-08-26 17:03:10.090438+05	2
20	planes	2022-08-26 18:29:32.272382+05	success	manual__2022-08-26T13:29:32.272382+00:00	t	\\x80057d942e	2022-08-26 18:29:36.187692+05	2022-08-26 18:29:32.743807+05	manual	2022-08-26 18:29:36.183468+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:29:32.308082+05	2022-08-25 18:29:32.272382+05	2022-08-26 18:29:32.272382+05	2
22	planes	2022-08-26 18:31:10.396371+05	success	manual__2022-08-26T13:31:10.396371+00:00	t	\\x80057d942e	2022-08-26 18:33:16.903687+05	2022-08-26 18:31:11.28121+05	manual	2022-08-26 18:33:16.902019+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:31:10.412437+05	2022-08-25 18:31:10.396371+05	2022-08-26 18:31:10.396371+05	2
7	planes	2022-08-26 16:53:17.284767+05	failed	manual__2022-08-26T11:53:17.284767+00:00	t	\\x80057d942e	2022-08-26 16:55:21.562929+05	2022-08-26 16:53:18.212185+05	manual	2022-08-26 16:55:21.560985+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:53:17.319562+05	2022-08-25 16:53:17.284767+05	2022-08-26 16:53:17.284767+05	2
14	planes	2022-08-26 18:15:42.790326+05	success	manual__2022-08-26T13:15:42.790326+00:00	t	\\x80057d942e	2022-08-26 18:15:46.260234+05	2022-08-26 18:15:43.262942+05	manual	2022-08-26 18:15:46.257831+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:15:42.7975+05	2022-08-25 18:15:42.790326+05	2022-08-26 18:15:42.790326+05	2
3	planes	2022-08-26 16:44:21.625864+05	success	manual__2022-08-26T11:44:21.625864+00:00	t	\\x80057d942e	2022-08-26 16:46:26.852575+05	2022-08-26 16:44:22.365641+05	manual	2022-08-26 16:46:26.850895+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:44:21.660555+05	2022-08-25 16:44:21.625864+05	2022-08-26 16:44:21.625864+05	2
23	planes	2022-08-26 20:27:18.364898+05	failed	manual__2022-08-26T15:27:18.364898+00:00	t	\\x80057d942e	2022-08-26 20:29:25.36698+05	2022-08-26 20:27:19.196951+05	manual	2022-08-26 20:29:25.364128+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:27:18.402038+05	2022-08-25 20:27:18.364898+05	2022-08-26 20:27:18.364898+05	2
21	planes	2022-08-26 18:30:02.555769+05	success	manual__2022-08-26T13:30:02.555769+00:00	t	\\x80057d942e	2022-08-26 18:30:08.253335+05	2022-08-26 18:30:03.061001+05	manual	2022-08-26 18:30:08.2497+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:30:02.567428+05	2022-08-25 18:30:02.555769+05	2022-08-26 18:30:02.555769+05	2
6	planes	2022-08-26 16:51:50.4447+05	success	manual__2022-08-26T11:51:50.444700+00:00	t	\\x80057d942e	2022-08-26 16:51:54.620831+05	2022-08-26 16:51:51.188446+05	manual	2022-08-26 16:51:54.613627+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:51:50.451209+05	2022-08-25 16:51:50.4447+05	2022-08-26 16:51:50.4447+05	2
15	planes	2022-08-26 18:16:51.196262+05	success	manual__2022-08-26T13:16:51.196262+00:00	t	\\x80057d942e	2022-08-26 18:16:55.755577+05	2022-08-26 18:16:51.730224+05	manual	2022-08-26 18:16:55.752129+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:16:51.233092+05	2022-08-25 18:16:51.196262+05	2022-08-26 18:16:51.196262+05	2
16	planes	2022-08-26 18:20:03.122726+05	success	manual__2022-08-26T13:20:03.122726+00:00	t	\\x80057d942e	2022-08-26 18:20:08.762653+05	2022-08-26 18:20:03.844629+05	manual	2022-08-26 18:20:08.760564+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:20:03.131982+05	2022-08-25 18:20:03.122726+05	2022-08-26 18:20:03.122726+05	2
17	planes	2022-08-26 18:21:01.210179+05	success	manual__2022-08-26T13:21:01.210179+00:00	t	\\x80057d942e	2022-08-26 18:21:04.900792+05	2022-08-26 18:21:01.393165+05	manual	2022-08-26 18:21:04.899189+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:21:01.22386+05	2022-08-25 18:21:01.210179+05	2022-08-26 18:21:01.210179+05	2
18	planes	2022-08-26 18:24:47.710684+05	failed	manual__2022-08-26T13:24:47.710684+00:00	t	\\x80057d942e	2022-08-26 18:26:52.659642+05	2022-08-26 18:24:48.117067+05	manual	2022-08-26 18:26:52.657268+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:24:47.720936+05	2022-08-25 18:24:47.710684+05	2022-08-26 18:24:47.710684+05	2
5	planes	2022-08-26 16:45:49.235993+05	success	manual__2022-08-26T11:45:49.235993+00:00	t	\\x80057d942e	2022-08-26 16:45:53.432955+05	2022-08-26 16:45:49.775228+05	manual	2022-08-26 16:45:53.431339+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:45:49.242922+05	2022-08-25 16:45:49.235993+05	2022-08-26 16:45:49.235993+05	2
10	planes	2022-08-26 17:06:52.459161+05	failed	manual__2022-08-26T12:06:52.459161+00:00	t	\\x80057d942e	2022-08-26 17:08:57.282679+05	2022-08-26 17:06:53.226094+05	manual	2022-08-26 17:08:57.280259+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 17:06:52.482579+05	2022-08-25 17:06:52.459161+05	2022-08-26 17:06:52.459161+05	2
4	planes	2022-08-26 16:44:58.600282+05	success	manual__2022-08-26T11:44:58.600282+00:00	t	\\x80057d942e	2022-08-26 16:45:02.51335+05	2022-08-26 16:44:59.314252+05	manual	2022-08-26 16:45:02.511418+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:44:58.631981+05	2022-08-25 16:44:58.600282+05	2022-08-26 16:44:58.600282+05	2
24	planes	2022-08-26 20:29:46.604154+05	failed	manual__2022-08-26T15:29:46.604154+00:00	t	\\x80057d942e	2022-08-26 20:31:52.352377+05	2022-08-26 20:29:47.589287+05	manual	2022-08-26 20:31:52.343802+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:29:46.611054+05	2022-08-25 20:29:46.604154+05	2022-08-26 20:29:46.604154+05	2
8	planes	2022-08-26 16:57:59.589672+05	failed	manual__2022-08-26T11:57:59.589672+00:00	t	\\x80057d942e	2022-08-26 17:00:04.200741+05	2022-08-26 16:58:00.167621+05	manual	2022-08-26 17:00:04.198791+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:57:59.596289+05	2022-08-25 16:57:59.589672+05	2022-08-26 16:57:59.589672+05	2
19	planes	2022-08-26 18:28:47.097572+05	success	manual__2022-08-26T13:28:47.097572+00:00	t	\\x80057d942e	2022-08-26 18:28:50.674481+05	2022-08-26 18:28:47.298328+05	manual	2022-08-26 18:28:50.671643+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:28:47.109318+05	2022-08-25 18:28:47.097572+05	2022-08-26 18:28:47.097572+05	2
2	planes	2022-08-26 16:39:00.809769+05	failed	manual__2022-08-26T11:39:00.809769+00:00	t	\\x80057d942e	2022-08-26 16:41:07.361007+05	2022-08-26 16:39:01.813402+05	manual	2022-08-26 16:41:07.357169+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 16:39:00.863539+05	2022-08-25 16:39:00.809769+05	2022-08-26 16:39:00.809769+05	2
12	planes	2022-08-26 18:10:01.159151+05	failed	manual__2022-08-26T13:10:01.159151+00:00	t	\\x80057d942e	2022-08-26 18:12:06.470653+05	2022-08-26 18:10:01.855863+05	manual	2022-08-26 18:12:06.46873+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 18:10:01.195472+05	2022-08-25 18:10:01.159151+05	2022-08-26 18:10:01.159151+05	2
29	planes	2022-08-26 20:39:56.605409+05	success	manual__2022-08-26T15:39:56.605409+00:00	t	\\x80057d942e	2022-08-26 20:42:01.732059+05	2022-08-26 20:39:56.790794+05	manual	2022-08-26 20:42:01.730241+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:39:56.615497+05	2022-08-25 20:39:56.605409+05	2022-08-26 20:39:56.605409+05	2
30	planes	2022-08-26 20:40:45.547399+05	success	manual__2022-08-26T15:40:45.547399+00:00	t	\\x80057d942e	2022-08-26 20:40:52.039037+05	2022-08-26 20:40:46.601773+05	manual	2022-08-26 20:40:52.037001+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:40:45.580921+05	2022-08-25 20:40:45.547399+05	2022-08-26 20:40:45.547399+05	2
26	planes	2022-08-26 20:32:55.654241+05	failed	manual__2022-08-26T15:32:55.654241+00:00	t	\\x80057d942e	2022-08-26 20:35:01.148608+05	2022-08-26 20:32:56.199395+05	manual	2022-08-26 20:35:01.147138+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:32:55.675283+05	2022-08-25 20:32:55.654241+05	2022-08-26 20:32:55.654241+05	2
27	planes	2022-08-26 20:33:52.68446+05	failed	manual__2022-08-26T15:33:52.684460+00:00	t	\\x80057d942e	2022-08-26 20:35:58.199762+05	2022-08-26 20:33:53.281011+05	manual	2022-08-26 20:35:58.197442+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:33:52.737624+05	2022-08-25 20:33:52.68446+05	2022-08-26 20:33:52.68446+05	2
25	planes	2022-08-26 20:31:53.538558+05	failed	manual__2022-08-26T15:31:53.538558+00:00	t	\\x80057d942e	2022-08-26 20:33:58.7749+05	2022-08-26 20:31:54.517024+05	manual	2022-08-26 20:33:58.773203+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N	2022-08-26 20:31:53.54611+05	2022-08-25 20:31:53.538558+05	2022-08-26 20:31:53.538558+05	2
\.


--
-- Data for Name: dag_tag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_tag (name, dag_id) FROM stdin;
\.


--
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.flight (id, except_days, thread, is_fuzzy, departure, days, terminal, arrival, station) FROM stdin;
1	\N	1	f	2022-08-26 03:05:00+05	пн, вт, пт по 10.10	\N	\N	8
2	\N	2	f	2022-08-26 04:05:00+05	26 августа	\N	\N	8
3	\N	3	f	2022-08-26 05:20:00+05	26 августа, 17 сентября	\N	\N	8
4	\N	4	f	2022-08-26 05:20:00+05	пн, вт, пт по 28.10, кроме 30.08, 06.09, 13.09	\N	\N	8
5	\N	5	f	2022-08-26 05:25:00+05	ежедневно по 23.01, кроме 30.08	\N	\N	8
6	\N	6	f	2022-08-26 05:40:00+05	26 августа, 2, 9, 16, 23, 30 сентября	\N	\N	8
7	\N	7	f	2022-08-26 05:45:00+05	ежедневно по 23.01, кроме 30.10, 01.01	\N	\N	8
8	\N	8	f	2022-08-26 06:00:00+05	ежедневно по 01.10	\N	\N	8
9	\N	9	f	2022-08-26 06:05:00+05	ежедневно, кроме ср, вс по 23.01	\N	\N	8
10	\N	10	f	2022-08-26 06:15:00+05	ежедневно по 02.10, кроме 28.08	\N	\N	8
11	\N	11	f	2022-08-26 06:55:00+05	ежедневно по 29.10	\N	\N	8
12	\N	12	f	2022-08-26 07:00:00+05	26, 27, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
13	\N	13	f	2022-08-26 07:10:00+05	ежедневно по 23.01, кроме 04.09, 18.09, 02.10	\N	\N	8
14	\N	14	f	2022-08-26 07:15:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
15	\N	15	f	2022-08-26 07:20:00+05	пн, ср, чт, пт по 15.09	\N	\N	8
16	\N	16	f	2022-08-26 07:25:00+05	ежедневно по 30.10, кроме 28.08	\N	\N	8
17	\N	17	f	2022-08-26 07:30:00+05	ежедневно, кроме вс по 31.12	\N	\N	8
18	\N	18	f	2022-08-26 07:45:00+05	ежедневно по 23.01	\N	\N	8
19	\N	19	f	2022-08-26 07:50:00+05	ежедневно, кроме пн, сб по 30.12	\N	\N	8
20	\N	20	f	2022-08-26 07:55:00+05	пн, пт по 28.10	\N	\N	8
21	\N	21	f	2022-08-26 08:05:00+05		A	\N	8
22	\N	22	f	2022-08-26 08:10:00+05	пт по 28.10	\N	\N	8
23	\N	23	f	2022-08-26 08:20:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
24	\N	24	f	2022-08-26 08:30:00+05	26, 27, 29, 31 августа	\N	\N	8
25	\N	25	f	2022-08-26 09:10:00+05	пт по 30.12	\N	\N	8
26	\N	26	f	2022-08-26 10:30:00+05	пт по 20.01	\N	\N	8
27	\N	27	f	2022-08-26 12:40:00+05	26 августа	\N	\N	8
28	\N	28	f	2022-08-26 14:05:00+05	ежедневно по 29.10	\N	\N	8
29	\N	29	f	2022-08-26 15:20:00+05	26, 28, 29 августа	\N	\N	8
30	\N	30	f	2022-08-26 15:40:00+05	ежедневно по 29.10, кроме 02.10	\N	\N	8
31	\N	31	f	2022-08-26 16:00:00+05	пт по 20.01	\N	\N	8
32	\N	32	f	2022-08-26 16:45:00+05	26 августа, 17 сентября, 9, 31 октября, 22 ноября, 14 декабря	\N	\N	8
33	\N	33	f	2022-08-26 17:10:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 октября, …	\N	\N	8
34	\N	34	f	2022-08-26 17:45:00+05	пт по 20.01	\N	\N	8
35	\N	35	f	2022-08-26 18:00:00+05	26, 27, 29, 30, 31 августа, 1, 2, 5, 7, 8, 9, 12, 14, 15, 16, 19, 21, 22, 23, 26 сентября, …	\N	\N	8
36	\N	36	f	2022-08-26 18:50:00+05	ср, пт по 20.01	\N	\N	8
37	\N	37	f	2022-08-26 18:55:00+05	26, 27, 28, 29, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 сентября, …	\N	\N	8
38	\N	38	f	2022-08-26 19:55:00+05	26, 27, 28, 29, 30, 31 августа	\N	\N	8
39	\N	39	f	2022-08-26 21:15:00+05	пт по 28.10	\N	\N	8
40	\N	40	f	2022-08-26 21:30:00+05	ежедневно по 23.01	\N	\N	8
41	\N	41	f	2022-08-26 23:40:00+05	26, 27, 28, 29, 30, 31 августа, 1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 14, 15, 16, 18 сентября, …	\N	\N	8
42	\N	1	f	2022-08-26 03:05:00+05	пн, вт, пт по 10.10	\N	\N	8
43	\N	2	f	2022-08-26 04:05:00+05	26 августа	\N	\N	8
44	\N	3	f	2022-08-26 05:20:00+05	26 августа, 17 сентября	\N	\N	8
45	\N	4	f	2022-08-26 05:20:00+05	пн, вт, пт по 28.10, кроме 30.08, 06.09, 13.09	\N	\N	8
46	\N	5	f	2022-08-26 05:25:00+05	ежедневно по 23.01, кроме 30.08	\N	\N	8
47	\N	6	f	2022-08-26 05:40:00+05	26 августа, 2, 9, 16, 23, 30 сентября	\N	\N	8
48	\N	7	f	2022-08-26 05:45:00+05	ежедневно по 23.01, кроме 30.10, 01.01	\N	\N	8
49	\N	8	f	2022-08-26 06:00:00+05	ежедневно по 01.10	\N	\N	8
50	\N	9	f	2022-08-26 06:05:00+05	ежедневно, кроме ср, вс по 23.01	\N	\N	8
51	\N	10	f	2022-08-26 06:15:00+05	ежедневно по 02.10, кроме 28.08	\N	\N	8
52	\N	11	f	2022-08-26 06:55:00+05	ежедневно по 29.10	\N	\N	8
53	\N	12	f	2022-08-26 07:00:00+05	26, 27, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
54	\N	13	f	2022-08-26 07:10:00+05	ежедневно по 23.01, кроме 04.09, 18.09, 02.10	\N	\N	8
55	\N	14	f	2022-08-26 07:15:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
56	\N	15	f	2022-08-26 07:20:00+05	пн, ср, чт, пт по 15.09	\N	\N	8
57	\N	16	f	2022-08-26 07:25:00+05	ежедневно по 30.10, кроме 28.08	\N	\N	8
58	\N	17	f	2022-08-26 07:30:00+05	ежедневно, кроме вс по 31.12	\N	\N	8
59	\N	18	f	2022-08-26 07:45:00+05	ежедневно по 23.01	\N	\N	8
60	\N	19	f	2022-08-26 07:50:00+05	ежедневно, кроме пн, сб по 30.12	\N	\N	8
61	\N	20	f	2022-08-26 07:55:00+05	пн, пт по 28.10	\N	\N	8
62	\N	21	f	2022-08-26 08:05:00+05		A	\N	8
63	\N	22	f	2022-08-26 08:10:00+05	пт по 28.10	\N	\N	8
64	\N	23	f	2022-08-26 08:20:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17 сентября, …	\N	\N	8
65	\N	24	f	2022-08-26 08:30:00+05	26, 27, 29, 31 августа	\N	\N	8
66	\N	25	f	2022-08-26 09:10:00+05	пт по 30.12	\N	\N	8
67	\N	26	f	2022-08-26 10:30:00+05	пт по 20.01	\N	\N	8
68	\N	27	f	2022-08-26 12:40:00+05	26 августа	\N	\N	8
69	\N	28	f	2022-08-26 14:05:00+05	ежедневно по 29.10	\N	\N	8
70	\N	29	f	2022-08-26 15:20:00+05	26, 28, 29 августа	\N	\N	8
71	\N	30	f	2022-08-26 15:40:00+05	ежедневно по 29.10, кроме 02.10	\N	\N	8
72	\N	31	f	2022-08-26 16:00:00+05	пт по 20.01	\N	\N	8
73	\N	32	f	2022-08-26 16:45:00+05	26 августа, 17 сентября, 9, 31 октября, 22 ноября, 14 декабря	\N	\N	8
74	\N	33	f	2022-08-26 17:10:00+05	26, 27, 29, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 октября, …	\N	\N	8
75	\N	34	f	2022-08-26 17:45:00+05	пт по 20.01	\N	\N	8
76	\N	35	f	2022-08-26 18:00:00+05	26, 27, 29, 30, 31 августа, 1, 2, 5, 7, 8, 9, 12, 14, 15, 16, 19, 21, 22, 23, 26 сентября, …	\N	\N	8
77	\N	36	f	2022-08-26 18:50:00+05	ср, пт по 20.01	\N	\N	8
78	\N	37	f	2022-08-26 18:55:00+05	26, 27, 28, 29, 30, 31 августа, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 сентября, …	\N	\N	8
79	\N	38	f	2022-08-26 19:55:00+05	26, 27, 28, 29, 30, 31 августа	\N	\N	8
80	\N	39	f	2022-08-26 21:15:00+05	пт по 28.10	\N	\N	8
81	\N	40	f	2022-08-26 21:30:00+05	ежедневно по 23.01	\N	\N	8
82	\N	41	f	2022-08-26 23:40:00+05	26, 27, 28, 29, 30, 31 августа, 1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 14, 15, 16, 18 сентября, …	\N	\N	8
\.


--
-- Data for Name: import_error; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.import_error (id, "timestamp", filename, stacktrace) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.job (id, dag_id, state, job_type, start_date, end_date, latest_heartbeat, executor_class, hostname, unixname) FROM stdin;
54	planes	success	LocalTaskJob	2022-08-26 18:31:11.734415+05	2022-08-26 18:31:14.05781+05	2022-08-26 18:31:11.734426+05	LocalExecutor	user-VirtualBox	user
19	planes	success	LocalTaskJob	2022-08-26 16:55:20.692596+05	2022-08-26 16:55:21.030191+05	2022-08-26 16:55:20.692602+05	LocalExecutor	user-VirtualBox	user
25	planes	success	LocalTaskJob	2022-08-26 17:05:15.011331+05	2022-08-26 17:05:15.355995+05	2022-08-26 17:05:15.011355+05	LocalExecutor	user-VirtualBox	user
55	planes	success	LocalTaskJob	2022-08-26 18:31:14.501784+05	2022-08-26 18:31:15.270176+05	2022-08-26 18:31:14.501793+05	LocalExecutor	user-VirtualBox	user
12	planes	success	LocalTaskJob	2022-08-26 16:45:50.129831+05	2022-08-26 16:45:51.26909+05	2022-08-26 16:45:50.129838+05	LocalExecutor	user-VirtualBox	user
13	planes	success	LocalTaskJob	2022-08-26 16:45:52.481928+05	2022-08-26 16:45:52.936225+05	2022-08-26 16:45:52.481935+05	LocalExecutor	user-VirtualBox	user
39	planes	success	LocalTaskJob	2022-08-26 18:16:52.20885+05	2022-08-26 18:16:53.763732+05	2022-08-26 18:16:52.20886+05	LocalExecutor	user-VirtualBox	user
1	\N	success	SchedulerJob	2022-08-26 14:02:43.094266+05	2022-08-26 17:06:16.133776+05	2022-08-26 17:05:55.361151+05	LocalExecutor	user-VirtualBox	user
47	planes	success	LocalTaskJob	2022-08-26 18:26:51.763696+05	2022-08-26 18:26:52.195745+05	2022-08-26 18:26:51.763703+05	LocalExecutor	user-VirtualBox	user
34	planes	success	LocalTaskJob	2022-08-26 18:12:05.571258+05	2022-08-26 18:12:05.900294+05	2022-08-26 18:12:05.571265+05	LocalExecutor	user-VirtualBox	user
40	planes	success	LocalTaskJob	2022-08-26 18:16:54.87899+05	2022-08-26 18:16:55.545218+05	2022-08-26 18:16:54.878999+05	LocalExecutor	user-VirtualBox	user
2	planes	success	LocalTaskJob	2022-08-26 16:04:22.034348+05	2022-08-26 16:04:23.346015+05	2022-08-26 16:04:22.034357+05	LocalExecutor	user-VirtualBox	user
3	planes	success	LocalTaskJob	2022-08-26 16:04:24.089342+05	2022-08-26 16:04:24.471676+05	2022-08-26 16:04:24.08935+05	LocalExecutor	user-VirtualBox	user
27	planes	success	LocalTaskJob	2022-08-26 17:06:53.617284+05	2022-08-26 17:06:54.830626+05	2022-08-26 17:06:53.617293+05	LocalExecutor	user-VirtualBox	user
14	planes	success	LocalTaskJob	2022-08-26 16:46:26.018313+05	2022-08-26 16:46:26.614893+05	2022-08-26 16:46:26.018319+05	LocalExecutor	user-VirtualBox	user
4	planes	success	LocalTaskJob	2022-08-26 16:38:54.218243+05	2022-08-26 16:38:54.714906+05	2022-08-26 16:38:54.218251+05	LocalExecutor	user-VirtualBox	user
28	planes	success	LocalTaskJob	2022-08-26 17:06:55.697168+05	2022-08-26 17:06:56.049217+05	2022-08-26 17:06:55.697176+05	LocalExecutor	user-VirtualBox	user
5	planes	success	LocalTaskJob	2022-08-26 16:39:02.332781+05	2022-08-26 16:39:05.769145+05	2022-08-26 16:39:02.33279+05	LocalExecutor	user-VirtualBox	user
15	planes	success	LocalTaskJob	2022-08-26 16:51:51.608681+05	2022-08-26 16:51:52.948111+05	2022-08-26 16:51:51.60869+05	LocalExecutor	user-VirtualBox	user
6	planes	success	LocalTaskJob	2022-08-26 16:39:06.121422+05	2022-08-26 16:39:06.468759+05	2022-08-26 16:39:06.12284+05	LocalExecutor	user-VirtualBox	user
16	planes	success	LocalTaskJob	2022-08-26 16:51:53.679182+05	2022-08-26 16:51:54.099283+05	2022-08-26 16:51:53.679189+05	LocalExecutor	user-VirtualBox	user
62	planes	success	LocalTaskJob	2022-08-26 20:31:51.580526+05	2022-08-26 20:31:52.355531+05	2022-08-26 20:31:51.580542+05	LocalExecutor	user-VirtualBox	user
8	planes	success	LocalTaskJob	2022-08-26 16:44:22.739853+05	2022-08-26 16:44:24.115843+05	2022-08-26 16:44:22.739863+05	LocalExecutor	user-VirtualBox	user
63	planes	success	LocalTaskJob	2022-08-26 20:31:55.003671+05	2022-08-26 20:31:56.179161+05	2022-08-26 20:31:55.003679+05	LocalExecutor	user-VirtualBox	user
35	planes	success	LocalTaskJob	2022-08-26 18:13:28.152929+05	2022-08-26 18:13:29.414611+05	2022-08-26 18:13:28.152939+05	LocalExecutor	user-VirtualBox	user
9	planes	success	LocalTaskJob	2022-08-26 16:44:24.650091+05	2022-08-26 16:44:25.238714+05	2022-08-26 16:44:24.6501+05	LocalExecutor	user-VirtualBox	user
20	planes	success	LocalTaskJob	2022-08-26 16:58:00.543212+05	2022-08-26 16:58:02.217217+05	2022-08-26 16:58:00.543219+05	LocalExecutor	user-VirtualBox	user
21	planes	success	LocalTaskJob	2022-08-26 16:58:02.638274+05	2022-08-26 16:58:03.155519+05	2022-08-26 16:58:02.638283+05	LocalExecutor	user-VirtualBox	user
36	planes	success	LocalTaskJob	2022-08-26 18:13:29.910811+05	2022-08-26 18:13:30.301505+05	2022-08-26 18:13:29.910819+05	LocalExecutor	user-VirtualBox	user
17	planes	success	LocalTaskJob	2022-08-26 16:53:18.568799+05	2022-08-26 16:53:19.728265+05	2022-08-26 16:53:18.568809+05	LocalExecutor	user-VirtualBox	user
23	planes	success	LocalTaskJob	2022-08-26 17:03:11.343787+05	2022-08-26 17:03:13.388457+05	2022-08-26 17:03:11.343795+05	LocalExecutor	user-VirtualBox	user
18	planes	success	LocalTaskJob	2022-08-26 16:53:20.183006+05	2022-08-26 16:53:20.513234+05	2022-08-26 16:53:20.183013+05	LocalExecutor	user-VirtualBox	user
30	planes	success	LocalTaskJob	2022-08-26 17:18:50.819338+05	2022-08-26 17:18:53.041948+05	2022-08-26 17:18:50.819347+05	LocalExecutor	user-VirtualBox	user
7	planes	success	LocalTaskJob	2022-08-26 16:41:07.122636+05	2022-08-26 16:41:07.397953+05	2022-08-26 16:41:07.122642+05	LocalExecutor	user-VirtualBox	user
10	planes	success	LocalTaskJob	2022-08-26 16:44:59.872114+05	2022-08-26 16:45:01.005719+05	2022-08-26 16:44:59.872124+05	LocalExecutor	user-VirtualBox	user
24	planes	success	LocalTaskJob	2022-08-26 17:03:14.024658+05	2022-08-26 17:03:14.377754+05	2022-08-26 17:03:14.024673+05	LocalExecutor	user-VirtualBox	user
11	planes	success	LocalTaskJob	2022-08-26 16:45:01.562828+05	2022-08-26 16:45:01.881059+05	2022-08-26 16:45:01.562836+05	LocalExecutor	user-VirtualBox	user
31	planes	success	LocalTaskJob	2022-08-26 17:18:53.955174+05	2022-08-26 17:18:54.34212+05	2022-08-26 17:18:53.955183+05	LocalExecutor	user-VirtualBox	user
56	planes	success	LocalTaskJob	2022-08-26 18:33:16.007905+05	2022-08-26 18:33:16.303163+05	2022-08-26 18:33:16.007914+05	LocalExecutor	user-VirtualBox	user
29	planes	success	LocalTaskJob	2022-08-26 17:08:56.371346+05	2022-08-26 17:08:56.85746+05	2022-08-26 17:08:56.371355+05	LocalExecutor	user-VirtualBox	user
48	planes	success	LocalTaskJob	2022-08-26 18:28:47.648881+05	2022-08-26 18:28:49.511203+05	2022-08-26 18:28:47.648893+05	LocalExecutor	user-VirtualBox	user
49	planes	success	LocalTaskJob	2022-08-26 18:28:49.784571+05	2022-08-26 18:28:50.248576+05	2022-08-26 18:28:49.784583+05	LocalExecutor	user-VirtualBox	user
32	planes	success	LocalTaskJob	2022-08-26 18:10:02.341063+05	2022-08-26 18:10:03.954709+05	2022-08-26 18:10:02.341078+05	LocalExecutor	user-VirtualBox	user
33	planes	success	LocalTaskJob	2022-08-26 18:10:04.976384+05	2022-08-26 18:10:05.368941+05	2022-08-26 18:10:04.976392+05	LocalExecutor	user-VirtualBox	user
45	planes	success	LocalTaskJob	2022-08-26 18:24:48.463579+05	2022-08-26 18:24:49.950789+05	2022-08-26 18:24:48.463588+05	LocalExecutor	user-VirtualBox	user
57	planes	success	LocalTaskJob	2022-08-26 20:27:19.622502+05	2022-08-26 20:27:23.02005+05	2022-08-26 20:27:19.622508+05	LocalExecutor	user-VirtualBox	user
22	planes	success	LocalTaskJob	2022-08-26 17:00:03.490565+05	2022-08-26 17:00:03.874309+05	2022-08-26 17:00:03.490581+05	LocalExecutor	user-VirtualBox	user
46	planes	success	LocalTaskJob	2022-08-26 18:24:50.822305+05	2022-08-26 18:24:51.31332+05	2022-08-26 18:24:50.822316+05	LocalExecutor	user-VirtualBox	user
58	planes	success	LocalTaskJob	2022-08-26 20:27:23.385914+05	2022-08-26 20:27:23.733039+05	2022-08-26 20:27:23.38593+05	LocalExecutor	user-VirtualBox	user
41	planes	success	LocalTaskJob	2022-08-26 18:20:04.324834+05	2022-08-26 18:20:07.12428+05	2022-08-26 18:20:04.324852+05	LocalExecutor	user-VirtualBox	user
50	planes	success	LocalTaskJob	2022-08-26 18:29:33.068787+05	2022-08-26 18:29:34.267405+05	2022-08-26 18:29:33.068797+05	LocalExecutor	user-VirtualBox	user
42	planes	success	LocalTaskJob	2022-08-26 18:20:07.855245+05	2022-08-26 18:20:08.187604+05	2022-08-26 18:20:07.855253+05	LocalExecutor	user-VirtualBox	user
51	planes	success	LocalTaskJob	2022-08-26 18:29:35.277087+05	2022-08-26 18:29:35.847009+05	2022-08-26 18:29:35.277098+05	LocalExecutor	user-VirtualBox	user
37	planes	success	LocalTaskJob	2022-08-26 18:15:43.596612+05	2022-08-26 18:15:44.835306+05	2022-08-26 18:15:43.59662+05	LocalExecutor	user-VirtualBox	user
38	planes	success	LocalTaskJob	2022-08-26 18:15:45.773779+05	2022-08-26 18:15:46.288966+05	2022-08-26 18:15:45.773789+05	LocalExecutor	user-VirtualBox	user
52	planes	success	LocalTaskJob	2022-08-26 18:30:03.395172+05	2022-08-26 18:30:06.484688+05	2022-08-26 18:30:03.395187+05	LocalExecutor	user-VirtualBox	user
43	planes	success	LocalTaskJob	2022-08-26 18:21:01.791081+05	2022-08-26 18:21:03.201938+05	2022-08-26 18:21:01.79109+05	LocalExecutor	user-VirtualBox	user
53	planes	success	LocalTaskJob	2022-08-26 18:30:06.863946+05	2022-08-26 18:30:07.350802+05	2022-08-26 18:30:06.863952+05	LocalExecutor	user-VirtualBox	user
44	planes	success	LocalTaskJob	2022-08-26 18:21:04.019414+05	2022-08-26 18:21:04.37303+05	2022-08-26 18:21:04.019422+05	LocalExecutor	user-VirtualBox	user
59	planes	success	LocalTaskJob	2022-08-26 20:29:24.247208+05	2022-08-26 20:29:24.615255+05	2022-08-26 20:29:24.247216+05	LocalExecutor	user-VirtualBox	user
60	planes	success	LocalTaskJob	2022-08-26 20:29:47.984933+05	2022-08-26 20:29:49.344914+05	2022-08-26 20:29:47.984943+05	LocalExecutor	user-VirtualBox	user
61	planes	success	LocalTaskJob	2022-08-26 20:29:49.78227+05	2022-08-26 20:29:50.579755+05	2022-08-26 20:29:49.782279+05	LocalExecutor	user-VirtualBox	user
71	planes	success	LocalTaskJob	2022-08-26 20:35:11.463231+05	2022-08-26 20:35:12.781244+05	2022-08-26 20:35:11.46324+05	LocalExecutor	user-VirtualBox	user
64	planes	success	LocalTaskJob	2022-08-26 20:31:56.499596+05	2022-08-26 20:31:56.903653+05	2022-08-26 20:31:56.499604+05	LocalExecutor	user-VirtualBox	user
72	planes	success	LocalTaskJob	2022-08-26 20:35:13.901019+05	2022-08-26 20:35:14.551632+05	2022-08-26 20:35:13.901028+05	LocalExecutor	user-VirtualBox	user
77	planes	success	LocalTaskJob	2022-08-26 20:40:47.096541+05	2022-08-26 20:40:48.22842+05	2022-08-26 20:40:47.096553+05	LocalExecutor	user-VirtualBox	user
73	planes	success	LocalTaskJob	2022-08-26 20:35:57.312244+05	2022-08-26 20:35:57.826386+05	2022-08-26 20:35:57.312252+05	LocalExecutor	user-VirtualBox	user
78	planes	success	LocalTaskJob	2022-08-26 20:40:48.761734+05	2022-08-26 20:40:51.724042+05	2022-08-26 20:40:48.761742+05	LocalExecutor	user-VirtualBox	user
65	planes	success	LocalTaskJob	2022-08-26 20:32:56.612243+05	2022-08-26 20:32:57.92366+05	2022-08-26 20:32:56.612256+05	LocalExecutor	user-VirtualBox	user
66	planes	success	LocalTaskJob	2022-08-26 20:32:58.68744+05	2022-08-26 20:32:59.206985+05	2022-08-26 20:32:58.687447+05	LocalExecutor	user-VirtualBox	user
26	\N	running	SchedulerJob	2022-08-26 17:06:36.69934+05	\N	2022-08-26 21:05:04.90183+05	LocalExecutor	user-VirtualBox	user
74	planes	success	LocalTaskJob	2022-08-26 20:37:15.175748+05	2022-08-26 20:37:15.649069+05	2022-08-26 20:37:15.175757+05	LocalExecutor	user-VirtualBox	user
67	planes	success	LocalTaskJob	2022-08-26 20:33:53.634199+05	2022-08-26 20:33:54.83526+05	2022-08-26 20:33:53.634207+05	LocalExecutor	user-VirtualBox	user
79	planes	success	LocalTaskJob	2022-08-26 20:42:00.855912+05	2022-08-26 20:42:01.228023+05	2022-08-26 20:42:00.855921+05	LocalExecutor	user-VirtualBox	user
68	planes	success	LocalTaskJob	2022-08-26 20:33:56.237836+05	2022-08-26 20:33:57.024125+05	2022-08-26 20:33:56.237846+05	LocalExecutor	user-VirtualBox	user
69	planes	success	LocalTaskJob	2022-08-26 20:33:57.822699+05	2022-08-26 20:33:58.381065+05	2022-08-26 20:33:57.822706+05	LocalExecutor	user-VirtualBox	user
70	planes	success	LocalTaskJob	2022-08-26 20:34:59.953467+05	2022-08-26 20:35:00.380202+05	2022-08-26 20:34:59.953476+05	LocalExecutor	user-VirtualBox	user
75	planes	success	LocalTaskJob	2022-08-26 20:39:57.189761+05	2022-08-26 20:39:59.034664+05	2022-08-26 20:39:57.189771+05	LocalExecutor	user-VirtualBox	user
76	planes	success	LocalTaskJob	2022-08-26 20:39:59.785003+05	2022-08-26 20:40:00.48078+05	2022-08-26 20:39:59.785013+05	LocalExecutor	user-VirtualBox	user
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.log (id, dttm, dag_id, task_id, event, execution_date, owner, extra, map_index) FROM stdin;
1	2022-08-26 13:59:13.887315+05	\N	\N	cli_webserver	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'webserver', '-p', '8080']"}	\N
2	2022-08-26 14:01:56.143494+05	\N	\N	cli_users_create	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'users', 'create', '--role', 'Admin', '--username', 'admin', '--email', 'admin', '--firstname', 'admin', '--lastname', 'admin', '--password', '********']"}	\N
3	2022-08-26 14:02:42.558103+05	\N	\N	cli_scheduler	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
4	2022-08-26 16:03:22.442294+05	planes	\N	paused	\N	admin	[('is_paused', 'true'), ('dag_id', 'planes')]	\N
5	2022-08-26 16:04:21.218289+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
6	2022-08-26 16:04:21.695182+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
7	2022-08-26 16:04:22.113772+05	planes	get_planes_schedule	running	2022-08-26 16:04:21.222846+05	airflow	\N	-1
8	2022-08-26 16:04:22.164451+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
9	2022-08-26 16:04:23.254972+05	planes	get_planes_schedule	success	2022-08-26 16:04:21.222846+05	airflow	\N	-1
10	2022-08-26 16:04:23.904453+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
11	2022-08-26 16:04:24.135106+05	planes	load_to_db	running	2022-08-26 16:04:21.222846+05	airflow	\N	-1
12	2022-08-26 16:04:24.154572+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
13	2022-08-26 16:04:24.374915+05	planes	load_to_db	failed	2022-08-26 16:04:21.222846+05	airflow	\N	-1
14	2022-08-26 16:05:03.753525+05	\N	\N	list	\N	admin	[]	\N
15	2022-08-26 16:05:34.016188+05	planes	\N	paused	\N	admin	[('is_paused', 'false'), ('dag_id', 'planes')]	\N
16	2022-08-26 16:16:37.153466+05	planes	\N	grid	\N	admin	[('dag_id', 'planes')]	\N
17	2022-08-26 16:16:44.740997+05	planes	\N	graph	\N	admin	[('dag_id', 'planes')]	\N
18	2022-08-26 16:16:48.541167+05	planes	\N	task_instances	2022-08-26 16:04:21.222846+05	admin	[('dag_id', 'planes'), ('execution_date', '2022-08-26T11:04:21.222846+00:00')]	\N
19	2022-08-26 16:38:47.21632+05	planes	\N	task_instances	2022-08-26 16:04:21.222846+05	admin	[('dag_id', 'planes'), ('execution_date', '2022-08-26T11:04:21.222846+00:00')]	\N
20	2022-08-26 16:38:47.429391+05	planes	\N	grid	\N	admin	[('root', ''), ('dag_id', 'planes')]	\N
21	2022-08-26 16:38:53.015091+05	planes	\N	paused	\N	admin	[('is_paused', 'true'), ('dag_id', 'planes')]	\N
22	2022-08-26 16:38:53.947666+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
23	2022-08-26 16:38:54.270216+05	planes	load_to_db	running	2022-08-26 16:04:21.222846+05	airflow	\N	-1
24	2022-08-26 16:38:54.288428+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
25	2022-08-26 16:38:54.573414+05	planes	load_to_db	failed	2022-08-26 16:04:21.222846+05	airflow	\N	-1
26	2022-08-26 16:39:00.804927+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
27	2022-08-26 16:39:01.951322+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
28	2022-08-26 16:39:02.429263+05	planes	get_planes_schedule	running	2022-08-26 16:39:00.809769+05	airflow	\N	-1
29	2022-08-26 16:39:02.488539+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
30	2022-08-26 16:39:05.658335+05	planes	get_planes_schedule	success	2022-08-26 16:39:00.809769+05	airflow	\N	-1
31	2022-08-26 16:39:05.936573+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
32	2022-08-26 16:39:06.177909+05	planes	load_to_db	running	2022-08-26 16:39:00.809769+05	airflow	\N	-1
33	2022-08-26 16:39:06.200048+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
34	2022-08-26 16:39:06.37456+05	planes	load_to_db	failed	2022-08-26 16:39:00.809769+05	airflow	\N	-1
35	2022-08-26 16:41:06.963701+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
36	2022-08-26 16:41:07.167105+05	planes	load_to_db	running	2022-08-26 16:39:00.809769+05	airflow	\N	-1
37	2022-08-26 16:41:07.183265+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
38	2022-08-26 16:41:07.315451+05	planes	load_to_db	failed	2022-08-26 16:39:00.809769+05	airflow	\N	-1
39	2022-08-26 16:44:21.622397+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
40	2022-08-26 16:44:22.461944+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
41	2022-08-26 16:44:22.852663+05	planes	get_planes_schedule	running	2022-08-26 16:44:21.625864+05	airflow	\N	-1
42	2022-08-26 16:44:22.896283+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
43	2022-08-26 16:44:23.974272+05	planes	get_planes_schedule	success	2022-08-26 16:44:21.625864+05	airflow	\N	-1
44	2022-08-26 16:44:24.450616+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
45	2022-08-26 16:44:24.71551+05	planes	load_to_db	running	2022-08-26 16:44:21.625864+05	airflow	\N	-1
46	2022-08-26 16:44:24.759822+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
47	2022-08-26 16:44:25.061386+05	planes	load_to_db	failed	2022-08-26 16:44:21.625864+05	airflow	\N	-1
48	2022-08-26 16:44:58.592241+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
49	2022-08-26 16:44:59.490373+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
50	2022-08-26 16:44:59.953+05	planes	get_planes_schedule	running	2022-08-26 16:44:58.600282+05	airflow	\N	-1
51	2022-08-26 16:44:59.99769+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
52	2022-08-26 16:45:00.873293+05	planes	get_planes_schedule	success	2022-08-26 16:44:58.600282+05	airflow	\N	-1
53	2022-08-26 16:45:01.376975+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
54	2022-08-26 16:45:01.608002+05	planes	load_to_db	running	2022-08-26 16:44:58.600282+05	airflow	\N	-1
55	2022-08-26 16:45:01.624063+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
56	2022-08-26 16:45:01.797126+05	planes	load_to_db	success	2022-08-26 16:44:58.600282+05	airflow	\N	-1
57	2022-08-26 16:45:49.232525+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
58	2022-08-26 16:45:49.893267+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
59	2022-08-26 16:45:50.256738+05	planes	get_planes_schedule	running	2022-08-26 16:45:49.235993+05	airflow	\N	-1
60	2022-08-26 16:45:50.299699+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
61	2022-08-26 16:45:51.1796+05	planes	get_planes_schedule	success	2022-08-26 16:45:49.235993+05	airflow	\N	-1
62	2022-08-26 16:45:52.255695+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
63	2022-08-26 16:45:52.533214+05	planes	load_to_db	running	2022-08-26 16:45:49.235993+05	airflow	\N	-1
64	2022-08-26 16:45:52.54881+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
65	2022-08-26 16:45:52.791416+05	planes	load_to_db	success	2022-08-26 16:45:49.235993+05	airflow	\N	-1
66	2022-08-26 16:46:25.879269+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
67	2022-08-26 16:46:26.062584+05	planes	load_to_db	running	2022-08-26 16:44:21.625864+05	airflow	\N	-1
68	2022-08-26 16:46:26.087059+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
69	2022-08-26 16:46:26.449962+05	planes	load_to_db	success	2022-08-26 16:44:21.625864+05	airflow	\N	-1
70	2022-08-26 16:46:32.463506+05	planes	\N	graph	2022-08-26 16:45:49.235993+05	admin	[('execution_date', '2022-08-26 11:45:49.235993+00:00'), ('dag_id', 'planes')]	\N
71	2022-08-26 16:49:40.393834+05	planes	\N	graph	2022-08-26 16:45:49.235993+05	admin	[('run_id', 'manual__2022-08-26T11:45:49.235993+00:00'), ('execution_date', '2022-08-26 11:45:49.235993+00:00'), ('dag_id', 'planes')]	\N
72	2022-08-26 16:49:43.624943+05	planes	\N	duration	\N	admin	[('days', '30'), ('root', ''), ('dag_id', 'planes')]	\N
73	2022-08-26 16:49:45.129027+05	planes	\N	tries	\N	admin	[('days', '30'), ('root', ''), ('dag_id', 'planes')]	\N
74	2022-08-26 16:50:21.035215+05	planes	\N	graph	2022-08-26 16:45:49.235993+05	admin	[('execution_date', '2022-08-26 11:45:49.235993+00:00'), ('dag_id', 'planes')]	\N
75	2022-08-26 16:51:03.505882+05	planes	\N	graph	2022-08-26 16:45:49.235993+05	admin	[('run_id', 'manual__2022-08-26T11:45:49.235993+00:00'), ('execution_date', '2022-08-26 11:45:49.235993+00:00'), ('dag_id', 'planes')]	\N
76	2022-08-26 16:51:14.59267+05	planes	\N	gantt	\N	admin	[('root', ''), ('dag_id', 'planes')]	\N
77	2022-08-26 16:51:50.439038+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
78	2022-08-26 16:51:51.293532+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
79	2022-08-26 16:51:51.700021+05	planes	get_planes_schedule	running	2022-08-26 16:51:50.4447+05	airflow	\N	-1
80	2022-08-26 16:51:51.751154+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
81	2022-08-26 16:51:52.84295+05	planes	get_planes_schedule	success	2022-08-26 16:51:50.4447+05	airflow	\N	-1
82	2022-08-26 16:51:53.533108+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
83	2022-08-26 16:51:53.722542+05	planes	load_to_db	running	2022-08-26 16:51:50.4447+05	airflow	\N	-1
84	2022-08-26 16:51:53.737532+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
85	2022-08-26 16:51:54.008177+05	planes	load_to_db	success	2022-08-26 16:51:50.4447+05	airflow	\N	-1
86	2022-08-26 16:52:17.142015+05	planes	load_to_db	log	2022-08-26 16:04:21.222846+05	admin	[('execution_date', '2022-08-26T11:04:21.222846+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
87	2022-08-26 16:52:17.825828+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 16:04:21.222846+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T11:04:21.222846+00:00'), ('try_number', '2'), ('metadata', 'null')]	\N
88	2022-08-26 16:52:17.834291+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 16:04:21.222846+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T11:04:21.222846+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
89	2022-08-26 16:52:42.891398+05	planes	load_to_db	log	2022-08-26 16:51:50.4447+05	admin	[('execution_date', '2022-08-26T11:51:50.444700+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
90	2022-08-26 16:52:43.934884+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 16:51:50.4447+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T11:51:50.444700+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
91	2022-08-26 16:53:17.279517+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
92	2022-08-26 16:53:18.310957+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
93	2022-08-26 16:53:18.663819+05	planes	get_planes_schedule	running	2022-08-26 16:53:17.284767+05	airflow	\N	-1
94	2022-08-26 16:53:18.697405+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
95	2022-08-26 16:53:19.662865+05	planes	get_planes_schedule	success	2022-08-26 16:53:17.284767+05	airflow	\N	-1
96	2022-08-26 16:53:19.952153+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
97	2022-08-26 16:53:20.281806+05	planes	load_to_db	running	2022-08-26 16:53:17.284767+05	airflow	\N	-1
98	2022-08-26 16:53:20.299076+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
99	2022-08-26 16:53:20.439376+05	planes	load_to_db	failed	2022-08-26 16:53:17.284767+05	airflow	\N	-1
100	2022-08-26 16:53:33.824704+05	planes	load_to_db	log	2022-08-26 16:53:17.284767+05	admin	[('execution_date', '2022-08-26T11:53:17.284767+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
101	2022-08-26 16:53:34.937336+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 16:53:17.284767+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T11:53:17.284767+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
102	2022-08-26 16:55:20.488224+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
103	2022-08-26 16:55:20.752607+05	planes	load_to_db	running	2022-08-26 16:53:17.284767+05	airflow	\N	-1
104	2022-08-26 16:55:20.776409+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
105	2022-08-26 16:55:20.95002+05	planes	load_to_db	failed	2022-08-26 16:53:17.284767+05	airflow	\N	-1
106	2022-08-26 16:57:59.584616+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
107	2022-08-26 16:58:00.235086+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
108	2022-08-26 16:58:00.626036+05	planes	get_planes_schedule	running	2022-08-26 16:57:59.589672+05	airflow	\N	-1
109	2022-08-26 16:58:00.653828+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
110	2022-08-26 16:58:02.0888+05	planes	get_planes_schedule	success	2022-08-26 16:57:59.589672+05	airflow	\N	-1
111	2022-08-26 16:58:02.462448+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
112	2022-08-26 16:58:02.702878+05	planes	load_to_db	running	2022-08-26 16:57:59.589672+05	airflow	\N	-1
113	2022-08-26 16:58:02.727709+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
114	2022-08-26 16:58:03.05483+05	planes	load_to_db	failed	2022-08-26 16:57:59.589672+05	airflow	\N	-1
115	2022-08-26 16:59:12.621481+05	planes	load_to_db	log	2022-08-26 16:57:59.589672+05	admin	[('execution_date', '2022-08-26T11:57:59.589672+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
116	2022-08-26 16:59:14.013415+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 16:57:59.589672+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T11:57:59.589672+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
117	2022-08-26 17:00:03.111653+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
118	2022-08-26 17:00:03.593795+05	planes	load_to_db	running	2022-08-26 16:57:59.589672+05	airflow	\N	-1
119	2022-08-26 17:00:03.631134+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
120	2022-08-26 17:00:03.807826+05	planes	load_to_db	failed	2022-08-26 16:57:59.589672+05	airflow	\N	-1
121	2022-08-26 17:03:10.086878+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
122	2022-08-26 17:03:11.031705+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
123	2022-08-26 17:03:11.437448+05	planes	get_planes_schedule	running	2022-08-26 17:03:10.090438+05	airflow	\N	-1
124	2022-08-26 17:03:11.454398+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
125	2022-08-26 17:03:13.205594+05	planes	get_planes_schedule	success	2022-08-26 17:03:10.090438+05	airflow	\N	-1
126	2022-08-26 17:03:13.852982+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
127	2022-08-26 17:03:14.098684+05	planes	load_to_db	running	2022-08-26 17:03:10.090438+05	airflow	\N	-1
128	2022-08-26 17:03:14.12091+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
129	2022-08-26 17:03:14.323415+05	planes	load_to_db	failed	2022-08-26 17:03:10.090438+05	airflow	\N	-1
130	2022-08-26 17:05:00.375721+05	planes	load_to_db	log	2022-08-26 17:03:10.090438+05	admin	[('execution_date', '2022-08-26T12:03:10.090438+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
131	2022-08-26 17:05:01.914075+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 17:03:10.090438+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T12:03:10.090438+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
132	2022-08-26 17:05:14.83311+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
133	2022-08-26 17:05:15.107359+05	planes	load_to_db	running	2022-08-26 17:03:10.090438+05	airflow	\N	-1
134	2022-08-26 17:05:15.134442+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
135	2022-08-26 17:05:15.283571+05	planes	load_to_db	failed	2022-08-26 17:03:10.090438+05	airflow	\N	-1
136	2022-08-26 17:06:22.351072+05	\N	\N	cli_webserver	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'webserver', '-p', '8080']"}	\N
137	2022-08-26 17:06:36.241774+05	\N	\N	cli_scheduler	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
138	2022-08-26 17:06:52.441975+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
139	2022-08-26 17:06:53.290322+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
140	2022-08-26 17:06:53.753827+05	planes	get_planes_schedule	running	2022-08-26 17:06:52.459161+05	airflow	\N	-1
141	2022-08-26 17:06:53.793591+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
142	2022-08-26 17:06:54.69563+05	planes	get_planes_schedule	success	2022-08-26 17:06:52.459161+05	airflow	\N	-1
143	2022-08-26 17:06:55.550725+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
144	2022-08-26 17:06:55.800443+05	planes	load_to_db	running	2022-08-26 17:06:52.459161+05	airflow	\N	-1
145	2022-08-26 17:06:55.826427+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
146	2022-08-26 17:06:55.975898+05	planes	load_to_db	failed	2022-08-26 17:06:52.459161+05	airflow	\N	-1
147	2022-08-26 17:07:10.903143+05	planes	load_to_db	log	2022-08-26 17:06:52.459161+05	admin	[('execution_date', '2022-08-26T12:06:52.459161+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
148	2022-08-26 17:07:11.602521+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 17:06:52.459161+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T12:06:52.459161+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
149	2022-08-26 17:08:56.214034+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
150	2022-08-26 17:08:56.43569+05	planes	load_to_db	running	2022-08-26 17:06:52.459161+05	airflow	\N	-1
151	2022-08-26 17:08:56.457876+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
152	2022-08-26 17:08:56.731279+05	planes	load_to_db	failed	2022-08-26 17:06:52.459161+05	airflow	\N	-1
153	2022-08-26 17:17:06.870597+05	planes	load_to_db	log	2022-08-26 17:06:52.459161+05	admin	[('execution_date', '2022-08-26T12:06:52.459161+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
154	2022-08-26 17:17:07.783199+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 17:06:52.459161+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T12:06:52.459161+00:00'), ('try_number', '2'), ('metadata', 'null')]	\N
155	2022-08-26 17:17:07.785781+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 17:06:52.459161+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T12:06:52.459161+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
156	2022-08-26 17:18:50.426796+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
157	2022-08-26 17:18:50.557131+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
158	2022-08-26 17:18:50.877226+05	planes	get_planes_schedule	running	2022-08-26 17:18:50.438914+05	airflow	\N	-1
159	2022-08-26 17:18:50.898113+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
160	2022-08-26 17:18:52.906631+05	planes	get_planes_schedule	success	2022-08-26 17:18:50.438914+05	airflow	\N	-1
161	2022-08-26 17:18:53.794079+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
162	2022-08-26 17:18:54.004267+05	planes	load_to_db	running	2022-08-26 17:18:50.438914+05	airflow	\N	-1
163	2022-08-26 17:18:54.023084+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
164	2022-08-26 17:18:54.219625+05	planes	load_to_db	success	2022-08-26 17:18:50.438914+05	airflow	\N	-1
165	2022-08-26 18:10:01.155193+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
166	2022-08-26 18:10:01.962774+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
167	2022-08-26 18:10:02.528913+05	planes	get_planes_schedule	running	2022-08-26 18:10:01.159151+05	airflow	\N	-1
168	2022-08-26 18:10:02.580732+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
169	2022-08-26 18:10:03.865899+05	planes	get_planes_schedule	success	2022-08-26 18:10:01.159151+05	airflow	\N	-1
170	2022-08-26 18:10:04.817745+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
171	2022-08-26 18:10:05.022559+05	planes	load_to_db	running	2022-08-26 18:10:01.159151+05	airflow	\N	-1
172	2022-08-26 18:10:05.040695+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
173	2022-08-26 18:10:05.26269+05	planes	load_to_db	failed	2022-08-26 18:10:01.159151+05	airflow	\N	-1
174	2022-08-26 18:12:05.414502+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
175	2022-08-26 18:12:05.619646+05	planes	load_to_db	running	2022-08-26 18:10:01.159151+05	airflow	\N	-1
176	2022-08-26 18:12:05.636487+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
177	2022-08-26 18:12:05.81513+05	planes	load_to_db	failed	2022-08-26 18:10:01.159151+05	airflow	\N	-1
178	2022-08-26 18:12:38.29067+05	planes	load_to_db	log	2022-08-26 18:10:01.159151+05	admin	[('execution_date', '2022-08-26T13:10:01.159151+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
179	2022-08-26 18:12:39.2174+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:10:01.159151+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:10:01.159151+00:00'), ('try_number', '2'), ('metadata', 'null')]	\N
180	2022-08-26 18:12:39.239148+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:10:01.159151+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:10:01.159151+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
181	2022-08-26 18:13:27.123739+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
182	2022-08-26 18:13:27.861425+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
183	2022-08-26 18:13:28.365113+05	planes	get_planes_schedule	running	2022-08-26 18:13:27.127828+05	airflow	\N	-1
184	2022-08-26 18:13:28.434371+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
185	2022-08-26 18:13:29.304473+05	planes	get_planes_schedule	success	2022-08-26 18:13:27.127828+05	airflow	\N	-1
186	2022-08-26 18:13:29.743549+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
187	2022-08-26 18:13:29.974203+05	planes	load_to_db	running	2022-08-26 18:13:27.127828+05	airflow	\N	-1
188	2022-08-26 18:13:29.992597+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
189	2022-08-26 18:13:30.23213+05	planes	load_to_db	success	2022-08-26 18:13:27.127828+05	airflow	\N	-1
190	2022-08-26 18:15:42.779454+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
191	2022-08-26 18:15:43.352935+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
192	2022-08-26 18:15:43.722035+05	planes	get_planes_schedule	running	2022-08-26 18:15:42.790326+05	airflow	\N	-1
193	2022-08-26 18:15:43.7781+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
194	2022-08-26 18:15:44.738558+05	planes	get_planes_schedule	success	2022-08-26 18:15:42.790326+05	airflow	\N	-1
195	2022-08-26 18:15:45.475383+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
196	2022-08-26 18:15:45.869706+05	planes	load_to_db	running	2022-08-26 18:15:42.790326+05	airflow	\N	-1
197	2022-08-26 18:15:45.900469+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
198	2022-08-26 18:15:46.174098+05	planes	load_to_db	success	2022-08-26 18:15:42.790326+05	airflow	\N	-1
199	2022-08-26 18:16:00.840199+05	planes	load_to_db	log	2022-08-26 18:15:42.790326+05	admin	[('execution_date', '2022-08-26T13:15:42.790326+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
200	2022-08-26 18:16:01.904705+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:15:42.790326+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:15:42.790326+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
201	2022-08-26 18:16:51.193171+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
202	2022-08-26 18:16:51.791852+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
203	2022-08-26 18:16:52.367175+05	planes	get_planes_schedule	running	2022-08-26 18:16:51.196262+05	airflow	\N	-1
204	2022-08-26 18:16:52.414888+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
205	2022-08-26 18:16:53.554808+05	planes	get_planes_schedule	success	2022-08-26 18:16:51.196262+05	airflow	\N	-1
206	2022-08-26 18:16:54.555737+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
207	2022-08-26 18:16:54.959706+05	planes	load_to_db	running	2022-08-26 18:16:51.196262+05	airflow	\N	-1
208	2022-08-26 18:16:54.983268+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
209	2022-08-26 18:16:55.349287+05	planes	load_to_db	success	2022-08-26 18:16:51.196262+05	airflow	\N	-1
210	2022-08-26 18:17:08.240611+05	planes	load_to_db	log	2022-08-26 18:16:51.196262+05	admin	[('execution_date', '2022-08-26T13:16:51.196262+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
221	2022-08-26 18:20:21.036238+05	planes	load_to_db	log	2022-08-26 18:20:03.122726+05	admin	[('execution_date', '2022-08-26T13:20:03.122726+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
222	2022-08-26 18:20:22.557665+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:20:03.122726+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:20:03.122726+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
243	2022-08-26 18:25:15.690282+05	planes	load_to_db	log	2022-08-26 18:24:47.710684+05	admin	[('execution_date', '2022-08-26T13:24:47.710684+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
244	2022-08-26 18:25:16.447451+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:24:47.710684+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:24:47.710684+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
211	2022-08-26 18:17:10.402746+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:16:51.196262+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:16:51.196262+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
212	2022-08-26 18:20:03.119294+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
213	2022-08-26 18:20:03.9456+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
214	2022-08-26 18:20:04.49189+05	planes	get_planes_schedule	running	2022-08-26 18:20:03.122726+05	airflow	\N	-1
215	2022-08-26 18:20:04.532648+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
216	2022-08-26 18:20:06.904956+05	planes	get_planes_schedule	success	2022-08-26 18:20:03.122726+05	airflow	\N	-1
217	2022-08-26 18:20:07.620032+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
218	2022-08-26 18:20:07.903937+05	planes	load_to_db	running	2022-08-26 18:20:03.122726+05	airflow	\N	-1
219	2022-08-26 18:20:07.921702+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
220	2022-08-26 18:20:08.12358+05	planes	load_to_db	success	2022-08-26 18:20:03.122726+05	airflow	\N	-1
223	2022-08-26 18:21:01.204846+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
224	2022-08-26 18:21:01.47574+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
225	2022-08-26 18:21:01.952698+05	planes	get_planes_schedule	running	2022-08-26 18:21:01.210179+05	airflow	\N	-1
226	2022-08-26 18:21:02.000637+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
227	2022-08-26 18:21:03.099237+05	planes	get_planes_schedule	success	2022-08-26 18:21:01.210179+05	airflow	\N	-1
228	2022-08-26 18:21:03.835517+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
229	2022-08-26 18:21:04.072409+05	planes	load_to_db	running	2022-08-26 18:21:01.210179+05	airflow	\N	-1
230	2022-08-26 18:21:04.089211+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
231	2022-08-26 18:21:04.271914+05	planes	load_to_db	success	2022-08-26 18:21:01.210179+05	airflow	\N	-1
232	2022-08-26 18:21:32.529072+05	planes	load_to_db	log	2022-08-26 18:21:01.210179+05	admin	[('execution_date', '2022-08-26T13:21:01.210179+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
233	2022-08-26 18:21:33.383777+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:21:01.210179+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:21:01.210179+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
234	2022-08-26 18:24:47.707689+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
235	2022-08-26 18:24:48.189284+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
236	2022-08-26 18:24:48.586715+05	planes	get_planes_schedule	running	2022-08-26 18:24:47.710684+05	airflow	\N	-1
237	2022-08-26 18:24:48.638502+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
238	2022-08-26 18:24:49.872759+05	planes	get_planes_schedule	success	2022-08-26 18:24:47.710684+05	airflow	\N	-1
239	2022-08-26 18:24:50.502729+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
240	2022-08-26 18:24:50.925434+05	planes	load_to_db	running	2022-08-26 18:24:47.710684+05	airflow	\N	-1
241	2022-08-26 18:24:50.961644+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
242	2022-08-26 18:24:51.251712+05	planes	load_to_db	failed	2022-08-26 18:24:47.710684+05	airflow	\N	-1
245	2022-08-26 18:26:51.560886+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
246	2022-08-26 18:26:51.82982+05	planes	load_to_db	running	2022-08-26 18:24:47.710684+05	airflow	\N	-1
247	2022-08-26 18:26:51.85139+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
248	2022-08-26 18:26:52.112444+05	planes	load_to_db	failed	2022-08-26 18:24:47.710684+05	airflow	\N	-1
249	2022-08-26 18:28:47.092791+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
250	2022-08-26 18:28:47.387074+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
251	2022-08-26 18:28:47.729582+05	planes	get_planes_schedule	running	2022-08-26 18:28:47.097572+05	airflow	\N	-1
252	2022-08-26 18:28:47.757357+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
253	2022-08-26 18:28:49.359528+05	planes	get_planes_schedule	success	2022-08-26 18:28:47.097572+05	airflow	\N	-1
254	2022-08-26 18:28:49.518392+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
255	2022-08-26 18:28:49.854193+05	planes	load_to_db	running	2022-08-26 18:28:47.097572+05	airflow	\N	-1
256	2022-08-26 18:28:49.881357+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
257	2022-08-26 18:28:50.156717+05	planes	load_to_db	success	2022-08-26 18:28:47.097572+05	airflow	\N	-1
258	2022-08-26 18:29:32.268286+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
259	2022-08-26 18:29:32.792582+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
260	2022-08-26 18:29:33.171797+05	planes	get_planes_schedule	running	2022-08-26 18:29:32.272382+05	airflow	\N	-1
261	2022-08-26 18:29:33.222459+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
262	2022-08-26 18:29:34.179749+05	planes	get_planes_schedule	success	2022-08-26 18:29:32.272382+05	airflow	\N	-1
263	2022-08-26 18:29:35.048814+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
264	2022-08-26 18:29:35.344581+05	planes	load_to_db	running	2022-08-26 18:29:32.272382+05	airflow	\N	-1
265	2022-08-26 18:29:35.369053+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
266	2022-08-26 18:29:35.70599+05	planes	load_to_db	success	2022-08-26 18:29:32.272382+05	airflow	\N	-1
267	2022-08-26 18:30:02.551177+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
268	2022-08-26 18:30:03.123198+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
269	2022-08-26 18:30:03.513484+05	planes	get_planes_schedule	running	2022-08-26 18:30:02.555769+05	airflow	\N	-1
270	2022-08-26 18:30:03.549342+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
271	2022-08-26 18:30:06.255611+05	planes	get_planes_schedule	success	2022-08-26 18:30:02.555769+05	airflow	\N	-1
272	2022-08-26 18:30:06.495935+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
273	2022-08-26 18:30:06.914219+05	planes	load_to_db	running	2022-08-26 18:30:02.555769+05	airflow	\N	-1
274	2022-08-26 18:30:06.93806+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
275	2022-08-26 18:30:07.203339+05	planes	load_to_db	success	2022-08-26 18:30:02.555769+05	airflow	\N	-1
276	2022-08-26 18:30:17.778386+05	planes	load_to_db	log	2022-08-26 18:30:02.555769+05	admin	[('execution_date', '2022-08-26T13:30:02.555769+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
277	2022-08-26 18:30:19.19876+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:30:02.555769+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:30:02.555769+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
278	2022-08-26 18:31:10.375718+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
279	2022-08-26 18:31:11.42143+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
280	2022-08-26 18:31:11.827252+05	planes	get_planes_schedule	running	2022-08-26 18:31:10.396371+05	airflow	\N	-1
281	2022-08-26 18:31:11.889123+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
282	2022-08-26 18:31:13.898009+05	planes	get_planes_schedule	success	2022-08-26 18:31:10.396371+05	airflow	\N	-1
283	2022-08-26 18:31:14.231249+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
284	2022-08-26 18:31:14.616264+05	planes	load_to_db	running	2022-08-26 18:31:10.396371+05	airflow	\N	-1
285	2022-08-26 18:31:14.660298+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
286	2022-08-26 18:31:15.125083+05	planes	load_to_db	failed	2022-08-26 18:31:10.396371+05	airflow	\N	-1
287	2022-08-26 18:31:30.909997+05	planes	load_to_db	log	2022-08-26 18:31:10.396371+05	admin	[('execution_date', '2022-08-26T13:31:10.396371+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
288	2022-08-26 18:31:31.736677+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 18:31:10.396371+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T13:31:10.396371+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
289	2022-08-26 18:33:15.854451+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
290	2022-08-26 18:33:16.061351+05	planes	load_to_db	running	2022-08-26 18:31:10.396371+05	airflow	\N	-1
291	2022-08-26 18:33:16.079759+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
292	2022-08-26 18:33:16.241384+05	planes	load_to_db	success	2022-08-26 18:31:10.396371+05	airflow	\N	-1
293	2022-08-26 20:27:18.360068+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
294	2022-08-26 20:27:19.30106+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
295	2022-08-26 20:27:19.768724+05	planes	get_planes_schedule	running	2022-08-26 20:27:18.364898+05	airflow	\N	-1
296	2022-08-26 20:27:19.804569+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
297	2022-08-26 20:27:22.883474+05	planes	get_planes_schedule	success	2022-08-26 20:27:18.364898+05	airflow	\N	-1
298	2022-08-26 20:27:23.221485+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
299	2022-08-26 20:27:23.490908+05	planes	load_to_db	running	2022-08-26 20:27:18.364898+05	airflow	\N	-1
300	2022-08-26 20:27:23.510217+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
301	2022-08-26 20:27:23.670785+05	planes	load_to_db	failed	2022-08-26 20:27:18.364898+05	airflow	\N	-1
302	2022-08-26 20:28:32.217846+05	planes	load_to_db	log	2022-08-26 20:27:18.364898+05	admin	[('execution_date', '2022-08-26T15:27:18.364898+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
303	2022-08-26 20:28:33.789949+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:27:18.364898+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:27:18.364898+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
304	2022-08-26 20:29:24.081077+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
305	2022-08-26 20:29:24.32477+05	planes	load_to_db	running	2022-08-26 20:27:18.364898+05	airflow	\N	-1
306	2022-08-26 20:29:24.347386+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
307	2022-08-26 20:29:24.527521+05	planes	load_to_db	failed	2022-08-26 20:27:18.364898+05	airflow	\N	-1
308	2022-08-26 20:29:46.600731+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
309	2022-08-26 20:29:47.67873+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
310	2022-08-26 20:29:48.045689+05	planes	get_planes_schedule	running	2022-08-26 20:29:46.604154+05	airflow	\N	-1
311	2022-08-26 20:29:48.077055+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
312	2022-08-26 20:29:49.197012+05	planes	get_planes_schedule	success	2022-08-26 20:29:46.604154+05	airflow	\N	-1
313	2022-08-26 20:29:49.513097+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
314	2022-08-26 20:29:49.992237+05	planes	load_to_db	running	2022-08-26 20:29:46.604154+05	airflow	\N	-1
315	2022-08-26 20:29:50.033928+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
316	2022-08-26 20:29:50.486744+05	planes	load_to_db	failed	2022-08-26 20:29:46.604154+05	airflow	\N	-1
317	2022-08-26 20:29:56.778194+05	planes	load_to_db	log	2022-08-26 20:29:46.604154+05	admin	[('execution_date', '2022-08-26T15:29:46.604154+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
318	2022-08-26 20:29:57.748564+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:29:46.604154+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:29:46.604154+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
319	2022-08-26 20:31:51.181157+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
320	2022-08-26 20:31:51.738588+05	planes	load_to_db	running	2022-08-26 20:29:46.604154+05	airflow	\N	-1
321	2022-08-26 20:31:51.792918+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
322	2022-08-26 20:31:52.167812+05	planes	load_to_db	failed	2022-08-26 20:29:46.604154+05	airflow	\N	-1
323	2022-08-26 20:31:53.535428+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
324	2022-08-26 20:31:54.724161+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
325	2022-08-26 20:31:55.061657+05	planes	get_planes_schedule	running	2022-08-26 20:31:53.538558+05	airflow	\N	-1
326	2022-08-26 20:31:55.081944+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
327	2022-08-26 20:31:56.118425+05	planes	get_planes_schedule	success	2022-08-26 20:31:53.538558+05	airflow	\N	-1
328	2022-08-26 20:31:56.294865+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
329	2022-08-26 20:31:56.546799+05	planes	load_to_db	running	2022-08-26 20:31:53.538558+05	airflow	\N	-1
330	2022-08-26 20:31:56.564916+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
331	2022-08-26 20:31:56.755546+05	planes	load_to_db	failed	2022-08-26 20:31:53.538558+05	airflow	\N	-1
332	2022-08-26 20:32:06.892746+05	planes	load_to_db	log	2022-08-26 20:31:53.538558+05	admin	[('execution_date', '2022-08-26T15:31:53.538558+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
333	2022-08-26 20:32:08.486332+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:31:53.538558+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:31:53.538558+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
334	2022-08-26 20:32:55.625074+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
335	2022-08-26 20:32:56.301132+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
336	2022-08-26 20:32:56.701157+05	planes	get_planes_schedule	running	2022-08-26 20:32:55.654241+05	airflow	\N	-1
337	2022-08-26 20:32:56.726097+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
338	2022-08-26 20:32:57.829518+05	planes	get_planes_schedule	success	2022-08-26 20:32:55.654241+05	airflow	\N	-1
339	2022-08-26 20:32:58.518853+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
340	2022-08-26 20:32:58.743533+05	planes	load_to_db	running	2022-08-26 20:32:55.654241+05	airflow	\N	-1
341	2022-08-26 20:32:58.761148+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
342	2022-08-26 20:32:59.04202+05	planes	load_to_db	failed	2022-08-26 20:32:55.654241+05	airflow	\N	-1
343	2022-08-26 20:33:14.919675+05	planes	load_to_db	log	2022-08-26 20:32:55.654241+05	admin	[('execution_date', '2022-08-26T15:32:55.654241+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
344	2022-08-26 20:33:16.279729+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:32:55.654241+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:32:55.654241+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
345	2022-08-26 20:33:52.67652+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
346	2022-08-26 20:33:53.368347+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
347	2022-08-26 20:33:53.744521+05	planes	get_planes_schedule	running	2022-08-26 20:33:52.68446+05	airflow	\N	-1
348	2022-08-26 20:33:53.783008+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
349	2022-08-26 20:33:54.719543+05	planes	get_planes_schedule	success	2022-08-26 20:33:52.68446+05	airflow	\N	-1
350	2022-08-26 20:33:55.891736+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
351	2022-08-26 20:33:56.340817+05	planes	load_to_db	running	2022-08-26 20:33:52.68446+05	airflow	\N	-1
352	2022-08-26 20:33:56.390617+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
353	2022-08-26 20:33:56.855724+05	planes	load_to_db	failed	2022-08-26 20:33:52.68446+05	airflow	\N	-1
354	2022-08-26 20:33:57.495945+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
355	2022-08-26 20:33:57.883645+05	planes	load_to_db	running	2022-08-26 20:31:53.538558+05	airflow	\N	-1
356	2022-08-26 20:33:57.909962+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
357	2022-08-26 20:33:58.234748+05	planes	load_to_db	failed	2022-08-26 20:31:53.538558+05	airflow	\N	-1
358	2022-08-26 20:34:00.887766+05	planes	load_to_db	log	2022-08-26 20:31:53.538558+05	admin	[('execution_date', '2022-08-26T15:31:53.538558+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
359	2022-08-26 20:34:01.96261+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:31:53.538558+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:31:53.538558+00:00'), ('try_number', '2'), ('metadata', 'null')]	\N
360	2022-08-26 20:34:01.964995+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:31:53.538558+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:31:53.538558+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
361	2022-08-26 20:34:59.697773+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
362	2022-08-26 20:35:00.030566+05	planes	load_to_db	running	2022-08-26 20:32:55.654241+05	airflow	\N	-1
363	2022-08-26 20:35:00.048708+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
364	2022-08-26 20:35:00.267512+05	planes	load_to_db	failed	2022-08-26 20:32:55.654241+05	airflow	\N	-1
365	2022-08-26 20:35:10.719378+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
366	2022-08-26 20:35:11.064325+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
367	2022-08-26 20:35:11.612928+05	planes	get_planes_schedule	running	2022-08-26 20:35:10.726625+05	airflow	\N	-1
368	2022-08-26 20:35:11.685782+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
369	2022-08-26 20:35:12.546054+05	planes	get_planes_schedule	success	2022-08-26 20:35:10.726625+05	airflow	\N	-1
370	2022-08-26 20:35:13.60703+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
371	2022-08-26 20:35:14.041705+05	planes	load_to_db	running	2022-08-26 20:35:10.726625+05	airflow	\N	-1
372	2022-08-26 20:35:14.091858+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
373	2022-08-26 20:35:14.47553+05	planes	load_to_db	failed	2022-08-26 20:35:10.726625+05	airflow	\N	-1
374	2022-08-26 20:35:17.923375+05	planes	load_to_db	log	2022-08-26 20:35:10.726625+05	admin	[('execution_date', '2022-08-26T15:35:10.726625+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
393	2022-08-26 20:40:18.292176+05	planes	load_to_db	log	2022-08-26 20:39:56.605409+05	admin	[('execution_date', '2022-08-26T15:39:56.605409+00:00'), ('task_id', 'load_to_db'), ('dag_id', 'planes'), ('map_index', '-1')]	\N
375	2022-08-26 20:35:18.951411+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:35:10.726625+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:35:10.726625+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
376	2022-08-26 20:35:57.126145+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
377	2022-08-26 20:35:57.404973+05	planes	load_to_db	running	2022-08-26 20:33:52.68446+05	airflow	\N	-1
378	2022-08-26 20:35:57.448601+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
379	2022-08-26 20:35:57.734151+05	planes	load_to_db	failed	2022-08-26 20:33:52.68446+05	airflow	\N	-1
380	2022-08-26 20:37:15.007159+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
381	2022-08-26 20:37:15.23166+05	planes	load_to_db	running	2022-08-26 20:35:10.726625+05	airflow	\N	-1
382	2022-08-26 20:37:15.273037+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
383	2022-08-26 20:37:15.528396+05	planes	load_to_db	failed	2022-08-26 20:35:10.726625+05	airflow	\N	-1
384	2022-08-26 20:39:56.602582+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
385	2022-08-26 20:39:56.875829+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
386	2022-08-26 20:39:57.255312+05	planes	get_planes_schedule	running	2022-08-26 20:39:56.605409+05	airflow	\N	-1
387	2022-08-26 20:39:57.281241+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
388	2022-08-26 20:39:58.975466+05	planes	get_planes_schedule	success	2022-08-26 20:39:56.605409+05	airflow	\N	-1
389	2022-08-26 20:39:59.457039+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
390	2022-08-26 20:39:59.879679+05	planes	load_to_db	running	2022-08-26 20:39:56.605409+05	airflow	\N	-1
391	2022-08-26 20:39:59.901579+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
392	2022-08-26 20:40:00.251176+05	planes	load_to_db	failed	2022-08-26 20:39:56.605409+05	airflow	\N	-1
394	2022-08-26 20:40:19.142605+05	planes	load_to_db	get_logs_with_metadata	2022-08-26 20:39:56.605409+05	admin	[('dag_id', 'planes'), ('task_id', 'load_to_db'), ('map_index', '-1'), ('execution_date', '2022-08-26T15:39:56.605409+00:00'), ('try_number', '1'), ('metadata', 'null')]	\N
395	2022-08-26 20:40:45.543738+05	planes	\N	trigger	\N	admin	[('dag_id', 'planes'), ('unpause', 'True')]	\N
396	2022-08-26 20:40:46.784335+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
397	2022-08-26 20:40:47.254767+05	planes	get_planes_schedule	running	2022-08-26 20:40:45.547399+05	airflow	\N	-1
398	2022-08-26 20:40:47.319257+05	planes	get_planes_schedule	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
399	2022-08-26 20:40:48.127132+05	planes	get_planes_schedule	success	2022-08-26 20:40:45.547399+05	airflow	\N	-1
400	2022-08-26 20:40:48.590692+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
401	2022-08-26 20:40:48.820476+05	planes	load_to_db	running	2022-08-26 20:40:45.547399+05	airflow	\N	-1
402	2022-08-26 20:40:48.85747+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
403	2022-08-26 20:40:51.54493+05	planes	load_to_db	success	2022-08-26 20:40:45.547399+05	airflow	\N	-1
404	2022-08-26 20:42:00.686219+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
405	2022-08-26 20:42:00.909264+05	planes	load_to_db	running	2022-08-26 20:39:56.605409+05	airflow	\N	-1
406	2022-08-26 20:42:00.927933+05	planes	load_to_db	cli_task_run	\N	user	{"host_name": "user-VirtualBox", "full_command": "['/usr/local/bin/airflow', 'scheduler']"}	\N
407	2022-08-26 20:42:01.164343+05	planes	load_to_db	success	2022-08-26 20:39:56.605409+05	airflow	\N	-1
\.


--
-- Data for Name: log_template; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.log_template (id, filename, elasticsearch_id, created_at) FROM stdin;
1	{{ ti.dag_id }}/{{ ti.task_id }}/{{ ts }}/{{ try_number }}.log	{dag_id}-{task_id}-{execution_date}-{try_number}	2022-08-26 13:59:05.37866+05
2	dag_id={{ ti.dag_id }}/run_id={{ ti.run_id }}/task_id={{ ti.task_id }}/{% if ti.map_index >= 0 %}map_index={{ ti.map_index }}/{% endif %}attempt={{ try_number }}.log	{dag_id}-{task_id}-{run_id}-{map_index}-{try_number}	2022-08-26 13:59:05.382216+05
\.


--
-- Data for Name: rendered_task_instance_fields; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.rendered_task_instance_fields (dag_id, task_id, rendered_fields, k8s_pod_yaml, map_index, run_id) FROM stdin;
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:04:21.222846+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:04:21.222846+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:39:00.809769+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:39:00.809769+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:44:21.625864+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:44:58.600282+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:44:58.600282+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:45:49.235993+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:45:49.235993+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:44:21.625864+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:51:50.444700+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:51:50.444700+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:53:17.284767+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:53:17.284767+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:57:59.589672+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T11:57:59.589672+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:03:10.090438+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:03:10.090438+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:06:52.459161+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:06:52.459161+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:18:50.438914+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T12:18:50.438914+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:10:01.159151+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:10:01.159151+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:13:27.127828+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:13:27.127828+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:15:42.790326+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:15:42.790326+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:16:51.196262+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:16:51.196262+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:20:03.122726+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:20:03.122726+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:21:01.210179+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:21:01.210179+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:24:47.710684+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:24:47.710684+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:28:47.097572+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:28:47.097572+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:29:32.272382+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:29:32.272382+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:30:02.555769+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:30:02.555769+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:31:10.396371+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T13:31:10.396371+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:27:18.364898+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:27:18.364898+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:29:46.604154+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:29:46.604154+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:31:53.538558+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:32:55.654241+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:33:52.684460+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:31:53.538558+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:32:55.654241+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:35:10.726625+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:33:52.684460+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:35:10.726625+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:39:56.605409+00:00
planes	get_planes_schedule	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:40:45.547399+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:40:45.547399+00:00
planes	load_to_db	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null	-1	manual__2022-08-26T15:39:56.605409+00:00
\.


--
-- Data for Name: sensor_instance; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.sensor_instance (id, task_id, dag_id, execution_date, state, try_number, start_date, operator, op_classpath, hashcode, shardcode, poke_context, execution_context, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: serialized_dag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.serialized_dag (dag_id, fileloc, fileloc_hash, data, last_updated, dag_hash, data_compressed) FROM stdin;
planes	/home/user/airflow/dags/tmn_planes.py	62514996347832164	{"__version": 1, "dag": {"schedule_interval": {"__var": 86400.0, "__type": "timedelta"}, "timezone": "UTC", "fileloc": "/home/user/airflow/dags/tmn_planes.py", "default_args": {"__var": {"owner": "airflow", "start_date": {"__var": 1661472000.0, "__type": "datetime"}, "retries": 1, "retry_delay": {"__var": 120.0, "__type": "timedelta"}}, "__type": "dict"}, "_dag_id": "planes", "edge_info": {}, "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"get_planes_schedule": ["operator", "get_planes_schedule"], "load_to_db": ["operator", "load_to_db"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "tasks": [{"retries": 1, "downstream_task_ids": ["load_to_db"], "pool": "default_pool", "_outlets": [], "ui_color": "#ffefeb", "start_date": 1661472000.0, "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_ext": [], "retry_delay": 120.0, "_inlets": [], "task_id": "get_planes_schedule", "ui_fgcolor": "#000", "owner": "airflow", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_empty": false, "op_args": [], "op_kwargs": {}}, {"retries": 1, "downstream_task_ids": [], "pool": "default_pool", "_outlets": [], "ui_color": "#ffefeb", "start_date": 1661472000.0, "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "template_ext": [], "retry_delay": 120.0, "_inlets": [], "task_id": "load_to_db", "ui_fgcolor": "#000", "owner": "airflow", "_task_type": "PythonOperator", "_task_module": "airflow.operators.python", "_is_empty": false, "op_args": [], "op_kwargs": {}}], "dag_dependencies": [], "params": {}}}	2022-08-26 16:03:27.695931+05	ec13e093f4807bd8b9d4f6d8c60617a7	\N
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.session (id, session_id, data, expiry) FROM stdin;
4	e698bb90-0f4a-4d86-b354-eb3789f5cf24	\\x80049563000000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894898c0a637372665f746f6b656e948c2838343035313966613834373831393734656230303865343765633133343032356631373062303632948c066c6f63616c65948c02656e94752e	2022-09-25 14:02:48.608573
5	4d405487-2f6a-4d62-a2b6-692b20e7d920	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.677866
6	be3ce511-e60c-4fe8-9364-e42f1223e795	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.679783
7	461ae0cd-0141-482c-8e7f-360cee1fca25	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.683187
8	0daf5c51-3d86-4142-937d-455c23bf596d	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.690753
9	69bb07fa-ae92-4073-b43c-dc0dc1de8607	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.692654
10	8d0ba9b9-2dfe-459e-a5f8-bdc1e3d3884a	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.695759
11	c3bd4774-d4ed-4d27-8bb1-697f63c2e3d1	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.712017
12	a61589f9-a826-4eec-b021-d92b8340d211	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.739296
13	67037884-e36f-469e-92f0-62edac1e35e1	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.739886
14	7e157893-025f-41d4-8498-247f90046de4	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.743572
15	ad93d33b-3f21-4581-b977-cad50d335555	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.740874
1	839cd774-ac40-4824-a853-85370d73e303	\\x80049563000000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894898c0a637372665f746f6b656e948c2831346531356661633666366238303063336565323261383136373434323132316134313064373336948c066c6f63616c65948c02656e94752e	2022-09-25 13:59:58.869223
16	fa190f65-6e49-47c2-9cfe-f98b5960053a	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.751085
17	3bafeaad-0937-4dd0-a8d8-c4de4a93bcef	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.753881
18	61f6d616-f45b-4d00-a73d-9ea156c87bd3	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.756575
19	e756a8a6-ff26-461e-940a-fd6596e9d116	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.760872
3	26c63073-55e5-4fa4-ad3e-5bed13d0005f	\\x80049549000000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894898c085f666c6173686573945d948c0664616e676572948c104163636573732069732044656e69656494869461752e	2022-09-25 14:02:48.594804
20	4bc8bdab-2039-4010-98f7-4b4ce21ef6c6	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.759356
21	3356a2d8-aa55-4b3a-a749-fb6851543bde	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.769103
22	23b23458-6dfb-4fd5-9538-c97c1d56816b	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.770133
23	a0448b25-b966-4d94-bd5c-fde2f470562b	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.770289
24	b12bbfd7-6df1-4049-8627-3d87c4666766	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.773516
25	8badfa34-355f-499b-9349-7210304939ff	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.778575
26	3efe4bec-244b-4560-9611-2fc24c73f7a0	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.778759
27	eaa7b724-9f5b-497a-bb5f-ad7346c63adb	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.813041
28	5a00f5ae-eeb1-4481-89c5-fe45be448a8a	\\x80049512000000000000007d948c0a5f7065726d616e656e749488732e	2022-09-25 14:02:48.926406
2	0056f150-71a8-429b-8e72-d08d457fa8e2	\\x8004951f020000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894888c0a637372665f746f6b656e948c2831346531356661633666366238303063336565323261383136373434323132316134313064373336948c066c6f63616c65948c02656e948c085f757365725f6964944b018c035f6964948c803132333039663639376236663839653565326632353865303437636639323839313630656438613637343762313037633630396631656131346664343433633631366636616335343333353834373635623134323534356366613634343764663965623032326433656165633366326636663138616635633634666238643662948c116461675f7374617475735f66696c746572948c03616c6c948c0c706167655f686973746f7279945d94288c26687474703a2f2f6c6f63616c686f73743a383038302f636f6e6e656374696f6e2f6c6973742f948c28687474703a2f2f6c6f63616c686f73743a383038302f636f6e6e656374696f6e2f656469742f3336948c28687474703a2f2f6c6f63616c686f73743a383038302f7461736b696e7374616e63652f6c6973742f948c4c687474703a2f2f6c6f63616c686f73743a383038302f64616772756e2f6c6973742f3f5f666c745f335f6461675f69643d706c616e6573265f666c745f335f73746174653d72756e6e696e67948c28687474703a2f2f6c6f63616c686f73743a383038302f7461736b696e7374616e63652f6c6973742f9465752e	2022-09-25 20:40:52.278478
\.


--
-- Data for Name: sla_miss; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.sla_miss (task_id, dag_id, execution_date, email_sent, "timestamp", description, notification_sent) FROM stdin;
\.


--
-- Data for Name: slot_pool; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.slot_pool (id, pool, slots, description) FROM stdin;
1	default_pool	128	Default pool
\.


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.station (id, code, title, station_type, popular_title, short_title, transport_type, station_type_name, obj_type) FROM stdin;
8	s9600384	Рощино	airport			plane	аэропорт	station
\.


--
-- Data for Name: task_fail; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_fail (id, task_id, dag_id, start_date, end_date, duration, map_index, run_id) FROM stdin;
1	load_to_db	planes	2022-08-26 16:04:24.128091+05	2022-08-26 16:04:24.374868+05	0	-1	manual__2022-08-26T11:04:21.222846+00:00
2	load_to_db	planes	2022-08-26 16:38:54.263312+05	2022-08-26 16:38:54.573271+05	0	-1	manual__2022-08-26T11:04:21.222846+00:00
3	load_to_db	planes	2022-08-26 16:39:06.170266+05	2022-08-26 16:39:06.374507+05	0	-1	manual__2022-08-26T11:39:00.809769+00:00
4	load_to_db	planes	2022-08-26 16:41:07.160275+05	2022-08-26 16:41:07.315412+05	0	-1	manual__2022-08-26T11:39:00.809769+00:00
5	load_to_db	planes	2022-08-26 16:44:24.702897+05	2022-08-26 16:44:25.06134+05	0	-1	manual__2022-08-26T11:44:21.625864+00:00
6	load_to_db	planes	2022-08-26 16:53:20.274583+05	2022-08-26 16:53:20.43933+05	0	-1	manual__2022-08-26T11:53:17.284767+00:00
7	load_to_db	planes	2022-08-26 16:55:20.744461+05	2022-08-26 16:55:20.949979+05	0	-1	manual__2022-08-26T11:53:17.284767+00:00
8	load_to_db	planes	2022-08-26 16:58:02.693584+05	2022-08-26 16:58:03.054778+05	0	-1	manual__2022-08-26T11:57:59.589672+00:00
9	load_to_db	planes	2022-08-26 17:00:03.567806+05	2022-08-26 17:00:03.807787+05	0	-1	manual__2022-08-26T11:57:59.589672+00:00
10	load_to_db	planes	2022-08-26 17:03:14.091492+05	2022-08-26 17:03:14.323346+05	0	-1	manual__2022-08-26T12:03:10.090438+00:00
11	load_to_db	planes	2022-08-26 17:05:15.092393+05	2022-08-26 17:05:15.283512+05	0	-1	manual__2022-08-26T12:03:10.090438+00:00
12	load_to_db	planes	2022-08-26 17:06:55.786408+05	2022-08-26 17:06:55.97585+05	0	-1	manual__2022-08-26T12:06:52.459161+00:00
13	load_to_db	planes	2022-08-26 17:08:56.417856+05	2022-08-26 17:08:56.731176+05	0	-1	manual__2022-08-26T12:06:52.459161+00:00
14	load_to_db	planes	2022-08-26 18:10:05.015264+05	2022-08-26 18:10:05.262632+05	0	-1	manual__2022-08-26T13:10:01.159151+00:00
15	load_to_db	planes	2022-08-26 18:12:05.611847+05	2022-08-26 18:12:05.815073+05	0	-1	manual__2022-08-26T13:10:01.159151+00:00
16	load_to_db	planes	2022-08-26 18:24:50.913866+05	2022-08-26 18:24:51.251655+05	0	-1	manual__2022-08-26T13:24:47.710684+00:00
17	load_to_db	planes	2022-08-26 18:26:51.818241+05	2022-08-26 18:26:52.112385+05	0	-1	manual__2022-08-26T13:24:47.710684+00:00
18	load_to_db	planes	2022-08-26 18:31:14.586782+05	2022-08-26 18:31:15.125018+05	0	-1	manual__2022-08-26T13:31:10.396371+00:00
19	load_to_db	planes	2022-08-26 20:27:23.482831+05	2022-08-26 20:27:23.670732+05	0	-1	manual__2022-08-26T15:27:18.364898+00:00
20	load_to_db	planes	2022-08-26 20:29:24.316923+05	2022-08-26 20:29:24.52745+05	0	-1	manual__2022-08-26T15:27:18.364898+00:00
21	load_to_db	planes	2022-08-26 20:29:49.961454+05	2022-08-26 20:29:50.48668+05	0	-1	manual__2022-08-26T15:29:46.604154+00:00
22	load_to_db	planes	2022-08-26 20:31:51.720546+05	2022-08-26 20:31:52.167706+05	0	-1	manual__2022-08-26T15:29:46.604154+00:00
23	load_to_db	planes	2022-08-26 20:31:56.540268+05	2022-08-26 20:31:56.755411+05	0	-1	manual__2022-08-26T15:31:53.538558+00:00
24	load_to_db	planes	2022-08-26 20:32:58.726496+05	2022-08-26 20:32:59.041953+05	0	-1	manual__2022-08-26T15:32:55.654241+00:00
25	load_to_db	planes	2022-08-26 20:33:56.327078+05	2022-08-26 20:33:56.855653+05	0	-1	manual__2022-08-26T15:33:52.684460+00:00
26	load_to_db	planes	2022-08-26 20:33:57.87471+05	2022-08-26 20:33:58.234676+05	0	-1	manual__2022-08-26T15:31:53.538558+00:00
27	load_to_db	planes	2022-08-26 20:35:00.02169+05	2022-08-26 20:35:00.267141+05	0	-1	manual__2022-08-26T15:32:55.654241+00:00
28	load_to_db	planes	2022-08-26 20:35:14.031905+05	2022-08-26 20:35:14.475474+05	0	-1	manual__2022-08-26T15:35:10.726625+00:00
29	load_to_db	planes	2022-08-26 20:35:57.39139+05	2022-08-26 20:35:57.734031+05	0	-1	manual__2022-08-26T15:33:52.684460+00:00
30	load_to_db	planes	2022-08-26 20:37:15.221945+05	2022-08-26 20:37:15.528324+05	0	-1	manual__2022-08-26T15:35:10.726625+00:00
31	load_to_db	planes	2022-08-26 20:39:59.857832+05	2022-08-26 20:40:00.25111+05	0	-1	manual__2022-08-26T15:39:56.605409+00:00
\.


--
-- Data for Name: task_instance; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_instance (task_id, dag_id, run_id, start_date, end_date, duration, state, try_number, hostname, unixname, job_id, pool, queue, priority_weight, operator, queued_dttm, pid, max_tries, executor_config, pool_slots, queued_by_job_id, external_executor_id, trigger_id, trigger_timeout, next_method, next_kwargs, map_index) FROM stdin;
load_to_db	planes	manual__2022-08-26T11:39:00.809769+00:00	2022-08-26 16:41:07.160275+05	2022-08-26 16:41:07.315412+05	0.155137	failed	2	user-VirtualBox	user	7	default_pool	default	1	PythonOperator	2022-08-26 16:41:06.943715+05	1070320	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:04:21.222846+00:00	2022-08-26 16:04:22.084767+05	2022-08-26 16:04:23.25472+05	1.169953	success	1	user-VirtualBox	user	2	default_pool	default	2	PythonOperator	2022-08-26 16:04:21.651375+05	919578	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:10:01.159151+00:00	2022-08-26 18:10:02.489587+05	2022-08-26 18:10:03.865599+05	1.376012	success	1	user-VirtualBox	user	32	default_pool	default	2	PythonOperator	2022-08-26 18:10:01.945069+05	1420953	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:51:50.444700+00:00	2022-08-26 16:51:51.690315+05	2022-08-26 16:51:52.842662+05	1.152347	success	1	user-VirtualBox	user	15	default_pool	default	2	PythonOperator	2022-08-26 16:51:51.237601+05	1110609	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T12:18:50.438914+00:00	2022-08-26 17:18:50.867451+05	2022-08-26 17:18:52.905399+05	2.037948	success	1	user-VirtualBox	user	30	default_pool	default	2	PythonOperator	2022-08-26 17:18:50.537201+05	1213133	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:51:50.444700+00:00	2022-08-26 16:51:53.716031+05	2022-08-26 16:51:54.007769+05	0.291738	success	1	user-VirtualBox	user	16	default_pool	default	1	PythonOperator	2022-08-26 16:51:53.508819+05	1110736	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T12:18:50.438914+00:00	2022-08-26 17:18:53.995976+05	2022-08-26 17:18:54.21922+05	0.223244	success	1	user-VirtualBox	user	31	default_pool	default	1	PythonOperator	2022-08-26 17:18:53.758757+05	1213300	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:04:21.222846+00:00	2022-08-26 16:38:54.263312+05	2022-08-26 16:38:54.573271+05	0.309959	failed	2	user-VirtualBox	user	4	default_pool	default	1	PythonOperator	2022-08-26 16:38:53.913205+05	1061784	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:53:17.284767+00:00	2022-08-26 16:53:18.65558+05	2022-08-26 16:53:19.660417+05	1.004837	success	1	user-VirtualBox	user	17	default_pool	default	2	PythonOperator	2022-08-26 16:53:18.255831+05	1115696	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:39:00.809769+00:00	2022-08-26 16:39:02.401183+05	2022-08-26 16:39:05.657859+05	3.256676	success	1	user-VirtualBox	user	5	default_pool	default	2	PythonOperator	2022-08-26 16:39:01.890439+05	1062187	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:53:17.284767+00:00	2022-08-26 16:55:20.744461+05	2022-08-26 16:55:20.949979+05	0.205518	failed	2	user-VirtualBox	user	19	default_pool	default	1	PythonOperator	2022-08-26 16:55:20.456263+05	1124059	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:10:01.159151+00:00	2022-08-26 18:12:05.611847+05	2022-08-26 18:12:05.815073+05	0.203226	failed	2	user-VirtualBox	user	34	default_pool	default	1	PythonOperator	2022-08-26 18:12:05.383636+05	1428590	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:45:49.235993+00:00	2022-08-26 16:45:50.229459+05	2022-08-26 16:45:51.179349+05	0.94989	success	1	user-VirtualBox	user	12	default_pool	default	2	PythonOperator	2022-08-26 16:45:49.853983+05	1089091	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:44:21.625864+00:00	2022-08-26 16:44:22.834433+05	2022-08-26 16:44:23.972124+05	1.137691	success	1	user-VirtualBox	user	8	default_pool	default	2	PythonOperator	2022-08-26 16:44:22.417672+05	1083840	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:57:59.589672+00:00	2022-08-26 16:58:00.618198+05	2022-08-26 16:58:02.088424+05	1.470226	success	1	user-VirtualBox	user	20	default_pool	default	2	PythonOperator	2022-08-26 16:58:00.206718+05	1135031	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:13:27.127828+00:00	2022-08-26 18:13:28.325363+05	2022-08-26 18:13:29.304051+05	0.978688	success	1	user-VirtualBox	user	35	default_pool	default	2	PythonOperator	2022-08-26 18:13:27.829417+05	1433136	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:57:59.589672+00:00	2022-08-26 17:00:03.567806+05	2022-08-26 17:00:03.807787+05	0.239981	failed	2	user-VirtualBox	user	22	default_pool	default	1	PythonOperator	2022-08-26 17:00:03.068179+05	1143136	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:13:27.127828+00:00	2022-08-26 18:13:29.965857+05	2022-08-26 18:13:30.231856+05	0.265999	success	1	user-VirtualBox	user	36	default_pool	default	1	PythonOperator	2022-08-26 18:13:29.725359+05	1433235	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T11:44:58.600282+00:00	2022-08-26 16:44:59.941345+05	2022-08-26 16:45:00.872983+05	0.931638	success	1	user-VirtualBox	user	10	default_pool	default	2	PythonOperator	2022-08-26 16:44:59.434451+05	1085929	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:44:58.600282+00:00	2022-08-26 16:45:01.601971+05	2022-08-26 16:45:01.796881+05	0.19491	success	1	user-VirtualBox	user	11	default_pool	default	1	PythonOperator	2022-08-26 16:45:01.336116+05	1086032	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T12:03:10.090438+00:00	2022-08-26 17:03:11.430845+05	2022-08-26 17:03:13.205295+05	1.77445	success	1	user-VirtualBox	user	23	default_pool	default	2	PythonOperator	2022-08-26 17:03:10.995145+05	1157778	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:15:42.790326+00:00	2022-08-26 18:15:43.707298+05	2022-08-26 18:15:44.738288+05	1.03099	success	1	user-VirtualBox	user	37	default_pool	default	2	PythonOperator	2022-08-26 18:15:43.301674+05	1441606	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:45:49.235993+00:00	2022-08-26 16:45:52.527019+05	2022-08-26 16:45:52.791102+05	0.264083	success	1	user-VirtualBox	user	13	default_pool	default	1	PythonOperator	2022-08-26 16:45:52.227739+05	1089215	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:15:42.790326+00:00	2022-08-26 18:15:45.855657+05	2022-08-26 18:15:46.173172+05	0.317515	success	1	user-VirtualBox	user	38	default_pool	default	1	PythonOperator	2022-08-26 18:15:45.440934+05	1441697	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T12:03:10.090438+00:00	2022-08-26 17:05:15.092393+05	2022-08-26 17:05:15.283512+05	0.191119	failed	2	user-VirtualBox	user	25	default_pool	default	1	PythonOperator	2022-08-26 17:05:14.812023+05	1164529	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T11:44:21.625864+00:00	2022-08-26 16:46:26.055485+05	2022-08-26 16:46:26.449686+05	0.394201	success	2	user-VirtualBox	user	14	default_pool	default	1	PythonOperator	2022-08-26 16:46:25.85854+05	1091292	1	\\x80057d942e	1	1	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T12:06:52.459161+00:00	2022-08-26 17:06:53.729011+05	2022-08-26 17:06:54.695368+05	0.966357	success	1	user-VirtualBox	user	27	default_pool	default	2	PythonOperator	2022-08-26 17:06:53.264749+05	1168927	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:16:51.196262+00:00	2022-08-26 18:16:52.334508+05	2022-08-26 18:16:53.55439+05	1.219882	success	1	user-VirtualBox	user	39	default_pool	default	2	PythonOperator	2022-08-26 18:16:51.773408+05	1445429	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:16:51.196262+00:00	2022-08-26 18:16:54.948019+05	2022-08-26 18:16:55.348823+05	0.400804	success	1	user-VirtualBox	user	40	default_pool	default	1	PythonOperator	2022-08-26 18:16:54.48669+05	1445528	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T12:06:52.459161+00:00	2022-08-26 17:08:56.417856+05	2022-08-26 17:08:56.731176+05	0.31332	failed	2	user-VirtualBox	user	29	default_pool	default	1	PythonOperator	2022-08-26 17:08:56.194135+05	1176184	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:29:46.604154+00:00	2022-08-26 20:31:51.720546+05	2022-08-26 20:31:52.167706+05	0.44716	failed	2	user-VirtualBox	user	62	default_pool	default	1	PythonOperator	2022-08-26 20:31:51.148946+05	1974611	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:20:03.122726+00:00	2022-08-26 18:20:04.465064+05	2022-08-26 18:20:06.904688+05	2.439624	success	1	user-VirtualBox	user	41	default_pool	default	2	PythonOperator	2022-08-26 18:20:03.917153+05	1456735	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:24:47.710684+00:00	2022-08-26 18:24:48.548215+05	2022-08-26 18:24:49.872466+05	1.324251	success	1	user-VirtualBox	user	45	default_pool	default	2	PythonOperator	2022-08-26 18:24:48.161278+05	1472922	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:39:56.605409+00:00	2022-08-26 20:42:00.900904+05	2022-08-26 20:42:01.164038+05	0.263134	success	2	user-VirtualBox	user	79	default_pool	default	1	PythonOperator	2022-08-26 20:42:00.671991+05	2010167	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:20:03.122726+00:00	2022-08-26 18:20:07.896748+05	2022-08-26 18:20:08.123265+05	0.226517	success	1	user-VirtualBox	user	42	default_pool	default	1	PythonOperator	2022-08-26 18:20:07.596913+05	1456899	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:31:53.538558+00:00	2022-08-26 20:31:55.052861+05	2022-08-26 20:31:56.118149+05	1.065288	success	1	user-VirtualBox	user	63	default_pool	default	2	PythonOperator	2022-08-26 20:31:54.665707+05	1974774	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:32:55.654241+00:00	2022-08-26 20:32:56.670448+05	2022-08-26 20:32:57.829238+05	1.15879	success	1	user-VirtualBox	user	65	default_pool	default	2	PythonOperator	2022-08-26 20:32:56.279921+05	1978196	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:21:01.210179+00:00	2022-08-26 18:21:01.929741+05	2022-08-26 18:21:03.098916+05	1.169175	success	1	user-VirtualBox	user	43	default_pool	default	2	PythonOperator	2022-08-26 18:21:01.431589+05	1459645	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:24:47.710684+00:00	2022-08-26 18:26:51.818241+05	2022-08-26 18:26:52.112385+05	0.294144	failed	2	user-VirtualBox	user	47	default_pool	default	1	PythonOperator	2022-08-26 18:26:51.536299+05	1480178	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:21:01.210179+00:00	2022-08-26 18:21:04.063747+05	2022-08-26 18:21:04.271622+05	0.207875	success	1	user-VirtualBox	user	44	default_pool	default	1	PythonOperator	2022-08-26 18:21:03.808331+05	1459751	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:28:47.097572+00:00	2022-08-26 18:28:47.718861+05	2022-08-26 18:28:49.359003+05	1.640142	success	1	user-VirtualBox	user	48	default_pool	default	2	PythonOperator	2022-08-26 18:28:47.337295+05	1487027	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:29:32.272382+00:00	2022-08-26 18:29:33.15268+05	2022-08-26 18:29:34.179152+05	1.026472	success	1	user-VirtualBox	user	50	default_pool	default	2	PythonOperator	2022-08-26 18:29:32.774494+05	1489626	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:28:47.097572+00:00	2022-08-26 18:28:49.843777+05	2022-08-26 18:28:50.156446+05	0.312669	success	1	user-VirtualBox	user	49	default_pool	default	1	PythonOperator	2022-08-26 18:28:49.480691+05	1487115	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:29:32.272382+00:00	2022-08-26 18:29:35.335435+05	2022-08-26 18:29:35.70552+05	0.370085	success	1	user-VirtualBox	user	51	default_pool	default	1	PythonOperator	2022-08-26 18:29:35.023307+05	1489731	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:33:52.684460+00:00	2022-08-26 20:33:53.716116+05	2022-08-26 20:33:54.719053+05	1.002937	success	1	user-VirtualBox	user	67	default_pool	default	2	PythonOperator	2022-08-26 20:33:53.346239+05	1981367	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:30:02.555769+00:00	2022-08-26 18:30:03.503436+05	2022-08-26 18:30:06.253983+05	2.750547	success	1	user-VirtualBox	user	52	default_pool	default	2	PythonOperator	2022-08-26 18:30:03.0942+05	1491276	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:31:53.538558+00:00	2022-08-26 20:33:57.87471+05	2022-08-26 20:33:58.234676+05	0.359966	failed	2	user-VirtualBox	user	69	default_pool	default	1	PythonOperator	2022-08-26 20:33:57.460818+05	1981542	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:30:02.555769+00:00	2022-08-26 18:30:06.906272+05	2022-08-26 18:30:07.203019+05	0.296747	success	1	user-VirtualBox	user	53	default_pool	default	1	PythonOperator	2022-08-26 18:30:06.434278+05	1491439	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T13:31:10.396371+00:00	2022-08-26 18:31:11.803322+05	2022-08-26 18:31:13.897558+05	2.094236	success	1	user-VirtualBox	user	54	default_pool	default	2	PythonOperator	2022-08-26 18:31:11.379069+05	1494968	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:32:55.654241+00:00	2022-08-26 20:35:00.02169+05	2022-08-26 20:35:00.267141+05	0.245451	failed	2	user-VirtualBox	user	70	default_pool	default	1	PythonOperator	2022-08-26 20:34:59.679862+05	1985378	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:35:10.726625+00:00	2022-08-26 20:35:11.588495+05	2022-08-26 20:35:12.545451+05	0.956956	success	1	user-VirtualBox	user	71	default_pool	default	2	PythonOperator	2022-08-26 20:35:10.998192+05	1985991	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T13:31:10.396371+00:00	2022-08-26 18:33:16.053164+05	2022-08-26 18:33:16.241108+05	0.187944	success	2	user-VirtualBox	user	56	default_pool	default	1	PythonOperator	2022-08-26 18:33:15.83037+05	1502637	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:27:18.364898+00:00	2022-08-26 20:27:19.742291+05	2022-08-26 20:27:22.880216+05	3.137925	success	1	user-VirtualBox	user	57	default_pool	default	2	PythonOperator	2022-08-26 20:27:19.248548+05	1958357	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:33:52.684460+00:00	2022-08-26 20:35:57.39139+05	2022-08-26 20:35:57.734031+05	0.342641	failed	2	user-VirtualBox	user	73	default_pool	default	1	PythonOperator	2022-08-26 20:35:57.103855+05	1988619	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:35:10.726625+00:00	2022-08-26 20:37:15.221945+05	2022-08-26 20:37:15.528324+05	0.306379	failed	2	user-VirtualBox	user	74	default_pool	default	1	PythonOperator	2022-08-26 20:37:14.992283+05	1993416	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:27:18.364898+00:00	2022-08-26 20:29:24.316923+05	2022-08-26 20:29:24.52745+05	0.210527	failed	2	user-VirtualBox	user	59	default_pool	default	1	PythonOperator	2022-08-26 20:29:24.062469+05	1965740	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:29:46.604154+00:00	2022-08-26 20:29:48.037191+05	2022-08-26 20:29:49.196139+05	1.158948	success	1	user-VirtualBox	user	60	default_pool	default	2	PythonOperator	2022-08-26 20:29:47.654979+05	1966977	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:39:56.605409+00:00	2022-08-26 20:39:57.236341+05	2022-08-26 20:39:58.97514+05	1.738799	success	1	user-VirtualBox	user	75	default_pool	default	2	PythonOperator	2022-08-26 20:39:56.833988+05	2003327	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
get_planes_schedule	planes	manual__2022-08-26T15:40:45.547399+00:00	2022-08-26 20:40:47.221489+05	2022-08-26 20:40:48.126631+05	0.905142	success	1	user-VirtualBox	user	77	default_pool	default	2	PythonOperator	2022-08-26 20:40:46.727923+05	2005843	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
load_to_db	planes	manual__2022-08-26T15:40:45.547399+00:00	2022-08-26 20:40:48.807714+05	2022-08-26 20:40:51.544632+05	2.736918	success	1	user-VirtualBox	user	78	default_pool	default	1	PythonOperator	2022-08-26 20:40:48.551928+05	2005929	1	\\x80057d942e	1	26	\N	\N	\N	\N	\N	-1
\.


--
-- Data for Name: task_map; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_map (dag_id, task_id, run_id, map_index, length, keys) FROM stdin;
\.


--
-- Data for Name: task_reschedule; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_reschedule (id, task_id, dag_id, try_number, start_date, end_date, duration, reschedule_date, run_id, map_index) FROM stdin;
\.


--
-- Data for Name: thread; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.thread (id, uid, title, number, short_title, carrier, transport_type, vehicle) FROM stdin;
1	TK-3973_220826_c680_12	Тюмень — Анталья	TK 3973	Тюмень — Анталья	1	plane	Boeing 737-800
2	N4-561_220826_c2543_12	Тюмень — Сочи	N4 561	Тюмень — Сочи	2	plane	Airbus А321
3	UT-9857_220826_c29_12	Тюмень — Новый Уренгой	UT 9857	Тюмень — Новый Уренгой	3	plane	Boeing 737-500
4	A4-6034_220826_c60780_12	Тюмень — Минеральные Воды	A4 6034	Тюмень — Минеральные Воды	4	plane	Сухой Суперджет 100
5	SU-1503_220826_c26_12	Тюмень — Москва	SU 1503	Тюмень — Москва	5	plane	\N
6	YC-185_220826_c69_12	Тюмень — Сочи	YC 185	Тюмень — Сочи	6	plane	Airbus А320
7	FV-6452_220826_c8565_12	Тюмень — Санкт-Петербург	FV 6452	Тюмень — Санкт-Петербург	7	plane	Airbus A319
8	DP-592_220826_c9144_12	Тюмень — Санкт-Петербург	DP 592	Тюмень — Санкт-Петербург	8	plane	Boeing 737-800
9	UT-125_220826_c29_12	Тюмень — Уфа	UT 125	Тюмень — Уфа	3	plane	ATR 72
10	SU-1569_220826_c26_12	Тюмень — Москва	SU 1569	Тюмень — Москва	5	plane	Airbus A320
11	DP-450_220826_c9144_12	Тюмень — Москва	DP 450	Тюмень — Москва	8	plane	Boeing 737-800
12	YC-10_220826_c69_12	Тюмень — Салехард	YC 10	Тюмень — Салехард	6	plane	Airbus А320
13	UT-120_220826_c29_12	Тюмень — Сургут	UT 120	Тюмень — Сургут	3	plane	ATR 72
14	UT-454_220826_c29_12	Тюмень — Москва	UT 454	Тюмень — Москва	3	plane	Boeing 737-800
15	YC-885_220826_c69_12	Тюмень — Сочи	YC 885	Тюмень — Сочи	6	plane	Сухой Суперджет 100
16	SU-1509_220826_c26_12	Тюмень — Москва	SU 1509	Тюмень — Москва	5	plane	Airbus А320
17	YC-145_220826_c69_12	Тюмень — Новый Уренгой	YC 145	Тюмень — Новый Уренгой	6	plane	Сухой Суперджет 100
18	UT-319_220826_c29_12	Тюмень — Ханты-Мансийск	UT 319	Тюмень — Ханты-Мансийск	3	plane	ATR 72
19	YC-147_220826_c69_12	Тюмень — Надым	YC 147	Тюмень — Надым	6	plane	Сухой Суперджет 100
20	UT-287_220826_c29_12	Тюмень — Нижневартовск	UT 287	Тюмень — Нижневартовск	3	plane	ATR 72
21	RUSQUT-345_220826_c29_12	Тюмень — Красноселькуп	ЮТ 345	Тюмень — Красноселькуп	3	plane	\N
22	UT-131_220826_c29_12	Тюмень — Игрим	UT 131	Тюмень — Игрим	3	plane	АН-24
23	UT-541_220826_c29_12	Тюмень — Новый Уренгой	UT 541	Тюмень — Новый Уренгой	3	plane	Boeing 737-400
24	SU-2977_220826_c26_12	Тюмень — Сочи	SU 2977	Тюмень — Сочи	5	plane	Airbus A320
25	YC-149_220826_c69_12	Тюмень — Ноябрьск	YC 149	Тюмень — Ноябрьск	6	plane	Сухой Суперджет 100
26	UT-127_220826_c29_12	Тюмень — Советский	UT 127	Тюмень — Советский	3	plane	ATR 72
27	YC-9846_220826_c69_12	Тюмень — Салехард	YC 9846	Тюмень — Салехард	6	plane	Airbus А320
28	FV-6362_220826_c8565_12	Тюмень — Москва	FV 6362	Тюмень — Москва	7	plane	Сухой Суперджет 100
29	YC-46_220826_c69_12	Тюмень — Салехард	YC 46	Тюмень — Салехард	6	plane	Airbus А321
30	S7-5352_220826_c23_12	Тюмень — Новосибирск	S7 5352	Тюмень — Новосибирск	9	plane	Embraer 170
31	UT-279_220826_c29_12	Тюмень — Екатеринбург	UT 279	Тюмень — Екатеринбург	3	plane	ATR 72
32	4G-214_220826_c54_12	Новый Уренгой — Москва	4G 214	Новый Уренгой — Москва	10	plane	Сухой Суперджет 100
33	SU-1501_220826_c26_12	Тюмень — Москва	SU 1501	Тюмень — Москва	5	plane	Airbus A321
34	WZ-1306_220826_c617_12	Тюмень — Самара	WZ 1306	Тюмень — Самара	11	plane	Сухой Суперджет 100
35	UT-464_220826_c29_12	Тюмень — Москва	UT 464	Тюмень — Москва	3	plane	Boeing 737-400
36	UT-209_220826_c29_12	Тюмень — Казань	UT 209	Тюмень — Казань	3	plane	ATR 72
37	FV-6450_220826_c8565_12	Тюмень — Санкт-Петербург	FV 6450	Тюмень — Санкт-Петербург	7	plane	Airbus A319
38	SU-1507_220826_c26_12	Тюмень — Москва	SU 1507	Тюмень — Москва	5	plane	Airbus A320
39	N4-2009_220826_c2543_12	Тюмень — Ош	N4 2009	Тюмень — Ош	2	plane	Airbus А321
40	UT-102_220826_c29_12	Тюмень — Сургут	UT 102	Тюмень — Сургут	3	plane	ATR 72
41	S7-5354_220826_c23_12	Тюмень — Новосибирск	S7 5354	Тюмень — Новосибирск	9	plane	Embraer 170
\.


--
-- Data for Name: trigger; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.trigger (id, classpath, kwargs, created_date, triggerer_id) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.variable (id, key, val, is_encrypted, description) FROM stdin;
\.


--
-- Data for Name: xcom; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.xcom (dag_run_id, task_id, key, value, "timestamp", dag_id, run_id, map_index) FROM stdin;
\.


--
-- Name: Station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public."Station_id_seq"', 8, true);


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 11, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 92, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 207, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 49, true);


--
-- Name: callback_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.callback_request_id_seq', 1, false);


--
-- Name: carrier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.carrier_id_seq', 11, true);


--
-- Name: connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.connection_id_seq', 52, true);


--
-- Name: dag_pickle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_pickle_id_seq', 1, false);


--
-- Name: dag_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_run_id_seq', 30, true);


--
-- Name: flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.flight_id_seq', 82, true);


--
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.import_error_id_seq', 9, true);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.job_id_seq', 79, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.log_id_seq', 407, true);


--
-- Name: log_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.log_template_id_seq', 2, true);


--
-- Name: sensor_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.sensor_instance_id_seq', 1, false);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.session_id_seq', 28, true);


--
-- Name: slot_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.slot_pool_id_seq', 1, true);


--
-- Name: task_fail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_fail_id_seq', 31, true);


--
-- Name: task_reschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_reschedule_id_seq', 1, false);


--
-- Name: thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.thread_id_seq', 41, true);


--
-- Name: trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.trigger_id_seq', 1, false);


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.variable_id_seq', 1, false);


--
-- Name: station Station_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT "Station_pkey" PRIMARY KEY (id);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: callback_request callback_request_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.callback_request
    ADD CONSTRAINT callback_request_pkey PRIMARY KEY (id);


--
-- Name: carrier carrier_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.carrier
    ADD CONSTRAINT carrier_pkey PRIMARY KEY (id);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- Name: dag_code dag_code_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_code
    ADD CONSTRAINT dag_code_pkey PRIMARY KEY (fileloc_hash);


--
-- Name: dag_pickle dag_pickle_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle
    ADD CONSTRAINT dag_pickle_pkey PRIMARY KEY (id);


--
-- Name: dag dag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag
    ADD CONSTRAINT dag_pkey PRIMARY KEY (dag_id);


--
-- Name: dag_run dag_run_dag_id_execution_date_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_execution_date_key UNIQUE (dag_id, execution_date);


--
-- Name: dag_run dag_run_dag_id_run_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_run_id_key UNIQUE (dag_id, run_id);


--
-- Name: dag_run dag_run_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_pkey PRIMARY KEY (id);


--
-- Name: dag_tag dag_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_pkey PRIMARY KEY (name, dag_id);


--
-- Name: flight flight_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (id);


--
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error
    ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: log_template log_template_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log_template
    ADD CONSTRAINT log_template_pkey PRIMARY KEY (id);


--
-- Name: rendered_task_instance_fields rendered_task_instance_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rendered_task_instance_fields_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: sensor_instance sensor_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.sensor_instance
    ADD CONSTRAINT sensor_instance_pkey PRIMARY KEY (id);


--
-- Name: serialized_dag serialized_dag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.serialized_dag
    ADD CONSTRAINT serialized_dag_pkey PRIMARY KEY (dag_id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_session_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_session_id_key UNIQUE (session_id);


--
-- Name: sla_miss sla_miss_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.sla_miss
    ADD CONSTRAINT sla_miss_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: slot_pool slot_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pkey PRIMARY KEY (id);


--
-- Name: slot_pool slot_pool_pool_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pool_key UNIQUE (pool);


--
-- Name: task_fail task_fail_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_pkey PRIMARY KEY (id);


--
-- Name: task_instance task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: task_map task_map_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_map
    ADD CONSTRAINT task_map_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: task_reschedule task_reschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_pkey PRIMARY KEY (id);


--
-- Name: thread thread_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.thread
    ADD CONSTRAINT thread_pkey PRIMARY KEY (id);


--
-- Name: trigger trigger_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.trigger
    ADD CONSTRAINT trigger_pkey PRIMARY KEY (id);


--
-- Name: connection unique_conn_id; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT unique_conn_id UNIQUE (conn_id);


--
-- Name: variable variable_key_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_key_key UNIQUE (key);


--
-- Name: variable variable_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- Name: xcom xcom_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT xcom_pkey PRIMARY KEY (dag_run_id, task_id, map_index, key);


--
-- Name: dag_id_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX dag_id_state ON public.dag_run USING btree (dag_id, state);


--
-- Name: fki_carrier_fk; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX fki_carrier_fk ON public.thread USING btree (carrier);


--
-- Name: fki_station_fk; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX fki_station_fk ON public.flight USING btree (station);


--
-- Name: fki_thread_fk; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX fki_thread_fk ON public.flight USING btree (thread);


--
-- Name: idx_dag_run_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_dag_id ON public.dag_run USING btree (dag_id);


--
-- Name: idx_dag_run_queued_dags; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_queued_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'queued'::text);


--
-- Name: idx_dag_run_running_dags; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_running_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'running'::text);


--
-- Name: idx_fileloc_hash; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_fileloc_hash ON public.serialized_dag USING btree (fileloc_hash);


--
-- Name: idx_job_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_job_dag_id ON public.job USING btree (dag_id);


--
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- Name: idx_last_scheduling_decision; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_last_scheduling_decision ON public.dag_run USING btree (last_scheduling_decision);


--
-- Name: idx_log_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_dag ON public.log USING btree (dag_id);


--
-- Name: idx_log_event; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_event ON public.log USING btree (event);


--
-- Name: idx_next_dagrun_create_after; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_next_dagrun_create_after ON public.dag USING btree (next_dagrun_create_after);


--
-- Name: idx_root_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_root_dag_id ON public.dag USING btree (root_dag_id);


--
-- Name: idx_task_fail_task_instance; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_fail_task_instance ON public.task_fail USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: idx_task_reschedule_dag_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_reschedule_dag_run ON public.task_reschedule USING btree (dag_id, run_id);


--
-- Name: idx_task_reschedule_dag_task_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_reschedule_dag_task_run ON public.task_reschedule USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: idx_xcom_key; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_xcom_key ON public.xcom USING btree (key);


--
-- Name: idx_xcom_task_instance; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_xcom_task_instance ON public.xcom USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: job_type_heart; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX job_type_heart ON public.job USING btree (job_type, latest_heartbeat);


--
-- Name: si_hashcode; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX si_hashcode ON public.sensor_instance USING btree (hashcode);


--
-- Name: si_shardcode; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX si_shardcode ON public.sensor_instance USING btree (shardcode);


--
-- Name: si_state_shard; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX si_state_shard ON public.sensor_instance USING btree (state, shardcode);


--
-- Name: si_updated_at; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX si_updated_at ON public.sensor_instance USING btree (updated_at);


--
-- Name: sm_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX sm_dag ON public.sla_miss USING btree (dag_id);


--
-- Name: ti_dag_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_run ON public.task_instance USING btree (dag_id, run_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_state ON public.task_instance USING btree (dag_id, state);


--
-- Name: ti_job_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_job_id ON public.task_instance USING btree (job_id);


--
-- Name: ti_pool; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_pool ON public.task_instance USING btree (pool, state, priority_weight);


--
-- Name: ti_primary_key; Type: INDEX; Schema: public; Owner: airflow
--

CREATE UNIQUE INDEX ti_primary_key ON public.sensor_instance USING btree (dag_id, task_id, execution_date);


--
-- Name: ti_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state ON public.task_instance USING btree (state);


--
-- Name: ti_state_lkp; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state_lkp ON public.task_instance USING btree (dag_id, task_id, run_id, state);


--
-- Name: ti_trigger_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_trigger_id ON public.task_instance USING btree (trigger_id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: thread carrier_fk; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.thread
    ADD CONSTRAINT carrier_fk FOREIGN KEY (carrier) REFERENCES public.carrier(id) NOT VALID;


--
-- Name: dag_tag dag_tag_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: rendered_task_instance_fields rtif_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rtif_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: flight station_fk; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT station_fk FOREIGN KEY (station) REFERENCES public.station(id) NOT VALID;


--
-- Name: task_fail task_fail_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_instance task_instance_dag_run_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_dag_run_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- Name: dag_run task_instance_log_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT task_instance_log_template_id_fkey FOREIGN KEY (log_template_id) REFERENCES public.log_template(id);


--
-- Name: task_instance task_instance_trigger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES public.trigger(id) ON DELETE CASCADE;


--
-- Name: task_map task_map_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_map
    ADD CONSTRAINT task_map_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_reschedule task_reschedule_dr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_dr_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- Name: task_reschedule task_reschedule_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: flight thread_fk; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT thread_fk FOREIGN KEY (thread) REFERENCES public.thread(id) NOT VALID;


--
-- Name: xcom xcom_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT xcom_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

