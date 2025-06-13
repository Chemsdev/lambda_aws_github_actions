provider "aws" {
  region = "eu-north-1"
}


resource "aws_lambda_function" "my_lambda" {
  function_name = "my-lambda-function"
  runtime       = "python3.9"
  handler       = "main.lambda_handler"

  filename         = "${path.module}/function.zip"
  source_code_hash = filebase64sha256("${path.module}/function.zip")

  role = "arn:aws:iam::115083608235:role/lambda-s3-role"  # ✅ Utilisation du rôle existant

  layers = [
    aws_lambda_layer_version.python_dependencies.arn
  ]

  timeout = 10
}
