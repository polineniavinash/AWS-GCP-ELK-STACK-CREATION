# AWS Key Creation
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file(var.PATH_TO_AWS_PUBLIC_KEY)
}
