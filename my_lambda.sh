#!/bin/bash

set -e  # Arrête le script si une erreur se produit

echo "📦 Création du dossier temporaire..."
mkdir -p package

echo "📥 Installation des dépendances..."
pip install -r lambda_function/requirements.txt -t package/

echo "📁 Copie des fichiers Python..."
cp lambda_function/*.py package/

echo "📦 Compression dans terraform/function.zip..."
cd package
zip -r ../terraform/function.zip .
cd ..

echo "🧹 Nettoyage du dossier temporaire..."
rm -rf package

echo "✅ Lambda packagée avec succès dans terraform/function.zip"



# lancement : chmod +x build-lambda.sh