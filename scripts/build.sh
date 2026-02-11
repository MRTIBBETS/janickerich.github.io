#!/bin/bash
npx html-minifier \
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
