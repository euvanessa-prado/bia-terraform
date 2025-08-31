output "instance_id" {
description = "ID da EC2"
value = aws_instance.bia-terraform.id
}

output "instance_type" {
description = "Tipo da EC2"
value = aws_instance.bia-terraform.instance_type
}


output "instance_security_groups" {
description = "SG da EC2"
value = aws_instance.bia-terraform.security_groups
}

output "instance_public_ip" {
description = "IP publico da EC2"
value = aws_instance.bia-terraform.public_ip
}


output "rds_endpoint" {
description = "Endpoint do RDS da BIA"
value = aws_db_instance.bia-db.endpoint
}