CREATE DATABASE tmn_planes

CREATE USER airflow WITH password 'postgres';

grant all privileges on database airflow_metadata to airflow;


CREATE TABLE IF NOT EXISTS public.carrier
(
    id integer NOT NULL DEFAULT nextval('carrier_id_seq'::regclass),
    code text COLLATE pg_catalog."default",
    title text COLLATE pg_catalog."default",
    icao text COLLATE pg_catalog."default",
    sirena text COLLATE pg_catalog."default",
    iata text COLLATE pg_catalog."default",
    CONSTRAINT carrier_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.carrier
    OWNER to airflow;


CREATE TABLE IF NOT EXISTS public.station
(
    id integer NOT NULL DEFAULT nextval('"Station_id_seq"'::regclass),
    code text COLLATE pg_catalog."default",
    title text COLLATE pg_catalog."default",
    station_type text COLLATE pg_catalog."default",
    popular_title text COLLATE pg_catalog."default",
    short_title text COLLATE pg_catalog."default",
    transport_type text COLLATE pg_catalog."default",
    station_type_name text COLLATE pg_catalog."default",
    obj_type text COLLATE pg_catalog."default",
    CONSTRAINT "Station_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.station
    OWNER to airflow;


CREATE TABLE IF NOT EXISTS public.thread
(
    id integer NOT NULL DEFAULT nextval('thread_id_seq'::regclass),
    uid text COLLATE pg_catalog."default",
    title text COLLATE pg_catalog."default",
    "number" text COLLATE pg_catalog."default",
    short_title text COLLATE pg_catalog."default",
    carrier integer,
    transport_type text COLLATE pg_catalog."default",
    vehicle text COLLATE pg_catalog."default",
    CONSTRAINT thread_pkey PRIMARY KEY (id),
    CONSTRAINT carrier_fk FOREIGN KEY (carrier)
        REFERENCES public.carrier (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.thread
    OWNER to airflow;
-- Index: fki_carrier_fk

-- DROP INDEX IF EXISTS public.fki_carrier_fk;

CREATE INDEX IF NOT EXISTS fki_carrier_fk
    ON public.thread USING btree
    (carrier ASC NULLS LAST)
    TABLESPACE pg_default;


CREATE TABLE IF NOT EXISTS public.flight
(
    id integer NOT NULL DEFAULT nextval('flight_id_seq'::regclass),
    except_days text COLLATE pg_catalog."default",
    thread integer NOT NULL,
    is_fuzzy boolean,
    departure timestamp with time zone,
    days text COLLATE pg_catalog."default",
    terminal text COLLATE pg_catalog."default",
    arrival timestamp with time zone,
    station integer NOT NULL,
    CONSTRAINT flight_pkey PRIMARY KEY (id),
    CONSTRAINT station_fk FOREIGN KEY (station)
        REFERENCES public.station (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT thread_fk FOREIGN KEY (thread)
        REFERENCES public.thread (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.flight
    OWNER to airflow;
-- Index: fki_station_fk

-- DROP INDEX IF EXISTS public.fki_station_fk;

CREATE INDEX IF NOT EXISTS fki_station_fk
    ON public.flight USING btree
    (station ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_thread_fk

-- DROP INDEX IF EXISTS public.fki_thread_fk;

CREATE INDEX IF NOT EXISTS fki_thread_fk
    ON public.flight USING btree
    (thread ASC NULLS LAST)
    TABLESPACE pg_default;