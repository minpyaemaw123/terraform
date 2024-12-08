variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
  #validation {
  #  condition     = can(cidrnetmask(var.vpc_cidr))
  #  error_message = "Invalid CIDR block provided for VPC."
  #}
}

variable "instance_type" {
  default = "t2.micro"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 0
    "private_subnet_2" = 1
    "private_subnet_3" = 2
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 0
    "public_subnet_2" = 1
    "public_subnet_3" = 2
  }
}

variable "environment" {
  description = "Development Environment"
  type        = string
  default     = "dev"
}

variable "server_name" {
  description = "Instance Name"
  type        = string
  default     = "Web EC2 Server"
}


variable "variables_sub_az" {
  description = "Availability Zone for the subnets"
  type        = string
  default     = "us-east-2a"
}

variable "variables_sub_auto_ip" {
  description = "Set Automatic IP Assignment for Variables Subnet"
  type        = bool
  default     = true
}
#For the Security Group Dynamic Block
#Ingress

variable "web_ingress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))

  default = {
    "80" = {
      description = "Port 80"
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "443" = {
      description = "Port 443"
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "22" = {
      description = "SSH"
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "ICMP" = {
      description = "ICMP"
      port        = -1 # ICMP does not use ports; -1 is used for AWS security groups.
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}

#Egress

variable "web_egress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))

  default = {
    "all_outbound" = {
      description = "Allow all outbound traffic"
      port        = 0
      protocol    = "-1" # -1 allows all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "ubuntu_user" {
  description = "User for remote-exec"
  default     = "ubuntu"
}