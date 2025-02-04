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







