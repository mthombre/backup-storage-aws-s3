resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "files-photos-videos-upload-backup"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "glacier" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    id = "glacier-1" # Move to glacier after 10 days from original upload
    filter {}

    status = "Enabled"

    transition {
      days          = 10
      storage_class = "GLACIER"
    }

    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE" # Move to glacier deep archive after 180 days from original upload
    }
  }
}