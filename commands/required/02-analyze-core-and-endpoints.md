---
title: "02 - Analyze Core Files & Discover Endpoints (REQUIRED)"
description: "Analyze Core Files & Map Endpoints - REQUIRED: discovers endpoints for flow analysis"
author: "Goran Erhartic"
---

Analyze all pending core files from the checklist AND scan for all endpoints to populate the flow investigation checklist.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: Analyze Core Files

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 2 - Analyze Core Files & Discover Endpoints" as `[P]` (in progress).
        * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/01-initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/initialize-onboarding` first.

2.  **Read Master File:**
    * Read `.cursor/CURSOR-ONBOARDING.md`.

3.  **Check for Core File Checklist:**
    * Find the `## Checklist: Core File Analysis` section.
    * **If checklist doesn't exist or is empty:** 
        * Discover critical files inline (see Step 1 mapping logic):
          - Identify dependency management files to determine stack
          - Based on stack, identify 10-15 critical files:
            - Entry points: `Program.cs`, `Startup.cs`, `main.py`, `app.js`, `index.js`, `main.go`, etc.
            - Configuration: `appsettings.json`, `.env`, `config/`, `docker-compose.yml`, `Dockerfile`
            - Project files: `.csproj`, `package.json`, `go.mod`, etc.
            - Key application files: Controllers, Services, Models directories
          * Create the checklist in `CURSOR-ONBOARDING.md` with these files marked as `[ ]` (pending).
    
    * Extract all items marked with `[ ]` (pending tasks).
    * Count the total number of pending files for progress tracking.

4.  **Execute Core File Analysis (Batch Processing):**
    * Initialize an empty string for `new_file_summaries`.
    * Initialize a counter for successfully analyzed files.
    * **Process files in parallel where possible** (read multiple files simultaneously using batch tool calls).
    * For each pending file:
        * **Check if file exists** using `read_file` (will fail gracefully if missing).
        * **If file doesn't exist:**
            * Append a note to `new_file_summaries`: `### [File Path] - FILE NOT FOUND`
            * Mark checklist item as `[E]` (error) in memory with a note: `* [E] [File Path] - File not found`
            * Continue to next file.
        * **If file exists:**
            * Read the file's content.
            * **Use `codebase_search` for complex files** with queries like:
              - "What is the purpose of [file path]?"
              - "What are the main responsibilities of [file/class name]?"
              - "How does [file/class name] interact with other components?"
            * Generate a structured summary following this format:
              ```
              ### [File Path]
              
              **Purpose:** [1-2 sentence description of the file's primary purpose]
              
              **Key Responsibilities:**
              - [Responsibility 1]
              - [Responsibility 2]
              - [etc.]
              
              **Dependencies/Imports:** [List key dependencies or imports if relevant]
              
              **Relationships:** [Note relationships to other files/modules if identifiable]
              
              **Architectural Layer:** [Identify which layer this file belongs to if clear: Presentation, Business, Data, Infrastructure]
              
              **Key Functions/Classes:** [List main exported functions, classes, or components]
              
              **AI Reference Tags:** [Add relevant tags like: #entry-point, #configuration, #controller, #service, #model, #middleware, etc.]
              
              **Notes:** [Any additional important observations]
              ```
            * Append this summary to the `new_file_summaries` string.
            * **Update checklist item status from `[ ]` to `[x]` (in memory).**
            * Increment success counter.

## PART B: Discover Endpoints

5.  **Check for Endpoint Discovery Checklist:**
    * Find the `## Checklist: Endpoint Discovery` section.
    * **If checklist doesn't exist or is empty:**
        * Discover endpoint locations inline (see Step 1 mapping logic):
          - Identify stack from dependency files or existing stack analysis
          - Based on stack, identify likely locations for route definitions:
            - **ASP.NET Core:** `Controllers/`, `Program.cs` (minimal APIs), `Endpoints/`
            - **Express.js:** Files with `app.get/post/put/delete`, `router.`, `routes/` directory
            - **Flask/FastAPI:** Files with `@app.route`, `@router.`, `routes/` directory
            - **Spring Boot:** `@RestController`, `@Controller`, `@RequestMapping` annotations
            - **Go (Gin/Echo):** Files with route definitions, `routes/` directory
            - **Ruby on Rails:** `routes.rb`, `controllers/` directory
          * Create the checklist in `CURSOR-ONBOARDING.md` with these locations marked as `[ ]` (pending).
    
    * Extract all items marked with `[ ]` (pending tasks).
    * Count the total number of pending locations for progress tracking.

