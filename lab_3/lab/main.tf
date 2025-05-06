provider "aws" {
    region = var.region
}

resource "aws_key_pair" "key_pair" {
    key_name   = "my-key-pair"
    public_key = file("./my-key-pair.pub")
  
}

resource "aws_instance" "server_dev" {
    ami           = var.ami[var.region]
    instance_type = var.instance_type

    security_groups = [ aws_security_group.public_security_group.name ]
    key_name = aws_key_pair.key_pair.key_name

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