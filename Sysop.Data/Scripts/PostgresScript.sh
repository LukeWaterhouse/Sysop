psql --username="postgres" --dbname="postgres" -c "CREATE USER sysopUser PASSWORD 'password'"
psql --username="postgres" --dbname="postgres" -l

psql --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE DATABASE sysopdb
           WITH
           OWNER = postgres
           ENCODING = 'UTF8'
           LC_COLLATE = 'en_US.utf8'
		   LC_CTYPE = 'en_US.utf8'
		   TABLESPACE = pg_default
		   CONNECTION LIMIT = -1; 
EOSQL

psql --username "postgres" --dbname "postgres" <<-EOSQL
    GRANT CONNECT ON DATABASE sysopdb TO sysopUser;
	GRANT ALL ON DATABASE sysopdb TO sysopUser;
EOSQL


psql --username="postgres" --dbname="sysopdb" <<-EOSQL

    CREATE TABLE IF NOT EXISTS public.consultant (
        consultant_id varchar(20) primary key,
        name varchar(20),
        specialism varchar(20)
    );

    CREATE TABLE IF NOT EXISTS public.shift_type (
        shift_type_id varchar(20) primary key,
        shift_type varchar(100)
    );

    CREATE TABLE IF NOT EXISTS public.customer (
    customer_id varchar(20) primary key,
    happy_with_price_date boolean
    );

    CREATE TABLE IF NOT EXISTS public.appointment (
        appointment_id varchar(20) primary key,
        consultant_id varchar(20) REFERENCES public.consultant(consultant_id),
        start_time timestamp,
        end_time timestamp
    );

    CREATE TABLE IF NOT EXISTS public.work_day (
        work_day_id varchar(20) primary key,
        day varchar(100),
        shift_type_id varchar(20) REFERENCES public.shift_type(shift_type_id)
    );

    CREATE TABLE IF NOT EXISTS public.fix_category (
        fix_category_id varchar(20) primary key,
        fix_category_name varchar(100)
    );

    CREATE TABLE IF NOT EXISTS public.ticket (
        ticket_id varchar(20) primary key,
        customer_id varchar(20) REFERENCES public.customer(customer_id),
        job_price money,
        job_description varchar(100),
        complete_date_estimate date,
        is_active boolean,
        fix_category_id varchar(20) REFERENCES public.fix_category(fix_category_id)
    );

    CREATE TABLE IF NOT EXISTS public.triage_task (
        triage_task_id varchar(20) primary key,
        appointment_id varchar(20) REFERENCES public.appointment(appointment_id),
        notes varchar(100),
        ticket_id varchar(20) REFERENCES public.ticket(ticket_id)
    );

    CREATE TABLE IF NOT EXISTS public.fix_task (
        fix_task_id varchar(20) primary key,
        appointment_id varchar(20) REFERENCES public.appointment(appointment_id),
        task_complete boolean,
        ticket_id varchar(20) REFERENCES public.ticket(ticket_id)
    );

    CREATE TABLE IF NOT EXISTS public.qa_task (
        qa_task_id varchar(20) primary key,
        appointment_id varchar(20) REFERENCES public.appointment(appointment_id),
        notes varchar(100),
        task_complete boolean,
        qa_result boolean,
        ticket_id varchar(20) REFERENCES public.ticket(ticket_id)
    );


    CREATE TABLE IF NOT EXISTS public.consultant_workday (
        work_day_id varchar(20) REFERENCES public.work_day(work_day_id),
        consultant_id varchar(20) REFERENCES public.consultant(consultant_id)

    );

    CREATE TABLE IF NOT EXISTS public.consultant_fix_category (
        fix_category_id varchar(20) REFERENCES public.fix_category(fix_category_id),
        consultant_id varchar(20) REFERENCES public.consultant(consultant_id)
    );

    CREATE TABLE IF NOT EXISTS public.exception (
        consultant_id varchar(20) REFERENCES public.consultant(consultant_id),
        category varchar(20),
        start_time timestamp,
        end_time timestamp
    );
EOSQL

psql --username="postgres" --dbname="sysopdb" <<-EOSQL
    INSERT INTO customer (customer_id, happy_with_price_date) VALUES (123, true)
EOSQL

psql --username="postgres" --dbname="sysopdb" <<-EOSQL
    INSERT INTO customer (customer_id, happy_with_price_date) VALUES (246, false)
EOSQL

