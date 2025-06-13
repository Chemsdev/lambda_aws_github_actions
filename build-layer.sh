#!/bin/bash
set -e

echo "🔄 Nettoyage..."
rm -rf python terraform/layer.zip

echo "📦 Installation des dépendances..."
mkdir -p python
pip install -r lambda_function/requirements.txt -t python/

echo "📁 Zippage en layer.zip..."
cd python
zip -r ../terraform/layer.zip .
cd ..

rm -rf python

echo "✅ Layer prêt : terraform/layer.zip"

# lancement : 
# ---> chmod +x build-layer.sh
# ---> ./build-layer.sh
