# Cursor Onboarding Suite

A comprehensive suite of Cursor IDE commands designed to help developers quickly understand and document new codebases using AI-powered analysis.

## 🚀 Quick Start

**New to the suite?** Start here: **[QUICK_START.md](QUICK_START.md)**

The quick start guide will get you up and running in 3 simple steps.

## 📋 Overview

The Cursor Onboarding Suite provides a structured approach to understanding any codebase through automated analysis. It consists of:

- **3 Required Steps** - Foundation analysis that must be run in order
- **4 Analysis Steps** - Core analysis that can run in parallel
- **3 Optional Steps** - Advanced analysis for deeper insights

All steps are designed to run independently and can be parallelized across multiple chat sessions for faster completion.

## 📁 Repository Structure

```
cursor-onboarding-suite/
├── README.md                    # This file
├── QUICK_START.md              # Quick start guide
├── LICENSE                      # License file
│
├── commands/                    # All command files
│   ├── required/               # Required steps (must run in order)
│   │   ├── 01-initialize.md
│   │   ├── 02-analyze-core-and-endpoints.md
│   │   └── 03-analyze-endpoint-flows.md
│   │
│   ├── analysis/               # Core analysis (can run in parallel)
│   │   ├── 04-analyze-architecture.md
│   │   ├── 05-analyze-config-and-testing.md
│   │   ├── 06-analyze-integrations.md
│   │   └── 07-analyze-domain-and-performance.md
│   │
│   └── optional/               # Optional advanced analysis
│       ├── 08-generate-quick-reference.md
│       ├── 09-analyze-code-structure.md
│       └── 10-assess-production-readiness.md
│
├── scripts/                    # Installation scripts
│   ├── install-mac.sh
│   └── install-windows.ps1
│
└── docs/                       # Additional documentation
    ├── EXAMPLES.md
    └── TROUBLESHOOTING.md
```

## 🎯 Execution Flow

```
[Required Path]
01-initialize → 02-analyze-core-and-endpoints → 03-analyze-endpoint-flows
                ↓
        04-analyze-architecture (parallel)
        05-analyze-config-and-testing (parallel)
        06-analyze-integrations (parallel)
        07-analyze-domain-and-performance (parallel)
                ↓
[Optional Path]
08-generate-quick-reference → 09-analyze-code-structure → 10-assess-production-readiness
```

## 📦 Installation

### Mac/Linux

```bash
cd cursor-onboarding-suite
./scripts/install-mac.sh
```

### Windows

```powershell
cd cursor-onboarding-suite
.\scripts\install-windows.ps1
```

### Manual Installation

