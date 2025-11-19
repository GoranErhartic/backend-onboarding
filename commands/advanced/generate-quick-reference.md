---
title: "08 - Generate Quick Reference"
description: "Generate AI-optimized quick reference index for fast lookups - run after analysis steps"
author: "Goran Erhartic"
---

Generate a comprehensive quick reference index optimized for AI agent consumption. This creates a searchable, structured index of all analyzed components.
**This step can be run independently after other analysis steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.

EXECUTION PLAN:

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 8 - Generate Quick Reference" as `[P]` (in progress).
        * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

2.  **Read All Documentation Files:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to understand what has been analyzed.
    * Read all available documentation files:
      - `.cursor/onboarding-docs/ARCHITECTURE.md` (if exists)
      - `.cursor/onboarding-docs/DATA_MODELS.md` (if exists)
      - `.cursor/onboarding-docs/SECURITY.md` (if exists)
      - `.cursor/onboarding-docs/CONFIGURATION.md` (if exists)
      - `.cursor/onboarding-docs/TESTING.md` (if exists)
      - `.cursor/onboarding-docs/INTEGRATIONS.md` (if exists)
      - `.cursor/onboarding-docs/ERROR_HANDLING.md` (if exists)
      - `.cursor/onboarding-docs/DOMAIN.md` (if exists)
      - `.cursor/onboarding-docs/API_CONTRACTS.md` (if exists)
      - `.cursor/onboarding-docs/PERFORMANCE.md` (if exists)
      - `.cursor/onboarding-docs/PRODUCTION_READINESS.md` (if exists)
    * Use `glob_file_search` to find all endpoint documentation files: `CURSOR_*.md` in `.cursor/onboarding-docs/` directory.

3.  **Extract Key Information:**
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
      - **IMPORTANT:** List all available `CURSOR_*.md` endpoint template files for reference
    * From architecture documentation:
      - Architectural patterns
      - Design patterns
      - Layer organization
      - **CRITICAL:** File location patterns for models, interfaces, services, repositories, controllers (needed for endpoint creation checklist)
      - Validation patterns and frameworks used
    * From data models:
      - Entity names
      - Key relationships
    * From security documentation:
      - Authentication mechanisms
      - Authorization patterns
      - Roles
      - Ownership validation patterns (e.g., AccountOwnershipValidator)
    * From integrations:
      - External services
      - API integrations
    * From domain documentation:
      - Business entities
      - Use cases
      - Business rules
    * From error handling documentation:
      - Exception types and patterns
      - Error response formats
      - Status code conventions

