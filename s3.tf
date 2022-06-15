resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id

  acl = "public-read"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  # not a good practice
  # provisioner "local-exec" {
  #   command = "aws s3 sync ${var.website_root} ${aws_s3_bucket.website.id}"
  # }

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.website.arn,
          "${aws_s3_bucket.website.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_object" "file" {
  for_each = fileset(var.website_root, "**")

  bucket      = aws_s3_bucket.website.id
  key         = each.key
  source      = "${var.website_root}/${each.key}"
  source_hash = filemd5("${var.website_root}/${each.key}")
  acl         = "public-read"
}