Copy all `.md` files from `commands/required/`, `commands/analysis/`, and `commands/optional/` to:
- **Mac/Linux**: `~/.cursor/commands/`
- **Windows**: `%USERPROFILE%\.cursor\commands\`

## 🎮 Usage

### Required Steps (Run in Order)

1. **`/01-initialize`** - Initialize onboarding structure and perform project mapping
   - **MUST be run first** before any other steps
   - Creates `.cursor/CURSOR-ONBOARDING.md` and `.cursor/PROJECT_MAP.txt`
   - Identifies tech stack and creates analysis checklists

2. **`/02-analyze-core-and-endpoints`** - Analyze core files & discover endpoints
   - Analyzes critical project files
   - Discovers and maps all API endpoints
   - Creates endpoint flow investigation checklist

3. **`/03-analyze-endpoint-flows`** - Analyze endpoint flows
   - Documents complete request/response flow for each endpoint
   - Creates individual endpoint documentation files
   - **Parallel-safe**: Can run multiple instances simultaneously

### Analysis Steps (Can Run in Parallel)

After step 02, run these **in parallel** in separate chat sessions:

4. **`/04-analyze-architecture`** - Architecture, Data Models & Security
   - Architectural patterns and design patterns
   - Data models and database schema
   - Authentication and authorization

5. **`/05-analyze-config-and-testing`** - Configuration & Testing
   - Configuration management and environment variables
   - Testing strategy and test structure

6. **`/06-analyze-integrations`** - Integrations & Error Handling
   - External API integrations
   - Error handling and logging

7. **`/07-analyze-domain-and-performance`** - Domain, API Contracts & Performance
   - Business domain and domain models
   - API contracts and validation
   - Performance optimization

### Optional Steps (Advanced)

8. **`/08-generate-quick-reference`** - Generate Quick Reference
   - Creates AI-optimized quick lookup index
   - Run after completing analysis steps

9. **`/09-analyze-code-structure`** - Analyze Code Structure
   - Code patterns, conventions, and anti-patterns
   - Component dependencies and relationships

10. **`/10-assess-production-readiness`** - Assess Production Readiness
    - Comprehensive production readiness evaluation
    - Security, monitoring, scalability assessment

## 📊 What Each Step Produces

### Required Steps Output

- **01-initialize**: `.cursor/CURSOR-ONBOARDING.md`, `.cursor/PROJECT_MAP.txt`
- **02-analyze-core-and-endpoints**: Updated `CURSOR-ONBOARDING.md` with file summaries and endpoint list
- **03-analyze-endpoint-flows**: Individual endpoint documentation files (`CURSOR_*.md`)

### Analysis Steps Output

- **04-analyze-architecture**: `.cursor/ARCHITECTURE.md`, `.cursor/DATA_MODELS.md`, `.cursor/SECURITY.md`
- **05-analyze-config-and-testing**: `.cursor/CONFIGURATION.md`, `.cursor/TESTING.md`
- **06-analyze-integrations**: `.cursor/INTEGRATIONS.md`, `.cursor/ERROR_HANDLING.md`
- **07-analyze-domain-and-performance**: `.cursor/DOMAIN.md`, `.cursor/API_CONTRACTS.md`, `.cursor/PERFORMANCE.md`

### Optional Steps Output

- **08-generate-quick-reference**: `.cursor/QUICK_REFERENCE.md`, `.cursor/REFERENCE_METADATA.json`
- **09-analyze-code-structure**: `.cursor/CODE_PATTERNS.md`, `.cursor/DEPENDENCY_GRAPH.md`, `.cursor/DEPENDENCY_METADATA.json`
- **10-assess-production-readiness**: `.cursor/PRODUCTION_READINESS.md`

## 💡 Best Practices

1. **Initialize first**: Always run `/01-initialize` first - all other steps require it
2. **Parallel execution**: Run steps 04-07 simultaneously in different chat sessions for faster completion
3. **Step 03**: Can be interrupted and resumed - it automatically recovers progress
4. **Clean context**: Start a new chat for each step to avoid context window issues
5. **Review progress**: Check `.cursor/CURSOR-ONBOARDING.md` to see what's been completed
6. **Skip optional steps**: Only run optional steps if you need that specific analysis

## 🔧 Troubleshooting

### Command not found
- Ensure files are installed in `~/.cursor/commands/` (Mac/Linux) or `%USERPROFILE%\.cursor\commands\` (Windows)
- Restart Cursor IDE after installation
- Check that filenames match exactly (including numbers and hyphens)

### Step fails with "file doesn't exist"
- Run `/01-initialize` first to create `CURSOR-ONBOARDING.md` and `PROJECT_MAP.txt`
- Ensure you're in the correct project directory

### Step 03 seems stuck
- Step 03 processes endpoints in a loop - this is normal
- It will continue until all endpoints are analyzed
- You can interrupt and resume - it will recover automatically
- Check `.cursor/CURSOR-ONBOARDING.md` to see progress

For more troubleshooting help, see [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

## 🤖 AI Agent Optimization

This suite is specifically optimized for Cursor AI agents with:

- **Structured Metadata**: JSON metadata files for programmatic access
- **AI-friendly Tags**: Semantic tags in documentation for better search
- **Parallel Execution**: Safe parallel execution with atomic task claiming
- **Recovery Mechanisms**: Automatic recovery from interrupted sessions
- **Quick Reference**: AI-optimized lookup indexes

## 📚 Additional Documentation

- **[QUICK_START.md](QUICK_START.md)** - Get started quickly
- **[docs/EXAMPLES.md](docs/EXAMPLES.md)** - Example outputs
- **[docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Common issues and solutions
- **[docs/WORKFLOWS.md](docs/WORKFLOWS.md)** - Common usage workflows

## 📝 License

See [LICENSE](LICENSE) file for details.

## 👤 Author

Created by Goran Erhartic

## ☕ Support

If you find this suite helpful and want to support its development, consider buying me a beer or two! 🍺

[![PayPal](https://img.shields.io/badge/PayPal-Support-blue?logo=paypal&logoColor=white)](https://paypal.me/GoranLegenda)

**Or use PayPal directly:** [paypal.me/GoranLegenda](https://paypal.me/GoranLegenda)

Your support helps keep this project maintained and improved. Thank you! 🙏

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
