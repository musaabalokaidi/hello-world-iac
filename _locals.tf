locals {
  vars = merge(
    jsondecode(file("config/${var.env}.json"))
  )
}
