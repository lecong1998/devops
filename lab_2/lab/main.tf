provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "server_dev" {
    ami           = "ami-01938df366ac2d954" 
    instance_type = "t2.medium"

    security_groups = [ aws_security_group.public_security_group.name ]
    key_name = "Key"

    tags = {
        Name = "ServerDev"
    }
}

resource "aws_security_group" "public_security_group" {
    name = "public_security_group"
    description = "Allow SSH and HTTP traffic"

    ingress {
        from_port = 22
        to_port   = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port   = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port   = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}