remote_state {
  backend = "s3"
  generate = {
    path = "state.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    profile = "terraform"
    role_arn = "arn:aws:iam::891376973713:role/terraform"

    bucket = "terraform-automated-kubernetes-deployment-orchestrator"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock-table"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
      region = "us-east-1"
      profile = "terraform"

      assume_role {
        session_name = "learn-terraform-aws-s3-backend"
        role_arn = "arn:aws:iam::891376973713:role/terraform"
      }
    }
  EOF
}