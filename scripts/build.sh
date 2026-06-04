#!/bin/bash
set -euo pipefail

# Update sitemap lastmod date to current build date
CURRENT_DATE=$(date +%Y-%m-%d)
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|<lastmod>[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}</lastmod>|<lastmod>${CURRENT_DATE}</lastmod>|g" sitemap.xml
else
  sed -i "s|<lastmod>[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}</lastmod>|<lastmod>${CURRENT_DATE}</lastmod>|g" sitemap.xml
fi

# Run HTML Minification with html-minifier-terser
npx --no-install html-minifier-terser \
  --collapse-whitespace \
  --remove-comments \
  --remove-optional-tags \
  --remove-redundant-attributes \
  --remove-script-type-attributes \
  --remove-tag-whitespace \
  --minify-css true \
  --minify-js true \
  -o index.html \
  src/index.html
