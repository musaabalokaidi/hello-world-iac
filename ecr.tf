resource "aws_ecr_repository" "ecr_repo" {
  for_each             = try({ for registry in local.vars.ecr : registry => registry }, {})
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}