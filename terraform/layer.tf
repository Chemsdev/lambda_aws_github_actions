provider "aws" {
  region = "eu-west-1" # à adapter
}

resource "aws_lambda_layer_version" "python_dependencies" {
  filename          = "${path.module}/layer.zip"
  layer_name        = "my-python-layer"
  compatible_runtimes = ["python3.9"]

  source_code_hash = filebase64sha256("${path.module}/layer.zip")
}