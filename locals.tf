# Standard Company Tags

locals {
  tags = {
    env          = "dev"
    creator      = "dijah"
    created_with = "terraform"
    team         = "infrastructure"
  }
  s3_bucket_name = "startup-inc-${random_string.random.result}"
}
