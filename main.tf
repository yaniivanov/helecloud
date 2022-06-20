terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = "eu-central-1"
  # you should use your own keys in order to check code
  access_key = "AKIAVWWHLWNPBD*******K"
  secret_key = "ex1CRgO98r4h5V******qywZDvNWpW47pp2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.1"

  name            = "helecloud"
  cidr            = "10.0.0.0/20"
  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.4.0/23", "10.0.6.0/23", "10.0.8.0/23"]
  public_subnets  = ["10.0.10.0/23", "10.0.12.0/23", "10.0.14.0/23"]

  enable_nat_gateway = true
}


# Define RDS
resource "aws_db_subnet_group" "dp_private" {
  name       = "db_private"
  subnet_ids = module.vpc.private_subnets

}

resource "aws_db_instance" "mysql" {
  identifier           = "mysqldbase"
  instance_class       = "db.t3.micro"
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "8.0"
  username             = "helecloud"
  password             = "helecloud"
  db_subnet_group_name = aws_db_subnet_group.dp_private.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_name              = "helecloud_wp_db"
  multi_az             = true
}


