from airflow import DAG
from datetime import datetime, timedelta
from airflow.providers.snowflake.operators.snowflake import SnowflakeOperator
from airflow.utils.task_group import TaskGroup
from airflow.operators.email import EmailOperator
from airflow.operators.python import PythonOperator
from airflow.operators.empty import EmptyOperator
from airflow.operators.bash import BashOperator


default_args = {
    'owner': 'Airflow',
    'start_date': datetime(2023, 7, 17),
    'retries':0,
    'retry_delay': timedelta(seconds=0)
}

with DAG('AB_Project',
          default_args=default_args,
          schedule_interval=None,
          template_searchpath=['/opt/airflow/sql_script'],
          catchup=False
    ) as dag:

    start = EmptyOperator(task_id='Start')

    # inserting data into tables from aws s3 bucket
    # with TaskGroup('insert_data') as insert_data:

    insert_employee_data = SnowflakeOperator(task_id='insert_employee_data',
        sql = 'employee.sql',
        snowflake_conn_id='sf_con_sanket')

    end = EmptyOperator(task_id='END')

    start >> insert_employee_data >> end