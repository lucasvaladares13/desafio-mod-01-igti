resource "aws_glue_trigger" "job_trigger" {
  name = "job_trigger"
  type = "ON_DEMAND"

  actions {
    job_name = aws_glue_job.glue_parquet_spark.name
  }
}