resource "aws_amplify_app" "frontend" {
  name                     = "amplify-vite"
  repository               = "https://github.com/epomatti/aws-amplify-axios-vite"
  access_token             = var.access_token
  enable_branch_auto_build = true
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "main"
  framework   = "Vue"
  stage       = "PRODUCTION"

  environment_variables = {
    VITE_API_BASE_URL = "https://dummyjson.com"
  }
}

resource "aws_amplify_webhook" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = aws_amplify_branch.main.branch_name
}
