resource "aws_glue_catalog_table" "aws_glue_desafio_mod_01_table_02" {
  name          = "table_desafio_mod_01_v02"
  database_name = aws_glue_catalog_database.aws_glue_desafio_mod_01_database.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "s3://datalake-lucas-igti-desafio-mod-01/staging-zone/matricula/"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "mod_01"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }
  }
}