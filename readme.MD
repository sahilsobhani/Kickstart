# ML Project Scaffold Generator

A simple and interactive Bash script to generate a clean boilerplate for machine learning projects. Ideal for rapid prototyping and organized development.

---

## Features

- Creates a full project structure:
  - Organized `Data/` folders (`train`, `test`, `validation`)
  - Boilerplate code: `main.py`, `model.py`, `train.py`, `test.py`, `utils.py`
- Auto-generates:
  - `requirements.txt` with optional PyTorch
  - `README.md` with your project info
  - Optional Jupyter notebook
- Initializes a Git repository (optional)
- Installs dependencies in a virtual environment (optional)

---

## Usage

### 1. Clone the repo and make the script executable:
```bash
git clone https://github.com/yourusername/ml-project-generator.git
cd ml-project-generator
chmod +x generate_ml_project.sh
```

### 2. Run the script:
```bash
./generate_ml_project.sh
```

Follow the prompts to:
- Set project name, author, and description
- Choose whether to include a Jupyter notebook and PyTorch
- Optionally initialize Git and install dependencies

---

## Example Output

```
my_ml_project/
├── Data/
│   ├── train/
│   ├── test/
│   └── validation/
├── main.py
├── model.py
├── train.py
├── test.py
├── utils.py
├── requirements.txt
├── README.md
└── test_notebook.ipynb  # (optional)
```

---

## Requirements

- Unix/Linux/macOS shell
- Python 3.6+
- `bash`, `git`, and `virtualenv`/`venv` available

---

## License

MIT License

---

## Author

Created by [Sahil Sobhani](https://github.com/sahilsobhani)
