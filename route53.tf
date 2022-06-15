
# see? https://stackoverflow.com/questions/41631966/no-matching-route53zone-found-terraforms-route53-data-source-is-not-recogniz
data "aws_route53_zone" "selected" {
  name         = "rco.sh."
  private_zone = true
}

resource "aws_route53_record" "m" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "m.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}
