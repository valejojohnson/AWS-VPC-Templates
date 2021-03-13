resource "aws_dlm_lifecycle_policy" "instance_backup" {
  description = "72 Hour Backup Policy"

  tags = {
    Name = "72 Hour Retention"
  }

  policy_details {
    resource_types = ["INSTANCE"]

    schedule {
      name = "72 Hour Retention"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
      }

      retain_rule {
        count = 4
      }
    }

    target_tags = {
      Environment = "Dev"
    }
  }

  execution_role_arn = var.era
}