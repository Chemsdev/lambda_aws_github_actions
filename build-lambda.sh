#!/bin/bash

set -e

echo "📦 Création du dossier temporaire..."
mkdir -p package

echo "📁 Copie du code Python uniquement (sans dépendances)..."
cp lambda_function/*.py package/

echo "📦 Compression dans terraform/function.zip..."
cd package
zip -r ../terraform/function.zip .
cd ..

echo "🧹 Nettoyage..."
rm -rf package

echo "✅ Code Lambda packagé avec succès (sans dépendances, car layer utilisé)"




# lancement : 
# ---> chmod +x build-lambda.sh
# ---> ./build-lambda.sh