
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
resource "aws_lb" "app" {
  name                       = "app-elb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.app_ssh_sg.id]
  subnets            =  data.aws_subnets.default.ids

enable_deletion_protection = false
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}


