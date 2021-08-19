from pyspark.sql.functions import mean,max,min,col
from pyspark.sql import SparkSession

spark = (
            SparkSession.builder.appName("ETLSpark")
            .get0rCreate()
        )


file = ( spark
        .read
        .format("csv")
        .option("header",True)
        .option("inferSchema",True)
        .option("delimiter",";")
        .load("s3://datalake-lucas-igti-01/raw-data/desafio-modulo-01/matricula/")
       )

(
    file
    .write
    .mode("overwrite")
    .format("csv")
    .option("header",True)
    .option("inferSchema",True)
    .option("delimiter",";")
    .save("s3://datalake-lucas-igti-desafio-mod-01/raw-data/matricula/")
)

(
    file
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("region")
    .save("s3://datalake-lucas-igti-desafio-mod-01/staging-zone/matricula/")
)