6.  **Framework-Specific Endpoint Detection:**
    * Based on the stack analysis from `CURSOR-ONBOARDING.md`, use appropriate detection methods:
      
      **ASP.NET Core:**
      - Search for: `[Route(`, `[HttpGet(`, `[HttpPost(`, `[HttpPut(`, `[HttpDelete(`, `[HttpPatch(`
      - Search for: `app.MapGet(`, `app.MapPost(`, `app.MapPut(`, `app.MapDelete(` (minimal APIs)
      - Use `grep` with patterns like: `\[HttpGet|\[HttpPost|\[Route|app\.Map`
      
      **Express.js / Node.js:**
      - Search for: `app.get(`, `app.post(`, `app.put(`, `app.delete(`, `app.patch(`
      - Search for: `router.get(`, `router.post(`, `router.put(`, `router.delete(`
      - Search for: `express.Router()`
      - Use `grep` with patterns like: `app\.(get|post|put|delete|patch)\(|router\.(get|post|put|delete|patch)\(`
      
      **Flask / Python:**
      - Search for: `@app.route(`, `@router.route(`, `@blueprint.route(`
      - Search for: `@app.get(`, `@app.post(` (Flask 2.0+)
      - Use `grep` with patterns like: `@(app|router|blueprint)\.route\(|@app\.(get|post|put|delete)\(`
      
      **FastAPI:**
      - Search for: `@app.get(`, `@app.post(`, `@app.put(`, `@app.delete(`, `@router.get(`
      - Use `grep` with patterns like: `@(app|router)\.(get|post|put|delete|patch)\(`
      
      **Spring Boot / Java:**
      - Search for: `@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`, `@RequestMapping`
      - Search for: `@RestController`, `@Controller`
      - Use `grep` with patterns like: `@(Get|Post|Put|Delete|Request)Mapping|@RestController`
      
      **Go (Gin/Echo):**
      - Search for: `router.GET(`, `router.POST(`, `router.PUT(`, `router.DELETE(`
      - Search for: `e.GET(`, `e.POST(` (Echo framework)
      - Use `grep` with patterns like: `(router|e)\.(GET|POST|PUT|DELETE)\(`
      
      **Ruby on Rails:**
      - Read `config/routes.rb` for route definitions
      - Search controllers for action methods
      - Use `grep` with patterns like: `def (index|show|create|update|destroy)`

6.  **Execute Endpoint Discovery & Update (In Memory):**
    * Initialize empty lists: `new_endpoints_list` and `new_flow_checklist`.
    * Initialize a counter for endpoints found.
    * For each pending file/directory:
        * **If it's a directory:** Use `glob_file_search` to find relevant files (e.g., `*.cs`, `*.js`, `*.py`, `*.java`, `*.go`).
        * **If it's a file:** Read it directly.
        * **If file/directory doesn't exist:** Mark as `[E]` (error) in memory and continue.
        * Scan the file(s) for route definitions using the framework-specific patterns above.
        * For each endpoint found:
            * Extract HTTP method (GET, POST, PUT, DELETE, PATCH, etc.)
            * Extract route path (e.g., `/api/users`, `/api/users/:id`)
            * Extract handler/function name if identifiable
            * Try to identify API versioning (e.g., `/api/v1/users`, `/v2/api/users`)
            * Try to identify endpoint category (public/internal/admin) based on path patterns or authentication requirements
            * Format: `* [METHOD] [path] - ([handler/function])` (e.g., `* GET /api/users - (UsersController.GetAll)`)
            * Add to `new_endpoints_list`.
            * Add `* [ ] [METHOD] [path]` to `new_flow_checklist`.
            * Increment endpoint counter.
        * **Update discovery checklist item status from `[ ]` to `[x]` (in memory).**

7.  **Handle Empty Results:**
    * **If no endpoints found after scanning all locations:**
        * Add a note to `new_endpoints_list`: `* No endpoints found. This may be a library, CLI tool, or non-API project.`
        * Add a note under `## Checklist: Endpoint Flow Investigation`: `* No endpoints to analyze.`
        * Still mark discovery checklist items as `[x]` (scanning was completed).

## PART C: Write Results

9.  **Write Results to `CURSOR-ONBOARDING.md` (Parallel-Safe):**
    * Read the original `.cursor/CURSOR-ONBOARDING.md` content again (to get the latest state from any parallel sessions).
    
    * **For Core Files:**
        * **Append** the `new_file_summaries` under the `## Key Project Files` heading.
          - If the section already has content, add a separator line first: `---`
          - **Do not overwrite existing summaries** - append only new ones
        * **Update** the `## Checklist: Core File Analysis` section:
          - Show `[x]` for completed tasks
          - Show `[E]` for error tasks (with reason)
          - Keep `[ ]` for any remaining pending tasks
          - **Preserve** any tasks that were completed by other parallel sessions
    
    * **For Endpoints:**
        * **Append** the `new_endpoints_list` under the `## Application Endpoints` heading.
          - If the section already has content, add a separator line first: `---`
          - Format endpoints in a clear list structure.
          - **Do not overwrite existing endpoints** - append only new ones
        * **Append** the `new_flow_checklist` under the `## Checklist: Endpoint Flow Investigation` heading.
          - If the section already has content, add a separator line first: `---`
          - **Do not overwrite existing checklist items** - append only new ones
        * **Update** the `## Checklist: Endpoint Discovery` section:
          - Show `[x]` for completed tasks
          - Show `[E]` for error tasks (with reason)
          - Keep `[ ]` for any remaining pending tasks
          - **Preserve** any tasks that were completed by other parallel sessions
    
    * Write this *updated* content to `.cursor/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

10. **Update Step Completion Status:**
    * Read `.cursor/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 2 - Analyze Core Files & Discover Endpoints" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 2 marked as complete.
    * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.

11. **Completion:**
    * Report completion status:
      - Number of core files successfully analyzed
      - Number of core files that couldn't be found (if any)
      - Number of endpoint discovery locations scanned
      - Total number of endpoints found
      - Number of errors encountered (if any)
    * **Note:** This step is complete. Other steps can now be run independently or in parallel:
      - `/03-analyze-endpoint-flows` - Document endpoint flows (can run in parallel)
      - `/04-analyze-architecture` - Analyze architecture (can run in parallel)
      - Other steps can also run independently

**Proceed with all steps above (Parts A, B, and C).**
