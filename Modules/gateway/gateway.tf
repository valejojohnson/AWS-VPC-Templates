resource "aws_codedeploy_app" "gateway-test" {
  name = "Gateway-TEST"
}

resource "aws_codedeploy_deployment_group" "gateway-cms" {
  app_name = aws_codedeploy_app.gateway-test.name

  autoscaling_groups     = []
  deployment_config_name = "CodeDeployDefault.AllAtOnce"
  deployment_group_name  = "Gateway-CMS"
  service_role_arn       = "arn:aws:iam::561688265541:role/CodeDeploytoEC2s"

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE", ]
  }

  deployment_style {
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "GATEWAY_APISRV_TEST"
    }
  }
}

resource "aws_codedeploy_deployment_group" "gateway-cms-rxapi" {
  app_name = aws_codedeploy_app.gateway-test.name

  autoscaling_groups     = []
  deployment_config_name = "CodeDeployDefault.AllAtOnce"
  deployment_group_name  = "Gateway-CMS-RXAPI"
  service_role_arn       = "arn:aws:iam::561688265541:role/CodeDeploytoEC2s"

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE", ]
  }

  deployment_style {
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "GATEWAY_APISRV_TEST"
    }
  }
}

