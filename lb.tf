# Load Balancer

resource "aws_lb" "lb1" {
  name               = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  # security_groups    = [aws_security_group.lb_sg.id]
  subnets         = aws_subnet.subnet[*].id
  security_groups = [aws_security_group.nginx-sg.id]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.web_bucket.bucket
    prefix  = "alb-logs"
    enabled = true
  }

  tags = local.tags
}

# LB Target Group
resource "aws_lb_target_group" "nginx" {
  name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}


# LB Listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.lb1.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}

# LB Target Group Attachment Instance1
resource "aws_lb_target_group_attachment" "nginx1" {
  count            = length(var.instance_names)
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx-move[count.index].id
  port             = 80
}


# LB Target Group Attachment Instance2


