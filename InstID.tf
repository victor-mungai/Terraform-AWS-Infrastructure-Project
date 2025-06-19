# ------------------------------------------------------------------------
# Data Source: aws_ami
# 
# This data source retrieves the most recent Amazon Linux 2 AMI that matches
# the following criteria:
#   - Name pattern: amzn2-ami-hvm-*-x86_64-gp2
#   - Virtualization type: hvm
#   - Owned by: Amazon
#
# Output:
#   ami_id - The ID of the selected AMI, exposed as an output variable.
# ------------------------------------------------------------------------
data "aws_ami" "amiId" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]

}
output "ami_id" {
  description = "value of the AMI ID"
  value       = data.aws_ami.amiId.id
}