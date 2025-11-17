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

### Optional: Add Project Rules (Recommended)

For best results, copy the `rules` folder to your project's `.cursor` folder:

**Mac/Linux:**
```bash
cp -r rules /path/to/your/project/.cursor/rules
```

**Windows:**
```powershell
Copy-Item -Path rules -Destination .cursor\rules -Recurse
```

This configures Cursor AI to act as a Senior Principal Engineer, prioritizing quality, thinking thoroughly, and automatically leveraging analysis results from the `.cursor/onboarding-docs` folder.

**Alternative:** You can also copy `.cursorrules.template` to your project root as `.cursorrules` for similar (but less comprehensive) behavior:

```bash
cp .cursorrules.template /path/to/your/project/.cursorrules
```

## Step 2: Initialize (Required First Step)

1. Open your project in Cursor IDE
2. Start a new chat
3. Type: `/onboarding/initialize`

This creates the foundation files needed for all other steps.

## Step 3: Run Analysis Steps

### Required First Step

**Only `/onboarding/initialize` must be run first.** After that, all other steps can run in any order.

### Recommended Steps (Can Run in Any Order)

After initialization, you can run these steps **in any order**, **independently**, or **in parallel**:

**Commands:**
- `/onboarding/analyze-core-and-endpoints` - Discover endpoints and analyze core files
- `/onboarding/analyze-endpoint-flows` - Document endpoint flows
- `/onboarding/analyze-architecture` - Architecture, data models, security
- `/onboarding/analyze-config-and-testing` - Configuration and testing
- `/onboarding/analyze-integrations` - External integrations and error handling
- `/onboarding/analyze-domain-and-performance` - Business domain and performance

### Optional Steps (Advanced)

These are optional and can run independently:

**Commands:**
- `/onboarding/generate-quick-reference` - Create AI-optimized reference index
- `/onboarding/analyze-code-structure` - Code patterns and dependencies
- `/onboarding/assess-production-readiness` - Production readiness assessment

## Execution Flow

```
[Required First Step]
initialize (MUST run first)
                ↓
[All Other Steps - Can Run in Any Order, Independently or in Parallel]
        analyze-core-and-endpoints
        analyze-endpoint-flows
        analyze-architecture
        analyze-config-and-testing
        analyze-integrations
        analyze-domain-and-performance
        generate-quick-reference (optional)
        analyze-code-structure (optional)
        assess-production-readiness (optional)
```

**Note:** Only `/onboarding/initialize` must be run first. After that, all steps can run independently or in parallel in any order.

## Time Estimates

- **initialize**: ~2-5 minutes
- **analyze-core-and-endpoints**: ~5-10 minutes
- **analyze-endpoint-flows**: ~10-30 minutes (depends on number of endpoints)
- **analysis steps**: ~5-15 minutes each (can run in parallel)
- **advanced steps**: ~5-20 minutes each

## Tips

1. **Only One Requirement**: Only `/onboarding/initialize` must run first - after that, run steps in any order
2. **Parallel Execution**: Run multiple steps simultaneously in different chat sessions for faster completion
3. **analyze-endpoint-flows**: Can be interrupted and resumed - it will automatically recover progress
4. **Skip Optional Steps**: Only run optional advanced steps if you need that specific analysis
5. **Check Progress**: Review `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see what's been completed

## Need Help?

- See [README.md](README.md) for detailed documentation
- Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for common issues
- Review [docs/WORKFLOWS.md](docs/WORKFLOWS.md) for common usage patterns
