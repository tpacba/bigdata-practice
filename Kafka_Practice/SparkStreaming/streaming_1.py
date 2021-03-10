import os
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
os.environ["PYSPARK_PYTHON"] = "python3"
os.environ["PYSPARK_DRIVER_PYTHON"] = "python3"

os.environ["SPARK_HOME"] = "/home/hadoop/spark"

spark = SparkSession.builder.appName("DStreams_Ex").master("local[*]").getOrCreate()
sc = spark.sparkContext
streamc = StreamingContext(sc, batchDuration=10)
print(streamc)

data1 = streamc.socketTextStream("localhost", 9099)

data1.pprint()

streamc.start()
streamc.awaitTermination()

# nc -lk 9099