provider "aws"{
  region = "us-east-1"
}

// Creating variables for the EC2 instance

variable "ami_value" {
    description = "value for the ami"
}

variable "instance_type_value" {
    description = "value for instance_type"
}


// modular approach . Provide source/location for the particular module "ec2 instance"
// we can pass the values for the variables defined in the module in this main.tf file or in the tfvars file. 

module "ec2_instance" {
  source = "./module/ec2_instance"
  ami_value = var.ami_value
  instance_type_value = var.instance_type_value
}