4.  **Generate Quick Reference Index:**
    * **CRITICAL:** When generating the "Checklist for Creating New Endpoints" section:
      - Extract actual file location patterns from `ARCHITECTURE.md` (e.g., where models, interfaces, services, repositories, controllers are located)
      - Extract validation patterns from `ARCHITECTURE.md` and `ERROR_HANDLING.md` (e.g., validator names, validation frameworks)
      - Replace placeholder text like `[models location pattern]` with actual project-specific paths
      - Replace placeholder text like `[specific validators]` with actual validator names found in the codebase
      - If patterns cannot be determined, use generic placeholders but note that they should be filled in based on project structure
    * Create `.cursor/onboarding-docs/QUICK_REFERENCE.md` with the following structure:

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
      
      ### ⚠️ IMPORTANT: Checklist for Creating New Endpoints
      **Before implementing a new endpoint, follow this checklist:**
      
      1. ✅ **Read Documentation First:**
         - Read `CURSOR-ONBOARDING.md` for project overview
         - Read `QUICK_REFERENCE.md` for patterns and conventions
         - Read `API_CONTRACTS.md` for API design patterns
      
      2. ✅ **Find Similar Endpoint Templates:**
         - Search for `CURSOR_{METHOD}_*.md` files matching your endpoint pattern
         - Review the template to understand the flow and patterns
         - Example: For PUT endpoints, check `CURSOR_PUT_*.md` files
         - Use `glob_file_search` with pattern `CURSOR_{METHOD}_*.md` in `.cursor/onboarding-docs/`
      
      3. ✅ **Plan Your Implementation:**
         - Identify which layer each component belongs to (Controller, Service, Repository)
         - Determine validation requirements (account ownership, business rules)
         - Plan error handling (which exceptions to throw, which status codes)
      
      4. ✅ **Implement Following Patterns:**
         - [Extract from ARCHITECTURE.md: List actual file location patterns for models, interfaces, services, repositories, controllers]
         - Example patterns (adapt based on actual project structure):
           - Create request/response models in [models location pattern]
           - Add service method to interface in [interfaces location pattern]
           - Implement service method in [services location pattern]
           - Add repository method if needed in [repositories location pattern]
           - Add controller endpoint in [controllers location pattern]
      
      5. ✅ **Add Validation:**
         - [Extract from ARCHITECTURE.md and ERROR_HANDLING.md: List validation patterns]
         - Example patterns (adapt based on actual project):
           - Use [specific validators] for [entity]-related endpoints
           - Add business rule validation in service layer
           - Use [validation framework] for complex validation rules
      
      6. ✅ **Document Your Endpoint:**
         - Create `CURSOR_{METHOD}_{sanitized_path}.md` file following the template structure
         - Document request flow, business logic, and error scenarios
         - Include AI Reference Metadata
      
      **Why this matters:** Endpoint templates ensure consistency, proper error handling, and architectural alignment. They are located in `.cursor/onboarding-docs/CURSOR_*.md` files.
      
      ### By HTTP Method
      - **GET:** [list all GET endpoints with paths]
      - **POST:** [list all POST endpoints with paths]
      - **PUT:** [list all PUT endpoints with paths]
      - **DELETE:** [list all DELETE endpoints with paths]
      - **PATCH:** [list all PATCH endpoints with paths]
      
      ### Available Endpoint Templates
      [List all available CURSOR_*.md endpoint template files with their paths and methods]
      - Example: `CURSOR_PUT_Accounts_accountId_Subscriptions_subscriptionId_quantity.md` - PUT endpoint template
      
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
      
      - **Architecture:** `.cursor/onboarding-docs/ARCHITECTURE.md`
      - **Data Models:** `.cursor/onboarding-docs/DATA_MODELS.md`
      - **Security:** `.cursor/onboarding-docs/SECURITY.md`
      - **Configuration:** `.cursor/onboarding-docs/CONFIGURATION.md`
      - **Testing:** `.cursor/onboarding-docs/TESTING.md`
      - **Integrations:** `.cursor/onboarding-docs/INTEGRATIONS.md`
      - **Error Handling:** `.cursor/onboarding-docs/ERROR_HANDLING.md`
      - **Domain:** `.cursor/onboarding-docs/DOMAIN.md`
      - **API Contracts:** `.cursor/onboarding-docs/API_CONTRACTS.md`
      - **Performance:** `.cursor/onboarding-docs/PERFORMANCE.md`
      - **Production Readiness:** `.cursor/onboarding-docs/PRODUCTION_READINESS.md`
      - **Endpoint Templates:** `.cursor/onboarding-docs/CURSOR_*.md` (individual endpoint docs - **USE AS TEMPLATES FOR NEW ENDPOINTS**)
      
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

5.  **Generate AI-Optimized Metadata File:**
    * Create `.cursor/onboarding-docs/REFERENCE_METADATA.json` with structured metadata:
      - Endpoints with tags, handlers, dependencies
      - Entities with relationships
      - Services with responsibilities
      - Files with purposes and tags
      - Cross-references between components

6.  **Update Master File:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * Add a section:
      ```markdown
      ## Quick Reference
      See [QUICK_REFERENCE.md](.cursor/onboarding-docs/QUICK_REFERENCE.md) for AI-optimized quick lookup index.
      See [REFERENCE_METADATA.json](.cursor/onboarding-docs/REFERENCE_METADATA.json) for structured metadata.
      ```
    * Write the updated content to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

7.  **Update Step Completion Status:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 8 - Generate Quick Reference" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 8 marked as complete.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

8.  **Completion:**
    * Report that quick reference has been generated.
    * Note that this index is optimized for AI agent consumption and provides fast lookups for common queries.

**Proceed with all steps above.**

