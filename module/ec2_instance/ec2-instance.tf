# provider "aws" {
#   region = "us-east-1"
# }

// providing the resource block
resource "aws_instance" "example-1" {
    ami = var.ami_value
    instance_type = var.instance_type_value
}