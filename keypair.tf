# -----------------------------------------------------------------------------
# Resource: aws_key_pair "dove-key"
#
# This resource creates an AWS EC2 key pair named "dove-key" using the provided
# SSH public key. The key pair can be used to securely access EC2 instances.
#
# Arguments:
#   key_name   - The name assigned to the key pair in AWS.
#   public_key - The public SSH key material to associate with the key pair.
#
# Usage:
#   Attach this key pair to EC2 instances to enable SSH access using the
#   corresponding private key.
# -----------------------------------------------------------------------------
resource "aws_key_pair" "dove-key" {
  key_name   = "dove-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHfHMlyAZGLLazGfPPMCqgwofNoLNQsSMSgXln6MjZQJ mungai@DESKTOP-VGOQO2R"
}