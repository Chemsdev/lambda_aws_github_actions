# Rôle IAM Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attache la politique de base (logs)
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Fonction Lambda
resource "aws_lambda_function" "my_lambda" {
  function_name = "my-lambda-function"
  role          = aws_iam_role.lambda_exec_role.arn
  runtime       = "python3.9"
  handler       = "main.lambda_handler" # dans main.py

  filename          = "${path.module}/function.zip"
  source_code_hash  = filebase64sha256("${path.module}/function.zip")

  layers = [
    aws_lambda_layer_version.python_dependencies.arn
  ]

  timeout = 10
}