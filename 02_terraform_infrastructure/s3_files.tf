resource "aws_s3_bucket_object" "job_spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/01_parquet_spark.py"
  acl    = "private"
  source = "../03_etl/01_parquet_spark.py"
  etag   = filemd5("../03_etl/01_parquet_spark.py")

}

resource "aws_s3_object_copy" "S3_file" {
  bucket = aws_s3_bucket.dl.id
  acl    = "private"
  key    = "raw-data/matricula/"
  source = "s3://datalake-lucas-igti-desafio-mod-01/raw-data/matricula/"
}