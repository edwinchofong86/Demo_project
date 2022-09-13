provider "aws" {
  region = "us-west-1"

  assume_role {
    role_arn = "arn:aws:iam::835367859851:role/-demo"
  }

  alias = "production"
}

data "aws_caller_identity" "iam" {}

data "aws_caller_identity" "production" {
  provider = aws.production
}

############
# IAM users
############
module "iam_user1" {
  source = "../../modules/iam-user"

  name = "user1"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
}

module "iam_user2" {
  source = "../../modules/iam-user"

  name = "user2"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
}
  module "iam_group_with_assumable_roles_policy_production_readonly" {
  source = "../../modules/iam-group-with-assumable-roles-policy"

  name = "production-readonly"

  assumable_roles = [module.iam_assumable_roles_in_prod.readonly_iam_role_arn]

  group_users = [
    module.iam_user1.iam_user_name,
    module.iam_user2.iam_user_name,
  ]
}
