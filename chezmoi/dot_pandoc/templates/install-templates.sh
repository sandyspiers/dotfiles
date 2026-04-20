#!/usr/bin/env bash
set -euo pipefail

echo "Downloading Eisvogel template..."
gh release download --repo Wandmalfarbe/pandoc-latex-template --pattern "Eisvogel.tar.gz"

echo "Extracting Eisvogel template..."
tar -xzf Eisvogel.tar.gz

echo "Moving templates here..."
mv Eisvogel*/eisvogel.latex .
mv Eisvogel*/eisvogel.beamer .

echo "Removing Eisvogel resources..."
rm -f ./*.tar.gz
rm -rf Eisvogel*/
