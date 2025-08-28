# terraform {
  
#   backend "s3" {
#     bucket = "bia-terraform-tf"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     profile = "bia"
    
#   }
# }

terraform {
  
  backend "local" {
    
  }
}