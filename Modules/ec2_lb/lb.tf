#---------------------------------------------------- ALB's ----------------------------------------------------#

resource "aws_lb" "copaydev" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "copaydev"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]

  tags = {
    Environment = "Dev"
    Name        = "copaydev_lb"
    Project     = "Copay"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "chportal-midtier-dev" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "chportal-midtier-dev"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Dev"
    Name        = "lb-chportal-midtier-dev"
    Project     = "Cardholder_portal"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "copaytest" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "copaytest"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Test"
    Name        = "copaytest_lb"
    Project     = "Copay"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "copaytest-api-no-whitelist" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "copaytest-api-no-whitelist"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Test"
    Name        = "copayapi-test-lb"
    Project     = "Copay"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "csg-api-dev" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "csg-api-dev"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Dev"
    Name        = "csg-api-dev-lb"
    Project     = "Internal_portal"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "gateway-api-dev" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = true
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "gateway-api-dev"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-07b0d2fef526ebdcb",
    "subnet-0bd608d93e21e726e",
  ]
  tags = {
    Name    = "gateway-api-dev-lb"
    Project = "Partner_portal"
  }

  subnet_mapping {
    subnet_id = "subnet-07b0d2fef526ebdcb"
  }
  subnet_mapping {
    subnet_id = "subnet-0bd608d93e21e726e"
  }

  timeouts {}
}

resource "aws_lb" "Jenkins-CI" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = "dualstack"
  load_balancer_type         = var.lb_type
  name                       = "Jenkins-CI"
  security_groups = [
    "sg-0637547ceebd41578",
    "sg-0c2836557cd587c67",
    "sg-0f811eacdfd1a19fd",
    "sg-0f96ac0f309be1e8f",
  ]
  subnets = [
    "subnet-04bab27fb310a3769",
    "subnet-0abcd412876a122ed",
  ]
  tags = {
    Environment = "Sandbox"
    Name        = "Jenkins-CI-lb"
    Project     = "BM"
  }

  subnet_mapping {
    subnet_id = "subnet-04bab27fb310a3769"
  }
  subnet_mapping {
    subnet_id = "subnet-0abcd412876a122ed"
  }

  timeouts {}
}

resource "aws_lb" "pms-api-dev" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "pms-api-dev"
  security_groups = [
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Dev"
    Name        = "pms-api-dev-lb"
    Project     = "Partner_portal"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

resource "aws_lb" "pms-api-test" {
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  ip_address_type            = var.address_type
  load_balancer_type         = var.lb_type
  name                       = "pms-api-test"
  security_groups = [
    "sg-00a773bd0f83e0cf2",
    "sg-0108d64c93cb64b28",
    "sg-039eb3fbb6927fa8d",
    "sg-059c5cefbdf6ae0be",
    "sg-08e06f7e98562ff5d",
  ]
  subnets = [
    "subnet-03b65aee9bd6cffba",
    "subnet-0f80d9fc10cf65a00",
  ]
  tags = {
    Environment = "Dev"
    Name        = "pms-api-test"
    Project     = "Partner_portal"
  }

  subnet_mapping {
    subnet_id = "subnet-03b65aee9bd6cffba"
  }
  subnet_mapping {
    subnet_id = "subnet-0f80d9fc10cf65a00"
  }

  timeouts {}
}

#---------------------------------------------------- ALB Target Groups ----------------------------------------------------#

resource "aws_alb_target_group" "gateway-api-test-tg" {
  deregistration_delay = 300
  name                 = "gateway-api-test-tg"
  port                 = 5100
  protocol             = "HTTP"
  slow_start           = 0

  tags = {
    "Name" = "gateway-api-test-tg"
  }

  target_type = "instance"
  vpc_id      = "vpc-0b11f17dcd02273c6"

  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  stickiness {
    cookie_duration = 86400
    enabled         = false
    type            = "lb_cookie"
  }
}

