# Ulster University — Academic Project Repository


**A structured, version-controlled academic workspace for Ulster University coursework, software development modules, and collaborative project materials.**

[Overview](#-overview) · [Structure](#-repository-structure) · [Modules](#-modules) · [Technologies](#-technologies) · [Setup](#-getting-started) · [Contributing](#-contributing)

</div>

---

## 📌 Overview

This repository serves as a centralised, version-controlled hub for all academic work undertaken at **Ulster University**. It covers multiple computing modules spanning software engineering, database management, Python programming, and web development.

The repository is structured to ensure clear separation between modules while allowing shared tools and references to remain accessible. It supports:

- ✅ Organised, module-specific storage of coursework, reports, scripts, and documentation
- ✅ Full version history of all project iterations via Git
- ✅ Collaborative workflows for group assignments and paired programming
- ✅ A reference base for future academic and professional projects

> **Institution:** Ulster University, Northern Ireland, UK  
> **Repository Owner:** [rukonuzzamantopu](https://github.com/rukonuzzamantopu)  
> **Language Breakdown:** Python (29.6%) · TeX (20.3%) · Jupyter Notebook (17.1%) · HTML (12.2%) · T-SQL (10.6%) · CSS (6.4%) · JavaScript (3.8%)

---

## 🗂️ Repository Structure

```
Ulster-University/
│
├── 📁 COM435 Software Product and Process Management/
│   ├── Reports and documentation (LaTeX / PDF)
│   ├── Process management artefacts (plans, diagrams, reviews)
│   └── Assignment submissions and coursework materials
│
├── 📁 Data Base/
│   ├── SQL and T-SQL scripts (queries, stored procedures)
│   ├── Database schema designs and ER diagrams
│   └── Assignment-related database files
│
├── 📁 Python/
│   └── komal/
│       ├── Python scripts (.py)
│       └── Jupyter Notebooks (.ipynb)
│
├── 📁 web/
│   ├── HTML pages
│   ├── CSS stylesheets
│   └── JavaScript files
│
├── 📦 coffe-shop-webpage/          ← Git Submodule
│   └── (links to: rukonuzzamantopu/coffe-shop-webpage)
│       A standalone responsive coffee shop website project
│
├── .gitmodules                     ← Submodule configuration
└── test.txt
```

> **Note:** The `coffe-shop-webpage` directory is a **Git submodule** — a separate linked repository. Use `--recurse-submodules` when cloning to include it (see [Getting Started](#-getting-started)).

---

## 📘 Modules

### COM435 — Software Product and Process Management

| Item | Detail |
|---|---|
| **Module Code** | COM435 |
| **Module Name** | Software Product and Process Management |
| **Level** | Postgraduate / Undergraduate (Level 7/6) |
| **Key Topics** | Software Development Life Cycle (SDLC), Agile & Scrum methodologies, project planning, risk management, quality assurance, process documentation, team collaboration |
| **Artefacts** | Reports, plans, process models, reviews |
| **Format** | LaTeX (TeX) for academic reports; PDF outputs |

---

### Database Management

| Item | Detail |
|---|---|
| **Focus Area** | Relational Database Design & SQL Development |
| **Key Topics** | Entity-Relationship (ER) modelling, schema normalisation, T-SQL queries, stored procedures, data manipulation and retrieval |
| **Tools Used** | Microsoft SQL Server / T-SQL |
| **Artefacts** | SQL scripts, schema designs, ER diagrams, query assignments |

---

### Python Programming

| Item | Detail |
|---|---|
| **Focus Area** | Python scripting and data exploration |
| **Key Topics** | Core Python programming, data structures, file handling, data analysis with Jupyter Notebooks |
| **Tools Used** | Python 3.x, Jupyter Notebook |
| **Artefacts** | `.py` scripts, `.ipynb` notebooks |

---

### Web Development

| Item | Detail |
|---|---|
| **Focus Area** | Frontend Web Development |
| **Key Topics** | HTML5 structure, CSS3 styling and layouts, JavaScript interactivity, responsive design |
| **Tools Used** | HTML, CSS, JavaScript |
| **Artefacts** | Web pages, UI components, the coffee shop project (submodule) |

---

## 🛠️ Technologies

| Category | Technology / Tool | Version / Notes |
|---|---|---|
| Programming Language | Python | 3.x |
| Data Exploration | Jupyter Notebook | via Anaconda or pip |
| Database | Microsoft SQL Server / T-SQL | SSMS recommended |
| Web — Markup | HTML5 | Semantic structure |
| Web — Styling | CSS3 | Responsive design |
| Web — Scripting | JavaScript | Vanilla JS |
| Academic Writing | LaTeX (TeX) | Overleaf or local TeX Live |
| Version Control | Git | 2.x |
| Hosting | GitHub | github.com |

---

## 🚀 Getting Started

### Prerequisites

Ensure the following are installed on your machine before cloning:

| Tool | Download |
|---|---|
| Git | https://git-scm.com/downloads |
| Python 3.x | https://www.python.org/downloads/ |
| Jupyter Notebook | `pip install notebook` or [Anaconda](https://www.anaconda.com/) |
| SQL Server / SSMS | https://aka.ms/ssmsfullsetup |
| VS Code (recommended) | https://code.visualstudio.com/ |
| TeX Live (optional) | https://www.tug.org/texlive/ |

---

### 1. Clone the Repository

To clone the repository **including the submodule** (`coffe-shop-webpage`):

```bash
git clone --recurse-submodules https://github.com/rukonuzzamantopu/Ulster-University.git
```

If you have already cloned without the flag, initialise the submodule manually:

```bash
cd Ulster-University
git submodule update --init --recursive
```

---

### 2. Explore a Module

Navigate into any module folder directly:

```bash
# Example — Database module
cd "Data Base"

# Example — COM435 module
cd "COM435 Software Product and Process Management"
```

---

### 3. Run Python Scripts

```bash
cd Python/komal
python your_script_name.py
```

---

### 4. Launch Jupyter Notebooks

```bash
# Install if not already available
pip install notebook

# Start the Jupyter server
jupyter notebook
```

Then open the `.ipynb` file of your choice from the browser interface.

---

### 5. Run SQL Scripts

Open **SQL Server Management Studio (SSMS)** or **Azure Data Studio**, connect to your local SQL Server instance, and open any `.sql` file from the `Data Base/` folder to execute queries.

---

### 6. View the Web Project

Open any `.html` file from the `web/` or `coffe-shop-webpage/` folder directly in your browser:

```bash
# On macOS/Linux
open coffe-shop-webpage/index.html

# On Windows
start coffe-shop-webpage/index.html
```

Or use the **Live Server** extension in VS Code for hot-reload development.

---

## 📐 Academic & Coding Standards

All work in this repository aims to follow these standards:

| Domain | Standard |
|---|---|
| Python | [PEP 8](https://peps.python.org/pep-0008/) — consistent naming, spacing, docstrings |
| SQL | Capitalised keywords; meaningful table/column names; commented scripts |
| HTML/CSS | Semantic HTML5; BEM-style class naming where applicable |
| LaTeX | Structured documents with sections, references, and bibliography |
| Git | Descriptive commit messages; feature branches for new work |

---

## 🤝 Contributing

Contributions are welcome, especially from fellow Ulster University students.

```bash
# 1. Fork this repository on GitHub

# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/Ulster-University.git

# 3. Create a new feature branch
git checkout -b feature/your-feature-name

# 4. Make your changes and commit
git add .
git commit -m "feat: brief description of your change"

# 5. Push to your fork
git push origin feature/your-feature-name

# 6. Open a Pull Request on GitHub
```

### Commit Message Convention

This repository follows a simplified [Conventional Commits](https://www.conventionalcommits.org/) standard:

| Prefix | Use For |
|---|---|
| `feat:` | New file, script, or module content added |
| `fix:` | Bug fixes or corrections |
| `docs:` | README or documentation updates |
| `refactor:` | Code restructuring without changing functionality |
| `style:` | Formatting, spacing, naming changes only |
| `chore:` | Maintenance tasks, dependency updates |

---

## 📋 Changelog

| Version | Date | Description |
|---|---|---|
| v1.0 | Initial | Repository created with base structure |
| v1.x | Ongoing | Module content added across COM435, DB, Python, Web |

---

## ❓ FAQ

**Q: Can I reuse the code here in my own academic submission?**  
A: No. Reusing submitted academic work may violate Ulster University's Academic Integrity Policy. You may use this repo as a **reference or learning resource** only.

**Q: Why does cloning fail for the coffee shop submodule?**  
A: Run `git clone --recurse-submodules ...` instead of a plain `git clone`. See the [Getting Started](#-getting-started) section.

**Q: Which Python version is required?**  
A: Python **3.6 or higher** is recommended. Python 2 is not supported.

**Q: How do I run `.ipynb` notebooks without Jupyter?**  
A: You can view them directly on GitHub, or use [Google Colab](https://colab.research.google.com/) by uploading the file — no local install needed.

---

## 📄 License & Academic Integrity

> ⚠️ **Important Notice**

This repository is intended for **academic, educational, and portfolio purposes only**.

- All code and documents are the original work of the repository owner and collaborators.
- Do **not** copy, submit, or reuse any work here as your own for academic submissions — doing so may constitute **academic misconduct** under [Ulster University's Academic Integrity Policy](https://www.ulster.ac.uk/student/wellbeing/academic-integrity).
- You are welcome to **reference, study, or fork** this repository for personal learning.

---

## 📬 Contact

| Platform | Link |
|---|---|
| GitHub Profile | [@rukonuzzamantopu](https://github.com/rukonuzzamantopu) |
| Institution | [Ulster University](https://www.ulster.ac.uk) |
| Repository Issues | [Open an Issue](https://github.com/rukonuzzamantopu/Ulster-University/issues) |

---

<div align="center">

Made with dedication as part of the academic journey at **Ulster University**, Northern Ireland 🎓  

*Organised · Version-Controlled · Collaborative*

</div>
