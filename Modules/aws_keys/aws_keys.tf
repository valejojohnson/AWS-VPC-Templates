resource "aws_key_pair" "bmcgrath" {
  key_name   = "bmcgrath_${var.environment}"
  public_key = "bmcgrath_AWS_key"
}

resource "aws_key_pair" "ekardum" {
  key_name   = "Ekardum_${var.environment}"
  public_key = "Ekardum_AWS_key"
}

resource "aws_key_pair" "mmarciniszyn" {
  key_name   = "mmarciniszyn_${var.environment}"
  public_key = "mmarciniszyn_AWS_key"
}
