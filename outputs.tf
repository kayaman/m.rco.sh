output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.website.id
}

output "bucket_endpoint" {
  description = "Bucket endpoint"
  value       = aws_s3_bucket.website.website_endpoint
}

output "domain_name" {
  description = "website domain name"
  value       = var.domain_name
}
