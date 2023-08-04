provider "aws" {
  region = local.vars.aws_region
  default_tags {
    tags = {
      environment = "${local.vars.env}"
      repo        = "musaabalokaidi/hellow-world-iac"
    }
  }
}