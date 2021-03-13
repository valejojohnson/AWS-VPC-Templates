resource "aws_iam_group" "paysign-offshore-developers" {
  name = "Paysign_Offshore_Developers"
  path = "/"
}

resource "aws_iam_group" "admins" {
  name = "Admins"
  path = "/"
}

resource "aws_iam_group" "paysign-developers" {
  name = "Paysign_Developers"
  path = "/"
}

resource "aws_iam_group" "bm-vpc-s3-full-access" {
  name = "BM_VPC_S3_Full_Access"
  path = "/"
}

resource "aws_iam_group" "s3-documents-bucket-editors" {
  name = "S3_Documents_Bucket_Editors"
  path = "/"
}
