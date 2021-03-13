resource "aws_codepipeline" "win2019" {
  name     = "Windows-Server-2019-CSO"
  role_arn = "arn:aws:iam::834117163092:role/service-role/Master-Pipeline-Role"
  artifact_store {
    location = "codepipeline-us-west-2-333653935187"
    type     = "S3"
  }
  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "BranchName"           = "master"
        "PollForSourceChanges" = "true"
        "RepositoryName"       = "GOLDEN-Windows-2019-CSO"
      }
      input_artifacts = []
      name            = "Source"
      namespace       = "SourceVariables"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeCommit"
      region    = "us-west-2"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "ProjectName" = "GOLDEN-Windows-2019-CSO"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name      = "Build"
      namespace = "BuildVariables"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      region    = "us-west-2"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "To-S3"
    action {
      category = "Deploy"
      configuration = {
        "BucketName" = "ets-wb-tools"
        "Extract"    = "false"
        "ObjectKey"  = "WM-CSO-GPO-2019-EC2.zip"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name             = "To-S3"
      output_artifacts = []
      owner            = "AWS"
      provider         = "S3"
      region           = "us-west-2"
      run_order        = 1
      version          = "1"
    }
  }
  stage {
    name = "AMI-Build"
    action {
      category = "Invoke"
      configuration = {
        "FunctionName" = "Windows_2019_CSO_AMI_Build"
      }
      input_artifacts  = []
      name             = "Lambda_Run"
      output_artifacts = []
      owner            = "AWS"
      provider         = "Lambda"
      region           = "us-west-2"
      run_order        = 1
      version          = "1"
    }
  }
}

resource "aws_codepipeline" "win2016" {
  name     = "Windows-Server-2016-CSO"
  role_arn = "arn:aws:iam::834117163092:role/service-role/Master-Pipeline-Role"
  artifact_store {
    location = "codepipeline-us-west-2-333653935187"
    type     = "S3"
  }
  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "BranchName"           = "master"
        "PollForSourceChanges" = "true"
        "RepositoryName"       = "GOLDEN-Windows-2016-CSO"
      }
      input_artifacts = []
      name            = "Source"
      namespace       = "SourceVariables"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeCommit"
      region    = "us-west-2"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "ProjectName" = "GOLDEN-Windows-2016-CSO"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name      = "Build"
      namespace = "BuildVariables"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      region    = "us-west-2"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "To-S3"
    action {
      category = "Deploy"
      configuration = {
        "BucketName" = "ets-wb-tools"
        "Extract"    = "false"
        "ObjectKey"  = "WM-CSO-GPO-2016-EC2.zip"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name             = "To-S3"
      output_artifacts = []
      owner            = "AWS"
      provider         = "S3"
      region           = "us-west-2"
      run_order        = 1
      version          = "1"
    }
  }
  stage {
    name = "AMI-Build"
    action {
      category = "Invoke"
      configuration = {
        "FunctionName" = "Windows_2016_CSO_AMI_Build"
      }
      input_artifacts  = []
      name             = "Lambda_Run"
      output_artifacts = []
      owner            = "AWS"
      provider         = "Lambda"
      region           = "us-west-2"
      run_order        = 1
      version          = "1"
    }
  }
}