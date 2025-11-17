# Common Workflows

Recommended workflows for different use cases.

## Quick Analysis (Minimum Required)

For a quick understanding of a codebase:

1. `/onboarding/initialize` - Set up project mapping
2. `/onboarding/analyze-core-and-endpoints` - Discover endpoints
3. `/onboarding/analyze-endpoint-flows` - Document endpoint flows

**Time:** ~20-45 minutes  
**Output:** Basic understanding of project structure and API endpoints

## Standard Analysis (Recommended)

For comprehensive codebase understanding:

1. `/onboarding/initialize` - Set up project mapping
2. `/onboarding/analyze-core-and-endpoints` - Discover endpoints
3. Run in parallel (separate chat sessions):
   - `/onboarding/analyze-endpoint-flows`
   - `/onboarding/analyze-architecture`
   - `/onboarding/analyze-config-and-testing`
   - `/onboarding/analyze-integrations`
   - `/onboarding/analyze-domain-and-performance`

**Time:** ~30-60 minutes  
**Output:** Complete understanding of architecture, configuration, integrations, and domain

## Full Analysis (Complete Documentation)

For complete documentation and AI optimization:

1. Complete Standard Analysis workflow
2. Run optional steps:
   - `/onboarding/generate-quick-reference` - Create quick reference index
   - `/onboarding/analyze-code-structure` - Code patterns and dependencies
   - `/onboarding/assess-production-readiness` - Production readiness assessment

**Time:** ~60-90 minutes  
**Output:** Complete documentation with AI-optimized references

## Parallel Execution Workflow

For fastest completion:

**Session 1:**
- `/onboarding/initialize`
- `/onboarding/analyze-core-and-endpoints`

**Session 2 (after Session 1 completes):**
- `/onboarding/analyze-endpoint-flows`

**Session 3 (parallel with Session 2):**
- `/onboarding/analyze-architecture`

**Session 4 (parallel with Session 2):**
- `/onboarding/analyze-config-and-testing`

**Session 5 (parallel with Session 2):**
- `/onboarding/analyze-integrations`

**Session 6 (parallel with Session 2):**
- `/onboarding/analyze-domain-and-performance`

**Time:** ~20-40 minutes (depending on parallelization)

## Focused Analysis Workflows

### API-Focused Project
1. `/onboarding/initialize`
2. `/onboarding/analyze-core-and-endpoints`
3. `/onboarding/analyze-endpoint-flows`
4. `/onboarding/analyze-domain-and-performance` (for API contracts)

### Architecture-Focused Project
1. `/onboarding/initialize`
2. `/onboarding/analyze-core-and-endpoints`
3. `/onboarding/analyze-architecture`
4. `/onboarding/analyze-code-structure` (for patterns)

### Production-Ready Assessment
1. Complete Standard Analysis workflow
2. `/onboarding/assess-production-readiness`

## Tips for Large Projects

1. **analyze-endpoint-flows**: Can be interrupted and resumed - don't worry about long runs
2. **Parallel Execution**: Run analysis steps simultaneously for faster completion
3. **Incremental**: Run required steps first, then add analysis steps as needed
4. **Review Progress**: Check `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` regularly to see what's done

