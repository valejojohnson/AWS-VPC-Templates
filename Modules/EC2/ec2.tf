//------------------------------------------------- Variables & Data ----------------------------------------------//

variable "instance_size" {
  default = "m5.large"
}

variable "iam_role" {
  default = "AmazonSSMRoleForInstancesQuickSetup"
}

variable "terr-prefix" {
  default = "[TERRAFORM]"
}

variable "ec2key" {
  default = "ets-depot"
}

//Pull Latest Windows AMI's from ETS-Depot account
data "aws_ami" "latestwin2016" {
  owners      = ["834117163092"] #ETS-Depot account
  most_recent = true

  filter {
    name   = "name"
    values = ["Golden Windows Server 2016*"]
  }
}

data "aws_ami" "latestwin2019" {
  owners      = ["834117163092"] #ETS-Depot Account
  most_recent = true

  filter {
    name   = "name"
    values = ["Golden Windows Server 2019*"]
  }
}

//------------------------------------------------- Instances ----------------------------------------------------//
resource "aws_instance" "win2016ami" {
  ami                         = data.aws_ami.latestwin2016.id
  instance_type               = var.instance_size
  subnet_id                   = "subnet-090641b2feb77918c"
  vpc_security_group_ids      = ["sg-01af52aa663d71b03", "sg-0d936791e8271e915"]
  iam_instance_profile        = var.iam_role
  associate_public_ip_address = false
  get_password_data           = false
  key_name                    = var.ec2key
  user_data                   = file("./scripts/tenable_install.ps1")

  root_block_device {
    volume_type           = "standard"
    delete_on_termination = true
    volume_size           = "80"
    encrypted             = false
  }

  tags = {
    "Name" = "${var.terr-prefix} Windows 2016 CSO AMI Test"
  }
}

resource "aws_instance" "win2019ami" {
  ami                         = data.aws_ami.latestwin2019.id
  instance_type               = var.instance_size
  subnet_id                   = "subnet-090641b2feb77918c"
  iam_instance_profile        = var.iam_role
  associate_public_ip_address = false
  get_password_data           = false
  key_name                    = var.ec2key
  vpc_security_group_ids      = ["sg-01af52aa663d71b03", "sg-0d936791e8271e915"]

  //Install Tenable Using UserData
  user_data = file("./scripts/tenable_install.ps1")

  root_block_device {
    volume_type           = "standard"
    delete_on_termination = true
    volume_size           = "80"
    encrypted             = false
  }

  tags = {
    "Name" = "${var.terr-prefix} Windows 2019 CSO AMI Test"
  }
}