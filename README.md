


### Uploading the static content to S3

```
aws s3 cp website/ s3://$(terraform output -raw website_bucket_name)/ --recursive

```

### References

https://learn.hashicorp.com/tutorials/terraform/cloudflare-static-website

https://github.com/alexhyett/terraform-s3-static-website