// This following code prints public ip address of EC2 instance as output
// for the value - it should be combination of "resource and resource name" followed by the value name we want to print

output "public-ip-address" {
  value = aws_instance.example-1.public_ip
}