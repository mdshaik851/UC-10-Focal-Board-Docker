resource "aws_lb" "focalboard_alb" {
  name               = "focalboard-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups_id_alb]
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "focalboard_alb"
  }
}

resource "aws_lb_target_group" "focalboard_tg" {
  name     = "focalboard-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    matcher             = "200-399"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.focalboard_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.focalboard_tg.arn
  }
}


resource "aws_lb_target_group_attachment" "focalboard" {
  target_group_arn = aws_lb_target_group.focalboard_tg.arn
  target_id        = var.focal_instance_id
  port             = 8000
}