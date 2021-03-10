from datetime import timedelta

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator

default_args = {
    'owner': 'admin',
    'start_date': airflow.utils.dates.days_ago(1),
    # 'end_date': datetime(2021, 2, 18),
    'depends_on_past': False,
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    # If a task fails, retry it once after waiting
    # at least 5 minutes
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
    }


dag = DAG(
    'spark_demo',
    default_args=default_args,
    description='A demo for spark data pipeline',
    # Continue to run DAG once per day
    schedule_interval=timedelta(days=1),
)

# t1, t2 and t3 are examples of tasks created by instantiating operators
t1 = BashOperator(
    task_id='ingestion_from_mysql',
    bash_command='spark-submit --master local --deploy-mode client --jars /usr/share/java/mysql-connector-java-5.1.48-bin.jar --class com.spark.scala.learning.IngestionFromMysql /home/fieldemployee/IdeaProjects/demo/target/scala-2.12/demo_2.12-0.1.jar',
    dag=dag,
)

t2 = BashOperator(
    task_id='ingestion_from_postgres',
    depends_on_past=False,
    bash_command='spark-submit --master local --deploy-mode client --jars /usr/local/software/postgresql-42.2.18.jar --class com.spark.scala.learning.IngestionFromPostgres /home/fieldemployee/IdeaProjects/demo/target/scala-2.12/demo_2.12-0.1.jar',
    dag=dag,
)

t3 = BashOperator(
    task_id='ingestion_from_oracle',
    depends_on_past=False,
    bash_command='spark-submit --master local --deploy-mode client --jars /usr/local/software/ojdbc6.jar --class com.spark.scala.learning.IngestionFromOracle /home/fieldemployee/IdeaProjects/demo/target/scala-2.12/demo_2.12-0.1.jar',
    dag=dag,
)

t4 = BashOperator(
    task_id='create_hive_tables',
    depends_on_past=False,
    bash_command='spark-submit --master local --deploy-mode client --class com.spark.scala.learning.CreateHiveTables /home/fieldemployee/IdeaProjects/demo/target/scala-2.12/demo_2.12-0.1.jar',
    dag=dag,
)

t5 = BashOperator(
    task_id='load_from_hive',
    depends_on_past=False,
    bash_command='spark-submit --master local --deploy-mode client --jars /usr/local/software/sqlite-jdbc-3.8.7.jar --class com.spark.scala.learning.LoadFromHive /home/fieldemployee/IdeaProjects/demo/target/scala-2.12/demo_2.12-0.1.jar',
    dag=dag,
)


t1 >> t2 >> t3 >> t4 >> t5
