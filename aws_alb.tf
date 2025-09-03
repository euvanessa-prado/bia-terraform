resource "aws_lb" "bia" {
    name = "bia-alb"
    load_balancer_type = "application"
    subnets = [local.subnet_zona_a, local.subnet_zona_b]
    security_groups = [aws_security_group.bia-alb.id]
}
resource "aws_lb_target_group" "tg-bia" {
    name_prefix = "bia-"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = local.vpc_id
    deregistration_delay = 30

    health_check {
        path = "/api/versao"
        enabled = true
        matcher = 200
        interval = 10
        healthy_threshold = 2
        unhealthy_threshold = 3
        timeout = 5
    }
}
resource "aws_lb_listener" "bia" {
    load_balancer_arn = aws_lb.bia.id
    protocol = "HTTP"
    port = 80

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg-bia.id
        }
    }

