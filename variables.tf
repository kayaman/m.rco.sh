variable "domain_name" {
  type        = string
  description = "The domain name"
  default     = "rco.sh"
}

variable "domain_name_alias" {
  type        = string
  description = "The domain name"
  default     = "m.rco.sh"
}

variable "bucket_name" {
  type        = string
  description = "The S3 bucket name"
  default     = "m.rco.sh"
}

variable "website_root" {
  type        = string
  description = "The S3 bucket name"
  default     = "website"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to put the bucket into"
  default     = "sa-east-1"
}

