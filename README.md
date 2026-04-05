# 🎓 Ulster University — Academic Repository

> A structured workspace for managing academic coursework, software development projects, and collaborative resources across Ulster University modules.

---

## 📖 Overview

This repository serves as a centralized version-controlled workspace for academic and software development project materials related to Ulster University modules. It supports organized storage, collaboration, and documentation across multiple disciplines including software engineering, data science, database management, and web development.

---

## 📁 Repository Structure
```
Ulster-University/
│
├── COM435 Software Product and Process Management/   # Module: Software engineering & project management
│
├── Data Base/                                        # Database design, queries, and T-SQL scripts
│
├── Python/
│   └── komal/                                        # Python programming exercises and scripts
│
├── coffe-shop-webpage/                               # Submodule: Coffee shop web project
│
├── web/                                              # Web development resources (HTML, CSS, JS)
│
├── .gitmodules                                       # Git submodule configuration
└── test.txt                                          # Miscellaneous test file
```

---

## 📚 Modules & Content

### 🛠️ COM435 — Software Product and Process Management
Resources, assignments, and documentation related to software product lifecycle, agile methodologies, and process management practices covered in this module.

### 🗄️ Database
SQL scripts, schema designs, and database exercises using **T-SQL**. Covers relational database concepts, queries, stored procedures, and data management techniques.

### 🐍 Python
Python scripts and Jupyter Notebooks covering programming fundamentals, data analysis, and applied exercises. Notebooks are structured for academic learning and exploration.

### 🌐 Web Development
Frontend web development resources built with **HTML**, **CSS**, and **JavaScript**. Includes structured web pages and interface components created as part of coursework.

### ☕ Coffee Shop Webpage *(Git Submodule)*
A standalone web project — a coffee shop website — maintained as a Git submodule. Demonstrates full-page web design using HTML, CSS, and JavaScript.

---

## 🧰 Technologies Used

| Category        | Technologies                              |
|-----------------|-------------------------------------------|
| Languages       | Python, T-SQL, HTML, CSS, JavaScript      |
| Notebooks       | Jupyter Notebook                          |
| Documents       | LaTeX (TeX)                               |
| Version Control | Git, GitHub                               |

---

## 📊 Language Breakdown

| Language         | Usage  |
|------------------|--------|
| Python           | 29.6%  |
| TeX (LaTeX)      | 20.3%  |
| Jupyter Notebook | 17.1%  |
| HTML             | 12.2%  |
| T-SQL            | 10.6%  |
| CSS              | 6.4%   |
| JavaScript       | 3.8%   |

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the following installed:
- [Python 3.x](https://www.python.org/downloads/)
- [Jupyter Notebook](https://jupyter.org/install) or [JupyterLab](https://jupyterlab.readthedocs.io/)
- A SQL Server environment (for T-SQL scripts, e.g., [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads))
- A modern web browser (for HTML/CSS/JS projects)

### Clone the Repository
```bash
# Clone the repo along with submodules
git clone --recurse-submodules https://github.com/rukonuzzamantopu/Ulster-University.git
cd Ulster-University
```

If you've already cloned without `--recurse-submodules`, initialize submodules with:
```bash
git submodule update --init --recursive
```

### Running Python / Jupyter Notebooks
```bash
# Navigate to the Python folder
cd Python/komal

# Launch Jupyter Notebook
jupyter notebook
```

### Running Web Projects

Open any `.html` file directly in your browser, or use a local development server:
```bash
# Using Python's built-in HTTP server
cd web
python -m http.server 8000
# Then open http://localhost:8000 in your browser
```

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome. To contribute:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m "Add: description of changes"`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

Please ensure your code is well-documented and follows the existing structure of the repository.

---

## 📄 License

This repository is intended for **academic and educational purposes** at Ulster University. All content is subject to the university's academic integrity policies. Please do not submit any part of this work as your own without proper attribution.

---

## 👤 Author

**Rukonuzzaman Topu**
- GitHub: [@rukonuzzamantopu](https://github.com/rukonuzzamantopu)
- University: [Ulster University](https://www.ulster.ac.uk/)

---

> *"Knowledge shared is knowledge multiplied."*
