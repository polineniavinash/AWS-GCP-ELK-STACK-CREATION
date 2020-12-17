#  Use of data sources allows a Terraform configuration to make use of information defined outside(AWS) of Terraform
data "aws_ami" "ec2-ami" {
  owners = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["Packer-ELK-Master"]
  }

  most_recent = true
}
# Resource creation
resource "aws_instance" "example" {
    count = var.ec2_instance_count
    ami = data.aws_ami.ec2-ami.id
    instance_type = var.aws_instance_type
    # the VPC subnet
    subnet_id = element(aws_subnet.Mypublic_subnets.*.id,count.index)
    # the security group
    vpc_security_group_ids = [aws_security_group.ELK_Stack_SG.id]
    # the public SSH key
    key_name = aws_key_pair.mykeypair.key_name
    # Tags
    tags = {
    Name = "Automated_ELK_Stack"
    User = "Avinash Polineni"
  }
    # Provisioners can be used to model specific actions on the local machine or
    # on a remote machine in order to prepare servers or other infrastructure objects for service.
    provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /etc/ansible/Terraform_ansible/aws_ansible.sh",
      "bash /etc/ansible/Terraform_ansible/aws_ansible.sh",
      "sleep 20",
    ]
   }
   # Most provisioners require access to the remote resource via SSH or WinRM,
   # and expect a nested connection block with details about how to connect
   connection {
     type     = "ssh"
     private_key = "${file(var.PATH_TO_AWS_PRIVATE_KEY)}"
     user = var.aws_ssh_name
     timeout = "1m"
     host = self.public_ip
   }
  }
