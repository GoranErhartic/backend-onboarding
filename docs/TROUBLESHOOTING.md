# Troubleshooting Guide

Common issues and solutions when using the Cursor Onboarding Suite.

## Command Not Found

**Problem:** Commands don't appear in Cursor IDE after installation.

**Solutions:**
1. Ensure files are installed in the correct location:
   - **Mac/Linux**: `~/.cursor/commands/`
   - **Windows**: `%USERPROFILE%\.cursor\commands\`
2. Restart Cursor IDE completely (quit and reopen)
3. Check that filenames match exactly (including numbers and hyphens)
4. Verify files have `.md` extension

## Step Fails with "File Doesn't Exist"

**Problem:** Step reports that `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` doesn't exist.

**Solutions:**
1. Run `/onboarding/initialize` first - this is required before any other step
2. Ensure you're in the correct project directory (the one with your source code)
3. Check that `.cursor/onboarding-docs/` directory was created in your project root

## analyze-endpoint-flows Seems Stuck

**Problem:** analyze-endpoint-flows appears to be running indefinitely.

**Solutions:**
1. This is normal - analyze-endpoint-flows processes endpoints in a loop until all are analyzed
2. Check `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see progress
3. You can interrupt and resume - it will automatically recover progress
4. For large projects, consider running multiple instances in parallel

## Installation Script Fails

**Problem:** Installation script doesn't work or reports errors.

**Solutions:**
1. **Mac/Linux**: Ensure script is executable: `chmod +x scripts/install-mac.sh`
2. **Windows**: Run PowerShell as Administrator if needed
3. Check that you're running the script from the repository root
4. Try manual installation by copying files directly

## Parallel Execution Conflicts

**Problem:** Multiple sessions seem to conflict when running steps in parallel.

**Solutions:**
1. Each step is designed to be parallel-safe - conflicts should be rare
2. If you see conflicts, ensure you're running different steps (not the same step multiple times)
3. analyze-endpoint-flows is specifically designed for parallel execution - multiple instances are safe
4. Check `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see what's been completed

## No Endpoints Found

**Problem:** analyze-core-and-endpoints doesn't find any endpoints.

**Solutions:**
1. This may be normal for non-API projects (libraries, CLI tools, etc.)
2. Check that your project actually has API endpoints
3. Verify the framework detection is correct
4. Manually add endpoint locations to the checklist in `CURSOR-ONBOARDING.md`

## Context Window Issues

**Problem:** Steps fail due to context window limits.

**Solutions:**
1. Start a new chat for each step to avoid context window issues
2. For analyze-endpoint-flows, it will automatically pause if context window is low
3. Resume by running the same command again in a new session
4. Consider running fewer steps simultaneously

## Still Need Help?

If you encounter issues not covered here:
1. Check the [README.md](../README.md) for detailed documentation
2. Review the command file contents for execution details
3. Ensure your Cursor IDE is up to date
4. Open an issue on GitHub with details about your problem

