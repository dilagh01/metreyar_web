#!/bin/bash

echo "📦 Building Flutter Web..."
flutter build web

if [ $? -ne 0 ]; then
  echo "❌ Build failed!"
  exit 1
fi

echo "📁 Copying build to web_dist/..."
rm -rf web_dist/*
cp -r build/web/* web_dist/

echo "📤 Committing changes to Git..."
git add web_dist
git commit -m "🔄 Update Flutter Web build at $(date)"
git push origin main

echo "✅ Done!"
