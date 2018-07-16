#Terraform Partner Guide
#
#
#
#
variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  ami           = "ami-db24d8b6"
  instance_type = "t2.micro"

  subnet_id              = "subnet-1cdc0f20"
  vpc_security_group_ids = ["sg-07eb517a"]

  tags {
    "Indentity" = "Terraform Partner Guide"
    "Name"      = "moose"
    "Zip"       = "zap"
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}
