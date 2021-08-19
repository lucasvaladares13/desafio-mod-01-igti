import sys
from pyspark.context import SparkContext
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv,['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

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