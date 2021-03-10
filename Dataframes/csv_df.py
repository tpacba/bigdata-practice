import os
from pyspark.sql import SparkSession

os.environ["PYSPARK_PYTHON"] = "python3"
os.environ["PYSPARK_DRIVER_PYTHON"] = "python3"

os.environ["SPARK_HOME"] = "/home/hadoop/spark"

spark = SparkSession.builder.appName("CSV_DF").master("local[*]").getOrCreate()

csv_df = spark.read.format("csv").option("header","true").option("inferSchema","true").load("file:///home/hadoop/datasets/au-500.csv")

csv_df.show(5)

print(csv_df.schema)

csv_df.printSchema()