# -----------------------------------------------------------------------------
# AWS Security Group and Rules for "dove-sg"
#
# This configuration defines:
# - An AWS Security Group named "dove-sg" with a descriptive tag.
# - Ingress rules to allow:
#     * SSH (TCP port 22) from any IPv4 address.
#     * HTTP (TCP port 80) from any IPv4 address.
# - Egress rules to allow:
#     * All outbound traffic to any IPv4 address.
#     * All outbound traffic to any IPv6 address.
#
# Note:
# - Allowing SSH (22) and HTTP (80) from 0.0.0.0/0 exposes these ports to the public internet.
#   Restrict CIDR ranges for improved security in production environments.
# - Egress rules permit all outbound traffic.
# -----------------------------------------------------------------------------
resource "aws_security_group" "dove-sg" {
  name        = "dove-sg"
  description = "dove-sg"


  tags = {
    Name = "dove-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}