#Output values are like the return values of a Terraform module
output "aws_instance_region"{
  value = var.aws_region
}
 output "public_ip_address" {
   value = aws_instance.example.*.public_ip
   description = "The IPV4 address of the ec2 instance"
 }
#  output "AWS_ELK_Custom_AMI_ID"{
#   value = "${resources.instances.id}"
# }
