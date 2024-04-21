terraform {
  // source = "git::git@github.com:zeus2611/terraform-modules.git//eks?ref=eks-v0.0.1"
  source = "../../modules/eks"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path =  find_in_parent_folders("env.hcl")
  expose = true
  merge_strategy = "no_merge"
}

inputs = {
  eks_version = "1.28"
  env = include.env.locals.env
  eks_name = "demo"
  subnet_ids = dependency.vpc.outputs.private_subnet_ids

  node_groups = {
    general = {
      capacity_type = "ON_DEMAND"
      instance_types = ["t2.micro"]
      scaling_config = {
        desired_size = 2
        max_size = 4
        min_size = 0
      }
    }
  }
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    private_subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}