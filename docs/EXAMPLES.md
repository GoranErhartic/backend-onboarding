# Examples

Example outputs and usage patterns.

## Example Output Structure

After running the onboarding suite, your project will have:

```
your-project/
├── .cursor/onboarding-docs/
│   ├── CURSOR-ONBOARDING.md         # Master documentation
│   ├── PROJECT_MAP.txt              # File tree
│   ├── ARCHITECTURE.md              # Architecture docs
│   ├── DATA_MODELS.md               # Data models
│   ├── SECURITY.md                  # Security docs
│   ├── CONFIGURATION.md             # Configuration
│   ├── TESTING.md                   # Testing docs
│   ├── INTEGRATIONS.md              # Integrations
│   ├── ERROR_HANDLING.md            # Error handling
│   ├── DOMAIN.md                    # Business domain
│   ├── API_CONTRACTS.md             # API contracts
│   ├── PERFORMANCE.md               # Performance
│   ├── QUICK_REFERENCE.md           # Quick reference
│   ├── CODE_PATTERNS.md             # Code patterns
│   ├── DEPENDENCY_GRAPH.md          # Dependencies
│   ├── PRODUCTION_READINESS.md      # Production assessment (optional)
│   └── CURSOR_GET_api_users.md      # Endpoint docs
│   └── ...                          # More endpoint docs
```

## Example Command Sequence

```bash
# Session 1: Initialize
/onboarding/initialize

# Session 2: Discover endpoints
/onboarding/analyze-core-and-endpoints

# Session 3-6: Parallel analysis (run simultaneously)
/onboarding/analyze-endpoint-flows
/onboarding/analyze-architecture
/onboarding/analyze-config-and-testing
/onboarding/analyze-integrations
/onboarding/analyze-domain-and-performance

# Session 7: Additional steps
/onboarding/generate-quick-reference
/onboarding/analyze-code-structure
/onboarding/assess-production-readiness (optional)
```

## Example CURSOR-ONBOARDING.md Structure

```markdown
# Project Analysis: MyProject

> **Status:** Initialized - Ready for analysis
> **Last Updated:** 2024-01-15 10:30:00

## Step Completion Status
* [x] Initialize Onboarding - Project mapping and setup
* [x] Step 2 - Analyze Core Files & Discover Endpoints
* [P] Step 3 - Document Endpoint Flows
* [ ] Step 4 - Architecture, Data Models & Security
...

## Stack Analysis
- Language: C# .NET Core 8.0
- Framework: ASP.NET Core Web API
- Database: SQL Server with Entity Framework Core
...

## Application Endpoints
* GET /api/users - (UsersController.GetAll)
* POST /api/users - (UsersController.Create)
...
```

## Example Endpoint Documentation

Each endpoint gets its own file (e.g., `CURSOR_GET_api_users.md`):

```markdown
# GET /api/users

## Overview
Retrieves a list of all users in the system.

## Route Details
- **Method:** GET
- **Path:** /api/users
- **Handler:** UsersController.GetAll

## Request Flow
### Entry Point
UsersController.GetAll() in Controllers/UsersController.cs

### Middleware
- Authentication
- Authorization
- Logging

## Business Logic
- Calls UserService.GetAllUsers()
- Applies pagination
- Filters by active status

## Response Handling
- **Status Code:** 200
- **Format:** JSON array of UserDto objects
```

## Tips

- Review `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to see overall progress
- Check individual endpoint docs for detailed flow information
- Use quick reference for fast lookups after running generate-quick-reference
- Review production readiness assessment for deployment planning

