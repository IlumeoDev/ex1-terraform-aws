terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ─── VPC Module ─────────────────────────────────────────────────────────────
module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = "main"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

# ─── Security Group Module ───────────────────────────────────────────────────
module "security_group" {
  source = "./modules/security_group"
  sg_name = "web-sg"
  vpc_id  = module.vpc.vpc_id
}

# ─── EC2 Module ──────────────────────────────────────────────────────────────
module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = "t3.micro"
  instance_name     = "web-instance"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = "deployer-key"
  ssh_public_key    = var.ssh_public_key
}
