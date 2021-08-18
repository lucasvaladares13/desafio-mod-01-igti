resource "aws_s3_bucket_object" "job_spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/01_parquet_spark.py"
  acl    = "private"
  source = "../etl/01_parquet_spark.py"
  etag   = filemd5("../etl/01_parquet_spark.py")

}