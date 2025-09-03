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

output "rds_secrets"{

    description ="Secrets Associado ao RDS"
    value=tolist(aws_db_instance.bia-db.master_user_secret)[0].secret_arn
}

output "bia_repo_url" {
    description = "URL do repositório ECR"
    value = aws_ecr_repository.bia.repository_url
}


output "rds_secret_name"{
    description = "Nome do segredo" 
    value = data.aws_secretsmanager_secret.bia_db.name
}

output "alb_url"{
    value = aws_lb.bia.dns_name
}