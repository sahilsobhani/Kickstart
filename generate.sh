#!/bin/bash

# Prompt user for inputs
read -p "Enter project folder name: " PROJECT_ROOT
read -p "Enter project description: " DESCRIPTION
read -p "Enter author name: " AUTHOR
read -p "Include Jupyter notebook? (y/n): " INCLUDE_NOTEBOOK
read -p "Include PyTorch in requirements.txt? (y/n): " INCLUDE_TORCH
read -p "Initialize Git repository? (y/n): " INIT_GIT
read -p "Install dependencies in a virtual environment? (y/n): " INSTALL_DEPS

# Create directory structure
mkdir -p "$PROJECT_ROOT/Data/train" "$PROJECT_ROOT/Data/test" "$PROJECT_ROOT/Data/validation"

# Create Python files with boilerplate content
cat <<EOL > "$PROJECT_ROOT/main.py"
# main.py
\"\"\"
$DESCRIPTION
Author: $AUTHOR
\"\"\"

from model import Model
from train import train_model
from test import test_model

if __name__ == "__main__":
    print("Starting ML pipeline...")
    train_model()
    test_model()
EOL

cat <<EOL > "$PROJECT_ROOT/model.py"
# model.py
class Model:
    def __init__(self):
        print("Model initialized")

    def train(self, data):
        print("Training on data")

    def evaluate(self, data):
        print("Evaluating model")
EOL

cat <<EOL > "$PROJECT_ROOT/utils.py"
# utils.py
def load_data(path):
    print(f"Loading data from {path}")
    return []
EOL

cat <<EOL > "$PROJECT_ROOT/train.py"
# train.py
from model import Model
from utils import load_data

def train_model():
    data = load_data("Data/train")
    model = Model()
    model.train(data)
EOL

cat <<EOL > "$PROJECT_ROOT/test.py"
# test.py
from model import Model
from utils import load_data

def test_model():
    data = load_data("Data/test")
    model = Model()
    model.evaluate(data)
EOL

# Optional Jupyter notebook
if [[ "$INCLUDE_NOTEBOOK" == "y" || "$INCLUDE_NOTEBOOK" == "Y" ]]; then
  cat <<EOL > "$PROJECT_ROOT/test_notebook.ipynb"
{
 "cells": [],
 "metadata": {
  "title": "$PROJECT_ROOT Notebook",
  "author": "$AUTHOR"
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
EOL
fi

# Create requirements.txt
cat <<EOL > "$PROJECT_ROOT/requirements.txt"
numpy
pandas
scikit-learn
matplotlib
EOL

if [[ "$INCLUDE_TORCH" == "y" || "$INCLUDE_TORCH" == "Y" ]]; then
  echo "torch" >> "$PROJECT_ROOT/requirements.txt"
fi

# Create README.md
cat <<EOL > "$PROJECT_ROOT/README.md"
# $PROJECT_ROOT

## Description
$DESCRIPTION

## Author
$AUTHOR

## How to Run
\`\`\`bash
python main.py
\`\`\`
EOL

# Git initialization
if [[ "$INIT_GIT" == "y" || "$INIT_GIT" == "Y" ]]; then
  cd "$PROJECT_ROOT"
  git init > /dev/null
  git add .
  git commit -m "Initial project scaffold with boilerplate code" > /dev/null
  cd - > /dev/null
fi

# Virtual environment + install requirements
if [[ "$INSTALL_DEPS" == "y" || "$INSTALL_DEPS" == "Y" ]]; then
  echo "Setting up virtual environment and installing dependencies..."
  cd "$PROJECT_ROOT"
  python3 -m venv venv
  source venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  deactivate
  cd - > /dev/null
  echo "Dependencies installed in $PROJECT_ROOT/venv/"
fi

echo ""
echo "ML project '$PROJECT_ROOT' created successfully!"
