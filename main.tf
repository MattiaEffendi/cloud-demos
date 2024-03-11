terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = local.region
  profile = local.profile
}

resource "aws_instance" "my_ec2_instance" {
  ami           = local.ami_id # ID del mio AMI con installato Apache e la mia pagina web
  instance_type = "t2.micro" # Tipo di istanza

  security_groups = [
    local.security_group_all_http_name   # ID del security group da applicare a questa macchina.
                                        # Su AWS i security group sono come delle regole di firewall.
                                        # Questo in particolare consente il traffico
                                        # HTTP da qualsiasi host in entrata.
  ]

  tags = {
    Name = "EC2 Instance from Terraform"
  }
}
