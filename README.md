# terraform-modular-approach
Creating terraform modules for a microservice architecture. This is Modular approach

Welcome to the terraform-modular-approach wiki!

# Terraform Modules

* Instead of writing script for creating multiple AWS resources in a single main.tf file, its better to breakdown each resource as module. Like terraform script for EC2 creation as a seperate module .... 
* In this way we can get ownership for that module and maintainance of a single module is easy.  Any other teams who want the terraform code to create EC2 instance can re-use this module created specifically for EC2. 
* If all the code is in single main.tf file , its difficult to reuse some particular resource code. 
 
### Here are the key benefits:


**Modularity:** Terraform modules allow you to break down your infrastructure configuration into smaller, self-contained components. This modularity makes it easier to manage and reason about your infrastructure because each module handles a specific piece of functionality, such as an EC2 instance, a database, or a network configuration.

**Reusability:** With modules, you can create reusable templates for common infrastructure components. Instead of rewriting similar configurations for multiple projects, you can reuse modules across different Terraform projects. This reduces duplication and promotes consistency in your infrastructure.


**Versioning and Maintenance:** Modules can have their own versioning, making it easier to manage updates and changes. When you update a module, you can increment its version, and other projects using that module can choose when to adopt the new version, helping to prevent unexpected changes in existing deployments.

**Testing and Validation:** Modules can be individually tested and validated, ensuring that they work correctly before being used in multiple projects. This reduces the risk of errors propagating across your infrastructure.

**Scalability:** As your infrastructure grows, modules provide a scalable approach to managing complexity. You can continue to create new modules for different components of your architecture, maintaining a clean and organized codebase.

## Variable.tf file

* Instead of hard-coding variable values in variable.tf file, We can pass the variable values while execution during "terraform apply --var <variable name/value>" 

* Another best method, to create "terraform.tfvars file" and pass variable values into this. We can ignore pushing this file to github repo as it has sensitive information. We don't need to push this file to git repo. 
* If any team is using this particular module (like for creating of EC2 instance) , they can use the module and create their own "terraform.tfvars" file.
* Once we create tfvars file, terraform will automatically look for this file during "terraform apply". The default name for tfvars is **"terraform.tfvars"** .
* We can change its name according to environments like dev, QA, Pre-prod etc. like **"dev.tfvars"** . But in that case as it is not the default name for tfvars, terraform cannot pick it automatically, instead we have to pass this file name during **"terraform apply -var-file=dev.tfvars"**


## Terraform tfvars
* In Terraform, .tfvars files (typically with a .tfvars extension) are used to set specific values for input variables defined in your Terraform configuration.
* They allow you to separate configuration values from your Terraform code, making it easier to manage different configurations for different environments (e.g., development, staging, production) or to store sensitive information without exposing it in your code.

### Here's the purpose of .tfvars files:

**Separation of Configuration from Code:** Input variables in Terraform are meant to be configurable so that you can use the same code with different sets of values. Instead of hardcoding these values directly into your .tf files, you use .tfvars files to keep the configuration separate. This makes it easier to maintain and manage configurations for different environments.

**Sensitive Information:** .tfvars files are a common place to store sensitive information like API keys, access credentials, or secrets. These sensitive values can be kept outside the version control system, enhancing security and preventing accidental exposure of secrets in your codebase.

**Reusability:** By keeping configuration values in separate .tfvars files, you can reuse the same Terraform code with different sets of variables. This is useful for creating infrastructure for different projects or environments using a single set of Terraform modules.

**Collaboration:** When working in a team, each team member can have their own .tfvars file to set values specific to their environment or workflow. This avoids conflicts in the codebase when multiple people are working on the same Terraform project.

## Outputs.tf file
* Create this file to print the resources values on to the terminal as output. 


# Install AWS CLI

* Its a pre-requisite for terraform that, when we are configuring terraform with AWS, we should authenticate cloud provider with CLI. I am using Linux VM to setup with terraform and apply the scripts to create resources in AWS.
* So using AWS CLI, authenticate AWS cloud by providing access key and secret access key.

## Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

Configure AWS
```
aws configure
```
provide access key and secret access key


## Install Terraform

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


We can create a seperate repo for terraform modules for each AWS resource. We can call the module to the main.tf file (give module path in the source) and pass the values in tfvars file and execute terraform. 

## Sample directory structure
.
├── main.tf

├── module

│   └── ec2_instance

│       ├── ec2-instance.tf

│       ├── outputs.tf

│       └── variables.tf

└── terraform.tfvars


# Terraform commands
```
terraform init
terraform plan
terraform apply
terraform destroy
tree                   // to see the terraform files directory structure
```










