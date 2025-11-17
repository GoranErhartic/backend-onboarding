# Common Workflows

Recommended workflows for different use cases.

## Quick Analysis (Minimum Required)

For a quick understanding of a codebase:

1. `/01-initialize` - Set up project mapping
2. `/02-analyze-core-and-endpoints` - Discover endpoints
3. `/03-analyze-endpoint-flows` - Document endpoint flows

**Time:** ~20-45 minutes  
**Output:** Basic understanding of project structure and API endpoints

## Standard Analysis (Recommended)

For comprehensive codebase understanding:

1. `/01-initialize` - Set up project mapping
2. `/02-analyze-core-and-endpoints` - Discover endpoints
3. Run in parallel (separate chat sessions):
   - `/03-analyze-endpoint-flows`
   - `/04-analyze-architecture`
   - `/05-analyze-config-and-testing`
   - `/06-analyze-integrations`
   - `/07-analyze-domain-and-performance`

**Time:** ~30-60 minutes  
**Output:** Complete understanding of architecture, configuration, integrations, and domain

## Full Analysis (Complete Documentation)

For complete documentation and AI optimization:

1. Complete Standard Analysis workflow
2. Run optional steps:
   - `/08-generate-quick-reference` - Create quick reference index
   - `/09-analyze-code-structure` - Code patterns and dependencies
   - `/10-assess-production-readiness` - Production readiness assessment

**Time:** ~60-90 minutes  
**Output:** Complete documentation with AI-optimized references

## Parallel Execution Workflow

For fastest completion:

**Session 1:**
- `/01-initialize`
- `/02-analyze-core-and-endpoints`

**Session 2 (after Session 1 completes):**
- `/03-analyze-endpoint-flows`

**Session 3 (parallel with Session 2):**
- `/04-analyze-architecture`

**Session 4 (parallel with Session 2):**
- `/05-analyze-config-and-testing`

**Session 5 (parallel with Session 2):**
- `/06-analyze-integrations`

**Session 6 (parallel with Session 2):**
- `/07-analyze-domain-and-performance`

**Time:** ~20-40 minutes (depending on parallelization)

## Focused Analysis Workflows

### API-Focused Project
1. `/01-initialize`
2. `/02-analyze-core-and-endpoints`
3. `/03-analyze-endpoint-flows`
4. `/07-analyze-domain-and-performance` (for API contracts)

### Architecture-Focused Project
1. `/01-initialize`
2. `/02-analyze-core-and-endpoints`
3. `/04-analyze-architecture`
4. `/09-analyze-code-structure` (for patterns)

### Production-Ready Assessment
1. Complete Standard Analysis workflow
2. `/10-assess-production-readiness`

## Tips for Large Projects

1. **Step 03**: Can be interrupted and resumed - don't worry about long runs
2. **Parallel Execution**: Run steps 04-07 simultaneously for faster completion
3. **Incremental**: Run required steps first, then add analysis steps as needed
4. **Review Progress**: Check `.cursor/CURSOR-ONBOARDING.md` regularly to see what's done

