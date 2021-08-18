resource "aws_s3_bucket" "dl" {

  bucket = "datalake-lucas-igti-desafio-mod-01"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

}

resource "aws_s3_bucket" "tf-stage" {

  bucket = "terraform-state-lucas-igti"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

}