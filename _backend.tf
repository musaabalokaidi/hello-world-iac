terraform {
  backend "s3" {
    bucket = "hello-world-tf-state-nonprod"
    key    = "hello-world-iac"
    region = "eu-west-2"
  }
}
