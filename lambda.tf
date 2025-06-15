provider "aws" {
  region = "eu-north-1"
}

# 1. Crée un fichier ZIP à partir de TOUS les fichiers dans lambda_function/
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_function"
  output_path = "${path.module}/lambda_function.zip"
}

# 2. Crée la fonction Lambda avec ce ZIP complet
resource "aws_lambda_function" "my_lambda" {
  function_name = "lambda_with_actions"
  handler       = "app.lambda_handler"  
  runtime       = "python3.12"
  role          = "arn:aws:iam::115083608235:role/lambda-s3-role"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
