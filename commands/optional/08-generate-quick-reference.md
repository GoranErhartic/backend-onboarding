---
title: "08 - Generate Quick Reference (OPTIONAL)"
description: "Generate AI-optimized quick reference index for fast lookups - OPTIONAL: run after analysis steps"
author: "Goran Erhartic"
---

Generate a comprehensive quick reference index optimized for AI agent consumption. This creates a searchable, structured index of all analyzed components.
**This step can be run independently after other analysis steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.

EXECUTION PLAN:

0.  **Check for Initialization:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/01-initialize` first.

1.  **Read All Documentation Files:**
    * Read `.cursor/CURSOR-ONBOARDING.md` to understand what has been analyzed.
    * Read all available documentation files:
      - `.cursor/ARCHITECTURE.md` (if exists)
      - `.cursor/DATA_MODELS.md` (if exists)
      - `.cursor/SECURITY.md` (if exists)
      - `.cursor/CONFIGURATION.md` (if exists)
      - `.cursor/TESTING.md` (if exists)
      - `.cursor/INTEGRATIONS.md` (if exists)
      - `.cursor/ERROR_HANDLING.md` (if exists)
      - `.cursor/DOMAIN.md` (if exists)
      - `.cursor/API_CONTRACTS.md` (if exists)
      - `.cursor/PERFORMANCE.md` (if exists)
      - `.cursor/PRODUCTION_READINESS.md` (if exists)
    * Use `glob_file_search` to find all endpoint documentation files: `CURSOR_*.md` in `.cursor/` directory.

2.  **Extract Key Information:**
    * From `CURSOR-ONBOARDING.md`:
      - Stack information
      - Core files list
      - Endpoints list
      - Step completion status
    * From endpoint documentation files:
      - Endpoint paths and methods
      - Handler locations
      - Dependencies
      - Tags/metadata
    * From architecture documentation:
      - Architectural patterns
      - Design patterns
      - Layer organization
    * From data models:
      - Entity names
      - Key relationships
    * From security documentation:
      - Authentication mechanisms
      - Authorization patterns
      - Roles
    * From integrations:
      - External services
      - API integrations
    * From domain documentation:
      - Business entities
      - Use cases
      - Business rules

3.  **Generate Quick Reference Index:**
    * Create `.cursor/QUICK_REFERENCE.md` with the following structure:

      ```markdown
      # Quick Reference Index
      
      > **Generated:** [Current Date/Time]
      > **Purpose:** AI-optimized quick lookup index for codebase analysis
      
      ## Stack Summary
      
      **Language:** [language]
      **Framework:** [framework] [version]
      **Build System:** [build system]
      **Runtime:** [runtime requirements]
      
      ## Endpoints Index
      
      ### By HTTP Method
      - **GET:** [list all GET endpoints with paths]
      - **POST:** [list all POST endpoints with paths]
      - **PUT:** [list all PUT endpoints with paths]
      - **DELETE:** [list all DELETE endpoints with paths]
      - **PATCH:** [list all PATCH endpoints with paths]
      
      ### By Feature/Module
      [Group endpoints by feature/module if identifiable]
      
      ### By Handler Location
      [Group endpoints by controller/handler file location]
      
      ## Core Files Index
      
      ### Entry Points
      - `[file path]` - [purpose]
      
      ### Configuration Files
      - `[file path]` - [purpose]
      
      ### Controllers/Handlers
      - `[file path]` - [purpose, endpoints handled]
      
      ### Services
      - `[file path]` - [purpose, responsibilities]
      
      ### Models/Entities
      - `[file path]` - [purpose, entities defined]
      
      ### Middleware
      - `[file path]` - [purpose, when applied]
      
      ## Data Models Index
      
      ### Entities
      - **[EntityName]** - [purpose]
        - Key Properties: [list 3-5 key properties]
        - Relationships: [list relationships]
        - Location: [file path]
      
      ### Relationships Map
      ```
      [Entity1] --1:N--> [Entity2]
      [Entity2] --N:1--> [Entity3]
      ```
      
      ## Architecture Patterns
      
      - **Architectural Pattern:** [pattern name]
      - **Design Patterns:** [list patterns]
      - **Layers:** [list layers]
      
      ## Security Index
      
      ### Authentication
      - **Mechanism:** [JWT/OAuth/etc.]
      - **Configuration:** [location]
      
      ### Authorization
      - **Pattern:** [RBAC/Policy-based/etc.]
      - **Roles:** [list roles]
      - **Protected Endpoints:** [count]
      
      ## Integration Index
      
      ### External APIs
      - **[API Name]** - [purpose, location in code]
      
      ### Third-Party Services
      - **[Service Name]** - [purpose, configuration location]
      
      ## Domain Concepts
      
      ### Business Entities
      - **[Entity]** - [description]
      
      ### Use Cases
      - **[Use Case]** - [description]
      
      ### Business Rules
      - **[Rule]** - [description, enforcement location]
      
      ## Common Patterns & Conventions
      
      ### Naming Conventions
      - Controllers: [pattern]
      - Services: [pattern]
      - Models: [pattern]
      
      ### Code Organization
      - [patterns observed]
      
      ## File Location Quick Lookup
      
      | Component Type | Location Pattern | Example |
      |----------------|------------------|---------|
      | Controllers | [pattern] | [example] |
      | Services | [pattern] | [example] |
      | Models | [pattern] | [example] |
      | Configuration | [pattern] | [example] |
      
      ## AI Search Hints
      
      ### Finding Endpoints
      - Search for: "[framework] route definition"
      - Look in: [directories]
      
      ### Finding Business Logic
      - Search for: "service layer" or "[domain] business logic"
      - Look in: [directories]
      
      ### Finding Data Access
      - Search for: "repository" or "data access" or "database queries"
      - Look in: [directories]
      
      ## Documentation Files Reference
      
      - **Architecture:** `.cursor/ARCHITECTURE.md`
      - **Data Models:** `.cursor/DATA_MODELS.md`
      - **Security:** `.cursor/SECURITY.md`
      - **Configuration:** `.cursor/CONFIGURATION.md`
      - **Testing:** `.cursor/TESTING.md`
      - **Integrations:** `.cursor/INTEGRATIONS.md`
      - **Error Handling:** `.cursor/ERROR_HANDLING.md`
      - **Domain:** `.cursor/DOMAIN.md`
      - **API Contracts:** `.cursor/API_CONTRACTS.md`
      - **Performance:** `.cursor/PERFORMANCE.md`
      - **Production Readiness:** `.cursor/PRODUCTION_READINESS.md`
      - **Endpoint Flows:** `.cursor/CURSOR_*.md` (individual endpoint docs)
      
      ## Metadata Index (JSON)
      
      ```json
      {
        "endpoints": [
          {
            "method": "[METHOD]",
            "path": "[path]",
            "handler": "[location]",
            "tags": ["tag1", "tag2"],
            "docFile": "[filename]"
          }
        ],
        "entities": [
          {
            "name": "[EntityName]",
            "file": "[file path]",
            "relationships": ["rel1", "rel2"]
          }
        ],
        "services": [
          {
            "name": "[ServiceName]",
            "file": "[file path]",
            "responsibilities": ["resp1", "resp2"]
          }
        ]
      }
      ```
      ```

4.  **Generate AI-Optimized Metadata File:**
    * Create `.cursor/REFERENCE_METADATA.json` with structured metadata:
      - Endpoints with tags, handlers, dependencies
      - Entities with relationships
      - Services with responsibilities
      - Files with purposes and tags
      - Cross-references between components

5.  **Update Master File:**
    * Read `.cursor/CURSOR-ONBOARDING.md` again.
    * Add a section:
      ```markdown
      ## Quick Reference
      See [QUICK_REFERENCE.md](.cursor/QUICK_REFERENCE.md) for AI-optimized quick lookup index.
      See [REFERENCE_METADATA.json](.cursor/REFERENCE_METADATA.json) for structured metadata.
      ```
    * Write the updated content to `.cursor/CURSOR-ONBOARDING.md`.

6.  **Completion:**
    * Report that quick reference has been generated.
    * Note that this index is optimized for AI agent consumption and provides fast lookups for common queries.

**Proceed with all steps above.**

