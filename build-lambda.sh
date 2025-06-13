#!/bin/bash
set -e

echo "📦 Préparation du code Lambda sans dépendances..."

mkdir -p package
cp lambda_function/*.py package/

echo "🗜️  Création de terraform/function.zip..."
cd package && zip -r ../terraform/function.zip .
cd ..

rm -rf package
echo "✅ function.zip généré sans dépendances"

# lancement : 
# chmod +x build-lambda.sh
# ./build-lambda.sh