resource "aws_lb" "lb" {
    name                = "blue-green"
    internal            = false
    load_balancer_type  = "application"
    aws_security_groups = [aws_security_group.allow_tls.id]
    subnets             = [aws_subnet.subnet1.id, aws_subnet.subne2.id, aws_subnet.subnet3.id]

    tags = {
        Environment = "blue-green"
    }
}

resource "aws_lb_listener" "http" {
    load_balancer_arm   = aws_lb.lb.arn
    port                = "80"
    protocol            = "HTTP"

    default_action {
        type            = "forward"
        target_group_arm = aws_lb_target_group.blue.arn
    }
}

resource "aws_lb_listener_rule" "switch_to_green" {
    listener_arm        = aws_lb_listener.http.arn
    priority            = 100

    condition {
        path_pattern {
            values = ["/*"]
        }
    }

    action {
        type                = "forward"
        target_group_arm    = aws_lb_target_group.green.arn
    }
}

