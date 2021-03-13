
resource "aws_codepipeline" "pms-core-dev" {
  name     = "PMS-CORE-DEV"
  role_arn = "arn:aws:iam::561688265541:role/service-role/AWSCodePipelineServiceRole-us-east-1-PMS-API-Dev"
  tags     = {}

  artifact_store {
    location = "codepipeline-us-east-1-318350228067"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "dev"
        "Owner"                = "3pea"
        "PollForSourceChanges" = "true"
        "Repo"                 = "paysign-pms-core-module"
      }

      input_artifacts = []
      name            = "Source"

      output_artifacts = ["SourceArtifact", ]

      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "ApplicationName"     = "PMS-API-Dev"
        "DeploymentGroupName" = "PMS-CORE"
      }
      input_artifacts = [
      "SourceArtifact", ]

      name      = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      run_order = 1
      version   = "1"
    }
  }
}

resource "aws_codepipeline" "pms-mca-dev" {
  name     = "PMS-MCA-DEV"
  role_arn = "arn:aws:iam::561688265541:role/service-role/AWSCodePipelineServiceRole-us-east-1-PMS-API-Dev"
  tags     = {}

  artifact_store {
    location = "codepipeline-us-east-1-318350228067"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "dev"
        "Owner"                = "3pea"
        "PollForSourceChanges" = "true"
        "Repo"                 = "paysign-pms-mca-module"
      }

      input_artifacts = []
      name            = "Source"

      output_artifacts = ["SourceArtifact", ]

      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "ApplicationName"     = "PMS-API-Dev"
        "DeploymentGroupName" = "PMS-MCA"
      }
      input_artifacts = [
      "SourceArtifact", ]

      name      = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      run_order = 1
      version   = "1"
    }
  }
}

resource "aws_codepipeline" "pms-referral-dev" {
  name     = "PMS-REFFERAL-DEV"
  role_arn = "arn:aws:iam::561688265541:role/service-role/AWSCodePipelineServiceRole-us-east-1-PMS-API-Dev"
  tags     = {}

  artifact_store {
    location = "codepipeline-us-east-1-318350228067"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "dev"
        "Owner"                = "3pea"
        "PollForSourceChanges" = "true"
        "Repo"                 = "paysign-pms-referral-module"
      }

      input_artifacts = []
      name            = "Source"

      output_artifacts = ["SourceArtifact", ]

      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "ApplicationName"     = "PMS-API-Dev"
        "DeploymentGroupName" = "PMS-REFERRAL"
      }
      input_artifacts = [
      "SourceArtifact", ]

      name      = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      run_order = 1
      version   = "1"
    }
  }
}

resource "aws_codepipeline" "pms-idms-dev" {
  name     = "PMS-IDMS-Dev"
  role_arn = "arn:aws:iam::561688265541:role/service-role/AWSCodePipelineServiceRole-us-east-1-PMS-API-Dev"
  tags     = {}

  artifact_store {
    location = "codepipeline-us-east-1-318350228067"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "dev"
        "Owner"                = "3pea"
        "PollForSourceChanges" = "true"
        "Repo"                 = "paysign-pms-idms-module"
      }

      input_artifacts = []
      name            = "Source"

      output_artifacts = ["SourceArtifact", ]

      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "ApplicationName"     = "PMS-API-Dev"
        "DeploymentGroupName" = "PMS-IDMS-Dev"
      }
      input_artifacts = [
      "SourceArtifact", ]

      name      = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      run_order = 1
      version   = "1"
    }
  }
}

resource "aws_codepipeline" "pms-api-dev" {
  name     = "PMS-API-Dev"
  role_arn = "arn:aws:iam::561688265541:role/service-role/AWSCodePipelineServiceRole-us-east-1-PMS-API-Dev"
  tags     = {}

  artifact_store {
    location = "codepipeline-us-east-1-318350228067"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "Branch"               = "dev"
        "Owner"                = "3pea"
        "PollForSourceChanges" = "true"
        "Repo"                 = "paysign-pms-api"
      }

      input_artifacts = []
      name            = "Source"

      output_artifacts = ["SourceArtifact", ]

      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "ApplicationName"     = "PMS-API-Dev"
        "DeploymentGroupName" = "PMS-API-Dev"
      }
      input_artifacts = [
      "SourceArtifact", ]

      name      = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      run_order = 1
      version   = "1"
    }
  }
}