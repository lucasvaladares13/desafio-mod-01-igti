resource "aws_glue_crawler" "events_crawler" {
  database_name = aws_glue_catalog_database.aws_glue_desafio_mod_01_database.name
  
  name          = "events_crawler_desafio_mod_01"
  role          = aws_iam_role.glue_role.arn
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
      }
      CrawlerOutput = {
        Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
      }
      Version = 1
    }
  )

  s3_target {
    path = "s3://datalake-lucas-igti-desafio-mod-01/staging-zone/matricula/"
  }
}