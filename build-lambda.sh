#!/bin/bash
set -e

mkdir -p package
cp lambda_function/*.py package/
cd package && zip -r ../terraform/function.zip .
cd ..
rm -rf package



# lancement : 
# chmod +x build-lambda.sh
# ./build-lambda.sh