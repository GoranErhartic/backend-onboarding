# Cursor Onboarding Suite

A comprehensive suite of Cursor IDE commands designed to help developers quickly understand and document new codebases using AI-powered analysis.

## 🚀 Quick Start

**New to the suite?** Start here: **[QUICK_START.md](QUICK_START.md)**

The quick start guide will get you up and running in 3 simple steps.

## 📋 Overview

The Cursor Onboarding Suite provides a structured approach to understanding any codebase through automated analysis. It consists of:

- **1 First Step** - `/onboarding/initialize` should be run first to set up the foundation
- **8 Core Steps** - Analysis steps that can run in any order
- **1 Optional Step** - Advanced analysis for deeper insights

**Important:** `/onboarding/initialize` should be run first. After that, all other steps can run independently or in parallel in any order. All steps are designed to run independently and can be parallelized across multiple chat sessions for faster completion.

## 📁 Repository Structure

```
cursor-onboarding-suite/
├── README.md                   # This file
├── QUICK_START.md              # Quick start guide
├── LICENSE                     # License file
├── .cursorrules.template       # Project-specific rules template
│
├── commands/                   # All command files
│   ├── initialize.md           # First step (Required)
│   │
│   ├── discovery/              # Endpoint discovery & flow analysis
│   │   ├── analyze-core-and-endpoints.md
│   │   └── analyze-endpoint-flows.md
│   │
│   ├── analysis/               # Comprehensive analysis
│   │   ├── analyze-architecture.md
│   │   ├── analyze-config-and-testing.md
│   │   ├── analyze-integrations.md
│   │   └── analyze-domain-and-performance.md
│   │
│   └── advanced/               # Optional advanced analysis
│       ├── generate-quick-reference.md
│       ├── analyze-code-structure.md
│       └── assess-production-readiness.md
│
├── scripts/                    # Installation scripts
│   ├── install-mac.sh
│   └── install-windows.ps1
│
├── rules/                      # Cursor AI rules (copy to .cursor/rules)
│   ├── README.md
│   └── engineering-rule.mdc
│
└── docs/                       # Additional documentation
    ├── EXAMPLES.md
    └── TROUBLESHOOTING.md
```

## 🎯 Execution Flow

```
[First Step]
initialize (should run first)
                ↓
[All Other Steps - Can Run in Any Order, Independently or in Parallel]
        analyze-core-and-endpoints
        analyze-endpoint-flows
        analyze-architecture
        analyze-config-and-testing
        analyze-integrations
        analyze-domain-and-performance
        generate-quick-reference
        analyze-code-structure
        assess-production-readiness (optional)
```

**Note:** `/onboarding/initialize` should be run first. After that, all other steps can run independently or in parallel in any order. Only `assess-production-readiness` is optional.

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

