# A Simple Terraform file to create a virtual network in aws with s3 backend and DynamoDb State locking

provider "aws" {
    access_key = "${var.accesskey}"
    secret_key = "${var.secretkey}"
    region = "${var.location}"
}

resource "aws_vpc" "mainnet" {
    cidr_block = "192.168.0.0/16"

    tags = {
        Name = "mainnet"
    }
  
}

resource "aws_subnet" "websubnet" {
    vpc_id = "${aws_vpc.mainnet.id}"
    cidr_block = "192.168.0.0/24"
}


resource "aws_subnet" "businesssubnet" {
    vpc_id = "${aws_vpc.mainnet.id}"
    cidr_block = "192.168.1.0/24"
}


resource "aws_subnet" "datasubnet" {
    vpc_id = "${aws_vpc.mainnet.id}"
    cidr_block = "192.168.2.0/24"
}





