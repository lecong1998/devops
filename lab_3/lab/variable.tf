variable "image_id" {
    type = string
    description = "value of the image id"
}

variable "instance_type" {
    type = string
    description = "value of the instance type"
    default = "t2.micro"
}

variable "region" {
    type = string
    description = "value of the region"
    default = "ap-southeast-1"
  
}

variable "ami" {

    type = map(any)
    description = "A map of AMI IDs for different regions"
    default = {
        "ap-southeast-1" = "ami-01938df366ac2d954"
        "ap-northeast-1" = "ami-026c39f4021df9abe"
    }
  
}