---
title: "01 - Initialize Onboarding (REQUIRED)"
description: "Initialize onboarding structure and perform project mapping - REQUIRED: run this first to set up groundwork"
author: "Goran Erhartic"
---

Initialize the onboarding structure and perform initial project mapping. **This command must be run first** before any other onboarding steps. All other steps will check for these files and return an error if initialization hasn't been completed.
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* Each step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Initialize Onboarding" as `[P]` (in progress).
        * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** This will be created in step 6 with `[P]` status.

1.  **Initialize Directory Structure:**
    * Check if `.cursor` directory exists. If not, create it.
    * This directory will hold all onboarding documentation.

2.  **Map File Tree:**
    * **If `.cursor/PROJECT_MAP.txt` already exists and is not empty:** Read it first to check if mapping is already complete. If it appears complete, you may skip this step or update it.
    * Use `list_dir` tool recursively to explore the project structure.
    * Start from the workspace root and explore up to 5 levels deep.
    * Use `glob_file_search` to find files while excluding common directories:
      - Ignore: `.git/`, `node_modules/`, `.venv/`, `venv/`, `dist/`, `build/`, `.cursor/`, `.next/`, `__pycache__/`, `bin/`, `obj/`
    * Build a structured file tree representation and save it to `.cursor/PROJECT_MAP.txt`.
    * Format: Use indentation or tree structure (e.g., `├──` or `  `) to show hierarchy.
    * **Note:** This can be run multiple times safely - it will update the mapping.

