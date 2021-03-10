import os
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
os.environ["PYSPARK_PYTHON"] = "python3"
os.environ["PYSPARK_DRIVER_PYTHON"] = "python3"

os.environ["SPARK_HOME"] = "/home/hadoop/spark"

spark = SparkSession.builder.appName("DStreams_Ex1").master("local[*]").getOrCreate()
sc = spark.sparkContext
streamc = StreamingContext(sc, batchDuration=10)
print(streamc)

data1 = streamc.socketTextStream("localhost", 9099)
data2 = data1.flatMap(lambda x:x.split(" "))
data3 = data2.map(lambda x:(x,1))
data4 = data3.reduceByKey(lambda x,y:x+y)
data4.pprint()

streamc.start()
streamc.awaitTermination()