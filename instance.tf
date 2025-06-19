# -----------------------------------------------------------------------------
# Resource: aws_instance.web
# 
# Provisions an EC2 instance using the specified AMI and instance type.
# - Uses a key pair for SSH access.
# - Associates the instance with a security group.
# - Places the instance in a specific availability zone.
# - Tags the instance with a name and project.
# - Copies a shell script (web.sh) to the instance and executes it remotely.
#   - Uses SSH connection with user and password from variables/files.
#
# Resource: aws_ec2_instance_state.web-sate
#
# Ensures the EC2 instance remains in the "running" state.
# - References the instance created above.
# -----------------------------------------------------------------------------
resource "aws_instance" "web" {
  ami                    = var.amiId[var.region]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = "us-east-1a"
  tags = {
    Name    = "Dove-Instance"
    project = "Dove"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  connection {
    type     = "ssh"
    user     = var.web_user
    private_key = file("dovekey")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
}
resource "aws_ec2_instance_state" "web-sate" {
  instance_id = aws_instance.web.id
  state       = "running"

}