Copy all `.md` files from `commands/`, `commands/discovery/`, `commands/analysis/`, and `commands/advanced/` to:
- **Mac/Linux**: `~/.cursor/commands/`
- **Windows**: `%USERPROFILE%\.cursor\commands\`

### Project-Specific Rules (Optional but Recommended)

For best results, copy the `rules` folder to your project's `.cursor` folder:

**Mac/Linux:**
```bash
cp -r rules /path/to/your/project/.cursor/rules
```

**Windows:**
```powershell
Copy-Item -Path rules -Destination .cursor\rules -Recurse
```

This configures Cursor AI to:
- Act as a senior principal engineer
- Take time to think through problems thoroughly
- Focus on quality over quantity
- Always check the `.cursor/onboarding-docs` folder for existing analysis results before starting work

**Note:** These are project-specific files that should be committed to your repository so all team members benefit from the same AI behavior. See [rules/README.md](rules/README.md) for more details.

## 🎮 Usage

### First Step

1. **`/onboarding/initialize`** - Initialize onboarding structure and perform project mapping
   - Should be run first before other steps
   - Creates `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` and `.cursor/onboarding-docs/PROJECT_MAP.txt`
   - Identifies tech stack and creates analysis checklists

### Core Steps (Can Run in Any Order)

After `/onboarding/initialize`, you can run these steps **in any order**, **independently**, or **in parallel**:

2. **`/onboarding/analyze-core-and-endpoints`** - Analyze core files & discover endpoints
   - Analyzes critical project files
   - Discovers and maps all API endpoints
   - Creates endpoint flow investigation checklist

3. **`/onboarding/analyze-endpoint-flows`** - Analyze endpoint flows
   - Documents complete request/response flow for each endpoint
   - Creates individual endpoint documentation files
   - **Parallel-safe**: Can run multiple instances simultaneously

4. **`/onboarding/analyze-architecture`** - Architecture, Data Models & Security
   - Architectural patterns and design patterns
   - Data models and database schema
   - Authentication and authorization

5. **`/onboarding/analyze-config-and-testing`** - Configuration & Testing
   - Configuration management and environment variables
   - Testing strategy and test structure

6. **`/onboarding/analyze-integrations`** - Integrations & Error Handling
   - External API integrations
   - Error handling and logging

7. **`/onboarding/analyze-domain-and-performance`** - Domain, API Contracts & Performance
   - Business domain and domain models
   - API contracts and validation
   - Performance optimization

8. **`/onboarding/generate-quick-reference`** - Generate Quick Reference
   - Creates AI-optimized quick lookup index
   - Can run independently or after other steps

9. **`/onboarding/analyze-code-structure`** - Analyze Code Structure
   - Code patterns, conventions, and anti-patterns
   - Component dependencies and relationships

### Optional Step

10. **`/onboarding/assess-production-readiness`** - Assess Production Readiness (OPTIONAL)
    - Comprehensive production readiness evaluation
    - Security, monitoring, scalability assessment

## 📊 What Each Step Produces

- **initialize**: `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, `.cursor/onboarding-docs/PROJECT_MAP.txt`
- **analyze-core-and-endpoints**: Updated `CURSOR-ONBOARDING.md` with file summaries and endpoint list
- **analyze-endpoint-flows**: Individual endpoint documentation files (`CURSOR_*.md`)
- **analyze-architecture**: `.cursor/onboarding-docs/ARCHITECTURE.md`, `.cursor/onboarding-docs/DATA_MODELS.md`, `.cursor/onboarding-docs/SECURITY.md`
- **analyze-config-and-testing**: `.cursor/onboarding-docs/CONFIGURATION.md`, `.cursor/onboarding-docs/TESTING.md`
- **analyze-integrations**: `.cursor/onboarding-docs/INTEGRATIONS.md`, `.cursor/onboarding-docs/ERROR_HANDLING.md`
- **analyze-domain-and-performance**: `.cursor/onboarding-docs/DOMAIN.md`, `.cursor/onboarding-docs/API_CONTRACTS.md`, `.cursor/onboarding-docs/PERFORMANCE.md`
- **generate-quick-reference**: `.cursor/onboarding-docs/QUICK_REFERENCE.md`, `.cursor/onboarding-docs/REFERENCE_METADATA.json`
- **analyze-code-structure**: `.cursor/onboarding-docs/CODE_PATTERNS.md`, `.cursor/onboarding-docs/DEPENDENCY_GRAPH.md`, `.cursor/onboarding-docs/DEPENDENCY_METADATA.json`
- **assess-production-readiness** (optional): `.cursor/onboarding-docs/PRODUCTION_READINESS.md`

## 💡 Best Practices

1. **Initialize first**: Run `/onboarding/initialize` first to set up the foundation
2. **Run in any order**: After initialization, all other steps can run in any order, independently or in parallel
3. **Parallel execution**: Run multiple steps simultaneously in different chat sessions for faster completion
4. **analyze-endpoint-flows**: Can be interrupted and resumed - it automatically recovers progress
5. **Clean context**: Start a new chat for each step to avoid context window issues
6. **Review progress**: Check `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see what's been completed
7. **Optional step**: Only run `assess-production-readiness` if you need production readiness assessment

## 🔧 Troubleshooting

### Command not found
- Ensure files are installed in `~/.cursor/commands/` (Mac/Linux) or `%USERPROFILE%\.cursor\commands\` (Windows)
- Restart Cursor IDE after installation
- Check that filenames match exactly (including numbers and hyphens)

### Step fails with "file doesn't exist"
- Run `/onboarding/initialize` first to create `CURSOR-ONBOARDING.md` and `PROJECT_MAP.txt`
- Ensure you're in the correct project directory

### analyze-endpoint-flows seems stuck
- analyze-endpoint-flows processes endpoints in a loop - this is normal
- It will continue until all endpoints are analyzed
- You can interrupt and resume - it will recover automatically
- Check `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see progress

For more troubleshooting help, see [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

## 🤖 AI Agent Optimization

This suite is specifically optimized for Cursor AI agents with:

- **Structured Metadata**: JSON metadata files for programmatic access
- **AI-friendly Tags**: Semantic tags in documentation for better search
- **Parallel Execution**: Safe parallel execution with atomic task claiming
- **Recovery Mechanisms**: Automatic recovery from interrupted sessions
- **Quick Reference**: AI-optimized lookup indexes
- **Project Rules**: `rules/` folder with engineering guidelines to configure Cursor as a senior principal engineer with quality-focused behavior (copy to `.cursor/rules/` for best results)

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
