resource "aws_key_pair" "accessuk_key" {
  key_name = "${var.ssh_key_name}" 
  public_key = "${var.ssh_access_key}"
}

