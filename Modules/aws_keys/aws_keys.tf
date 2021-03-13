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

resource "aws_key_pair" "vjohnson" {
  key_name   = "vjohnson_${var.environment}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf12U6glLRQ624erwYbrNuAH01pbchsH1MsZoDyAIVlk11hZ6LKXWogY4zA9wOhh4DNVcGqhsnXpV57KrBghikcl2Hwr544tjyVWkoNJ23zZECTtKTNvLrWe5F1ouWwJsCkcfRawXt4kd31EigZcJP0Bh2CqCdOacyPwU01IBivBXF5LkNz1QIJr7nsenAaRcmiWCBnJ1FwkCrlSKY1lyBWBUvsTIvIC9nF8OzbiWWnM/sxunB3IoDnoNzqSlaoRDyYY8PuZE6ravqTqGgU/dmZci2YC/sVpHIF16k5eWlx9WqIhIeMZLR6niAM4xKbEzaa9/AFsifXHKhICAhjNtR vjohnson@PaySign-VJ-MBPro.local"
}
