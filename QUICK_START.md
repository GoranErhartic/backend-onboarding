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

## Step 2: Initialize

1. Open your project in Cursor IDE
2. Start a new chat
3. Type: `/onboarding/initialize`

This creates the foundation files needed for all other steps.

## Step 3: Run Analysis Steps

**`/onboarding/initialize` should be run first.** After that, all other steps can run in any order.

### Core Steps (Can Run in Any Order)

After initialization, you can run these steps **in any order**, **independently**, or **in parallel**:

**Commands:**
- `/onboarding/analyze-core-and-endpoints` - Discover endpoints and analyze core files
- `/onboarding/analyze-endpoint-flows` - Document endpoint flows
- `/onboarding/analyze-architecture` - Architecture, data models, security
- `/onboarding/analyze-config-and-testing` - Configuration and testing
- `/onboarding/analyze-integrations` - External integrations and error handling
- `/onboarding/analyze-domain-and-performance` - Business domain and performance
- `/onboarding/generate-quick-reference` - Create AI-optimized reference index
- `/onboarding/analyze-code-structure` - Code patterns and dependencies

### Conditional Step

- `/onboarding/analyze-event-driven-architecture` - Deep dive into pub/sub messaging (only when `/onboarding/initialize` detects event-driven usage)

### Optional Step

- `/onboarding/assess-production-readiness` (OPTIONAL) - Production readiness assessment

## Execution Flow

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
        analyze-event-driven-architecture (conditional)
        assess-production-readiness (optional)
```

**Note:** `/onboarding/initialize` should be run first. After that, all steps can run independently or in parallel in any order. `analyze-event-driven-architecture` runs only when initialization flags pub/sub usage. Only `assess-production-readiness` is optional.

## Time Estimates

- **initialize**: ~2-5 minutes
- **analyze-core-and-endpoints**: ~5-10 minutes
- **analyze-endpoint-flows**: ~10-30 minutes (depends on number of endpoints)
- **analysis steps**: ~5-15 minutes each (can run in parallel)
- **advanced steps**: ~5-20 minutes each

## Tips

1. **Initialize first**: Run `/onboarding/initialize` first - after that, run steps in any order
2. **Parallel Execution**: Run multiple steps simultaneously in different chat sessions for faster completion
3. **analyze-endpoint-flows**: Can be interrupted and resumed - it will automatically recover progress
4. **Event-driven step**: If `CURSOR-ONBOARDING.md` shows **Detected: Yes** under Event-Driven Architecture, run `/onboarding/analyze-event-driven-architecture` before touching messaging code
5. **Optional step**: Only run `assess-production-readiness` if you need production readiness assessment
6. **Check Progress**: Review `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see what's been completed
7. **Endpoint Templates**: Before creating new endpoints, check for existing `CURSOR_{METHOD}_*.md` template files in `.cursor/onboarding-docs/` - these provide complete implementation patterns and should be used as guides

## Need Help?

- See [README.md](README.md) for detailed documentation
- Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for common issues
- Review [docs/WORKFLOWS.md](docs/WORKFLOWS.md) for common usage patterns
