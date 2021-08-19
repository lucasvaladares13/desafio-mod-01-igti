resource "aws_glue_job" "01_parquet_spark" {
  name     = "01_parquet_spark"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://datalake-lucas-igti-desafio-mod-01/emr-code/pyspark/01_parquet_spark.py"
  }
}