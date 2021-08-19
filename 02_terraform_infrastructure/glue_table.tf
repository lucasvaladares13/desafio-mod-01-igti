resource "aws_glue_catalog_table" "aws_glue_desafio_mod_01_table" {
  name          = "table_desafio_mod_01"
  database_name = aws_glue_catalog_database.aws_glue_desafio_mod_01_database.name
}