3.  **Initial Analysis (Stack Discovery):**
    * Read the `PROJECT_MAP.txt` to understand the project structure.
    * **Identify and read dependency management files** using `glob_file_search` or `read_file`:
      - `.csproj`, `.sln` (C#/.NET)
      - `package.json`, `yarn.lock`, `pnpm-lock.yaml` (Node.js)
      - `pom.xml`, `build.gradle` (Java)
      - `go.mod`, `go.sum` (Go)
      - `pyproject.toml`, `requirements.txt`, `setup.py`, `Pipfile` (Python)
      - `Cargo.toml`, `Cargo.lock` (Rust)
      - `composer.json` (PHP)
      - `Gemfile`, `Gemfile.lock` (Ruby)
      - `build.sbt` (Scala)
    * **If no dependency files are found:** Use `codebase_search` with query: "What programming language and framework is this project using?" to infer stack from source files.
    * **Do not read other source code files** at this stage unless dependency files are missing.
    * Determine the tech stack based on files found (e.g., "C# .NET Core 8.0 Web API with Entity Framework Core").
    * **Extract key metadata for AI reference:**
      - Primary language and version
      - Main framework(s) and versions
      - Key libraries/dependencies (top 5-10 most important)
      - Build system (MSBuild, npm, Maven, etc.)
      - Runtime requirements (.NET version, Node version, Python version, etc.)

4.  **Identify Critical Files:**
    * Based on the stack analysis, identify 10-15 critical files to analyze:
      - Entry points: `Program.cs`, `Startup.cs`, `main.py`, `app.js`, `index.js`, `main.go`, etc.
      - Configuration: `appsettings.json`, `.env`, `config/`, `docker-compose.yml`, `Dockerfile`
      - Project files: `.csproj`, `package.json`, `go.mod`, etc.
      - Key application files: Controllers, Services, Models directories
    * **If project structure is unclear:** Use `codebase_search` with queries like "Where is the application entry point?" or "Where are the main configuration files?"

5.  **Identify Endpoint Discovery Locations:**
    * Based on the stack, identify likely locations for route definitions:
      - **ASP.NET Core:** `Controllers/`, `Program.cs` (minimal APIs), `Endpoints/`
      - **Express.js:** Files with `app.get/post/put/delete`, `router.`, `routes/` directory
      - **Flask/FastAPI:** Files with `@app.route`, `@router.`, `routes/` directory
      - **Spring Boot:** `@RestController`, `@Controller`, `@RequestMapping` annotations
      - **Go (Gin/Echo):** Files with route definitions, `routes/` directory
      - **Ruby on Rails:** `routes.rb`, `controllers/` directory
    * List 3-8 files or directories to scan for endpoints.

6.  **Create or Update CURSOR-ONBOARDING.md:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it first to preserve existing content. 
        * **Update the Step Completion Status section** - ensure "Initialize Onboarding" is marked as `[P]` (in progress) if not already marked as `[x]` (complete).
        * **Update only the relevant sections** - do not overwrite sections that may have been populated by other steps running in parallel. Only ensure all required sections exist (add missing sections if needed).
    * **If it doesn't exist:** Create it with the following structure:

      ```markdown
      # Project Analysis: [Insert Project Name from workspace or dependency file]
      
      > **Status:** Initialized - Ready for analysis
      > **Last Updated:** [Current Date/Time]
      
      ## Step Completion Status
      * [P] Initialize Onboarding - Project mapping and setup
      * [ ] Step 2 - Analyze Core Files & Discover Endpoints
      * [ ] Step 3 - Document Endpoint Flows
      * [ ] Step 4 - Architecture, Data Models & Security
      * [ ] Step 5 - Configuration & Testing
      * [ ] Step 6 - Integrations & Error Handling
      * [ ] Step 7 - Domain, API Contracts & Performance
      
      ## Stack Analysis
      [Insert detailed stack analysis here, including:
      - Primary language and framework
      - Key dependencies and versions (if available)
      - Build system
      - Runtime environment]
      
      ### Stack Metadata (AI-Friendly)
      ```json
      {
        "language": "[primary language]",
        "framework": "[main framework]",
        "version": "[version]",
        "buildSystem": "[build system]",
        "runtime": "[runtime requirements]",
        "keyDependencies": ["dep1", "dep2", ...]
      }
      ```
      
      ## Checklist: Core File Analysis
      [List all identified critical files, one per line, e.g.:]
      * [ ] `src/Program.cs`
      * [ ] `src/MyProject.csproj`
      * [ ] `appsettings.json`
      * [ ] `Dockerfile`
      [... continue with 10-15 files total]
      
      ## Checklist: Endpoint Discovery
      [List all identified endpoint discovery locations, one per line, e.g.:]
      * [ ] `src/Controllers/`
      * [ ] `src/Program.cs` (minimal APIs)
      * [ ] `routes/api.js`
      [... continue with identified locations]
      
      ## Key Project Files
      *(This section will be populated by analysis steps)*
      
      ## Application Endpoints
      *(This section will be populated by analysis steps)*
      
      ## Checklist: Endpoint Flow Investigation
      *(This section will be populated by analysis steps)*
      
      ## Architecture
      *(This section will be populated by Step 4)*
      
      ## Data Models
      *(This section will be populated by Step 4)*
      
      ## Security
      *(This section will be populated by Step 4)*
      
      ## Configuration
      *(This section will be populated by Step 5)*
      
      ## Testing
      *(This section will be populated by Step 5)*
      
      ## Integrations
      *(This section will be populated by Step 6)*
      
      ## Error Handling
      *(This section will be populated by Step 6)*
      
      ## Business Domain
      *(This section will be populated by Step 7)*
      
      ## API Contracts
      *(This section will be populated by Step 7)*
      
      ## Performance
      *(This section will be populated by Step 7)*
      ```

7.  **Update Step Completion Status:**
    * Read `.cursor/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Initialize Onboarding" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Initialize Onboarding marked as complete.
    * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.

8.  **Validation:**
    * Verify that `.cursor/` directory exists.
    * Verify that `.cursor/CURSOR-ONBOARDING.md` exists with the required structure and populated sections.
    * Verify that `.cursor/PROJECT_MAP.txt` exists and contains the file tree mapping.
    * Verify that the Step Completion Status section exists and shows Initialize Onboarding as complete.
    * Verify that at least some checklist items were added (if none found, note this as a warning).
    * Report the number of files mapped, stack identified, core files identified, and endpoint discovery locations identified.

9.  **Completion:**
    * Report completion status:
      - Number of files mapped
      - Stack identified
      - Number of core files identified for analysis
      - Number of endpoint discovery locations identified
    * Report that initialization and mapping is complete.
    * **Read `.cursor/CURSOR-ONBOARDING.md` to check Step Completion Status.**
    * **Report which steps are still pending (not run):**
      - Extract all steps from the Step Completion Status section that are marked as `[ ]` (not started).
      - Exclude any steps marked as `[P]` (currently running) from the pending list.
      - List the pending steps with their command names:
        - If "Step 2 - Analyze Core Files & Discover Endpoints" is `[ ]`: `/02-analyze-core-and-endpoints`
        - If "Step 3 - Document Endpoint Flows" is `[ ]`: `/03-analyze-endpoint-flows`
        - If "Step 4 - Architecture, Data Models & Security" is `[ ]`: `/04-analyze-architecture`
        - If "Step 5 - Configuration & Testing" is `[ ]`: `/05-analyze-config-and-testing`
        - If "Step 6 - Integrations & Error Handling" is `[ ]`: `/06-analyze-integrations`
        - If "Step 7 - Domain, API Contracts & Performance" is `[ ]`: `/07-analyze-domain-and-performance`
      - Format: "**Pending steps:** [list of command names]"
      - If all steps are complete or in progress, report: "All steps are complete or currently running."
    * Inform the user that they can now run any analysis step independently.
    * Note that steps can be run in parallel in separate sessions.

**Proceed with all steps above.**
