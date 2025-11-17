# Quick Start Guide

Get started with the Cursor Onboarding Suite in 3 simple steps.

## Step 1: Install Commands

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

## Step 2: Initialize (Required First Step)

1. Open your project in Cursor IDE
2. Start a new chat
3. Type: `/01-initialize`

This creates the foundation files needed for all other steps.

## Step 3: Run Analysis Steps

### Required Steps (Run in Order)

```
01-initialize → 02-analyze-core-and-endpoints → 03-analyze-endpoint-flows
```

**Commands:**
- `/01-initialize` - Set up project mapping (REQUIRED FIRST)
- `/02-analyze-core-and-endpoints` - Discover endpoints (REQUIRED)
- `/03-analyze-endpoint-flows` - Document endpoint flows (REQUIRED)

### Analysis Steps (Can Run in Parallel)

After step 02, you can run these **in parallel** in separate chat sessions:

```
04-analyze-architecture
05-analyze-config-and-testing
06-analyze-integrations
07-analyze-domain-and-performance
```

**Commands:**
- `/04-analyze-architecture` - Architecture, data models, security
- `/05-analyze-config-and-testing` - Configuration and testing
- `/06-analyze-integrations` - External integrations and error handling
- `/07-analyze-domain-and-performance` - Business domain and performance

### Optional Steps (Advanced)

Run these after completing the required steps:

```
08-generate-quick-reference
09-analyze-code-structure
10-assess-production-readiness
```

**Commands:**
- `/08-generate-quick-reference` - Create AI-optimized reference index
- `/09-analyze-code-structure` - Code patterns and dependencies
- `/10-assess-production-readiness` - Production readiness assessment

## Execution Flow

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

## Time Estimates

- **01-initialize**: ~2-5 minutes
- **02-analyze-core-and-endpoints**: ~5-10 minutes
- **03-analyze-endpoint-flows**: ~10-30 minutes (depends on number of endpoints)
- **04-07 (analysis steps)**: ~5-15 minutes each (can run in parallel)
- **08-10 (optional steps)**: ~5-20 minutes each

## Tips

1. **Parallel Execution**: Run steps 04-07 simultaneously in different chat sessions for faster completion
2. **Step 03**: Can be interrupted and resumed - it will automatically recover progress
3. **Skip Optional Steps**: Only run optional steps if you need that specific analysis
4. **Check Progress**: Review `.cursor/CURSOR-ONBOARDING.md` to see what's been completed

## Need Help?

- See [README.md](README.md) for detailed documentation
- Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for common issues
- Review [docs/WORKFLOWS.md](docs/WORKFLOWS.md) for common usage patterns
