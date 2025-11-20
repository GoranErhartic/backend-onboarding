---
title: "03 - Analyze Endpoint Flows"
description: "Analyze Endpoint Flows - documents complete request/response flow for each endpoint"
author: "Goran Erhartic"
---

Analyze pending endpoint flows from the 'Endpoint Flow Investigation' checklist.
**This step can be run independently or in parallel with other steps.**
This prompt is parallel-safe and can be run multiple times or in parallel sessions.
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* Tasks are claimed by marking them as `[P]` (in progress) before processing.

**Status Legend:**
- `[ ]` = Pending (not started)
- `[P]` = In Progress (claimed by a session) - **May become stuck if agent crashes/interrupts**
- `[x]` = Complete (analysis finished)
- `[E]` = Error (analysis failed - will be documented)

**Stuck Task Recovery:**
- If a `[P]` task has a corresponding document file, it was completed but not marked - automatically recover it.
- If a `[P]` task has no document file and no `[ ]` tasks remain, it's stuck - reclaim it.

**FAIL-FAST CHECK - MANDATORY:**
* **BEFORE PROCEEDING:** Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
* **If the file does NOT exist:**
  * **STOP IMMEDIATELY** and report the following error message:
    ```
    ❌ ERROR: Onboarding initialization required
    
    The file `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` was not found.
    This file is created by the initialization command and is required for all analysis steps.
    
    Please run the initialization command first:
    /onboarding/initialize
    
    This will set up the onboarding structure and perform initial project mapping.
    ```
  * **DO NOT proceed with any other steps.**
* **If the file exists:** Continue with the execution plan below.

EXECUTION PLAN:

**CRITICAL: MANDATORY RECURSIVE LOOP**
**This process MUST repeat steps 1-4 continuously until ALL `[ ]` tasks are completed.**
**DO NOT STOP after processing a few endpoints. DO NOT report a summary and stop.**
**The ONLY valid stopping condition is when step 1 finds ZERO `[ ]` tasks remaining.**

**Start of Loop:**

**Session Tracking:**
* Initialize an empty list `session_completed_endpoints` to track endpoints completed in this session.
* This list will be used only at the end to report what was accomplished.

1.  **Check for Endpoint Checklist:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Find the `## Checklist: Endpoint Flow Investigation` section.
    * **If checklist doesn't exist or is empty:**
        * Check if `## Application Endpoints` section exists and has endpoints listed.
        * **If endpoints exist:** Create the flow investigation checklist from the endpoints list.
        * **If no endpoints exist:** 
            * Discover endpoints inline (see Step 2 endpoint discovery logic):
              - Identify stack from dependency files or existing stack analysis
              - Scan for endpoints using framework-specific patterns
              - Create endpoint list in `## Application Endpoints` section
              - Create flow investigation checklist from discovered endpoints
            * **Note:** This allows Step 3 to run independently even if Step 2 hasn't been run.

3.  **Find and Claim Task (with Stuck Task Recovery):**
    * Find the `## Checklist: Endpoint Flow Investigation` section (should exist now).
    * Collect **all** tasks marked `[ ]` (pending, not claimed).
    * Collect **all** tasks marked `[P]` (in progress, potentially stuck).
    * Count how many `[ ]` tasks remain.
    * Count how many `[P]` tasks exist.
    
    * **Check for Stuck `[P]` Tasks (Recovery Logic):**
        * For each `[P]` task, determine the expected document filename:
            * Extract METHOD and path from the task (e.g., `PUT /accounts/{accountId:guid}/Subscriptions/{subscriptionId:guid}/validity`).
            * Sanitize the path: Replace `/` with `_`, `{` with `_`, `}` with `_`, `:` with `_`, remove any special characters.
            * Format: `CURSOR_[METHOD]_[sanitized_path].md`
            * Example: `PUT /accounts/{accountId:guid}/Subscriptions/{subscriptionId:guid}/validity` → `CURSOR_PUT_accounts_accountId_guid_Subscriptions_subscriptionId_guid_validity.md`
        * Use `glob_file_search` or `list_dir` to check if the document file exists in `.cursor/onboarding-docs/` directory.
        * **If `[P]` task has a document file:**
            * This means the task was completed but not marked as `[x]` (likely due to agent crash/interruption).
            * **Recover it:** Re-write `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, changing that `[P]` line to `[x]`.
            * Extract the endpoint info (METHOD and path) and add to `session_completed_endpoints` with note "(recovered)".
            * Report briefly: "Recovered completed task: [METHOD] [path]"
            * **Continue to step 1** (loop back) to check for more tasks.
        * **If `[P]` task has NO document file:**
            * This is a potentially stuck task (claimed but never completed).
            * **If there are `[ ]` tasks available:** Leave `[P]` tasks alone (they may still be in progress by another session).
            * **If there are NO `[ ]` tasks but `[P]` tasks exist:** These are stuck - reclaim the first one by changing `[P]` to `[ ]`, then proceed to claim it normally.
    
    * **After recovery, re-read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`** to get updated state.
    * Re-collect all tasks marked `[ ]` (pending, not claimed).
    * Re-count how many `[ ]` tasks remain.
    
    * **If no `[ ]` task is found (count is 0):**
        * Check if there are any remaining `[P]` tasks (after recovery).
        * **If `[P]` tasks still exist:** These are stuck tasks with no document files. Reclaim the first one by changing `[P]` to `[ ]`, then proceed to claim it.
        * **If only `[x]` or `[E]` tasks exist:**
            * **Generate Final Summary Report:**
                * Report "All endpoint flows have been analyzed. Onboarding complete!"
                * **Update Step Completion Status:**
                    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
                    * **Update the Step Completion Status section** to mark "Step 3 - Document Endpoint Flows" as `[x]` (complete).
                    * If the Step Completion Status section doesn't exist, add it with Step 3 marked as complete.
                    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
                * **If `session_completed_endpoints` is not empty:**
                    * Report: "Endpoints completed in this session:"
                    * List each endpoint in `session_completed_endpoints` with format:
                      - `[METHOD] [path] → [filename]` (for successfully completed)
                      - `[METHOD] [path] → [filename] (recovered)` (for recovered tasks)
                      - `[METHOD] [path] → ERROR: [error reason]` (for error cases)
                    * Count and report: "Total endpoints processed: [count]"
                * **If `session_completed_endpoints` is empty:** Report "No new endpoints were completed in this session (all were already done)."
            * **ONLY NOW is it valid to stop execution.**
    
    * **If tasks found (count > 0):**
        * **Select a random task** from the list of `[ ]` tasks (do NOT always pick the first one).
        * **Rationale:** Random selection distributes work across parallel sessions, reducing contention when multiple sessions run simultaneously.
        * **"Claim" it immediately:** Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again, find the exact line for the selected task, and re-write the file changing ONLY that one line from `[ ]` to `[P]`.
        * **This atomic claim operation prevents race conditions in parallel execution.**
        * Note the claimed endpoint for analysis (e.g., "GET /api/users").

4.  **Perform Analysis (on Claimed Task):**
    * Conduct a detailed investigation for the *claimed* endpoint.
    * Use `codebase_search` with optimized queries for AI agents:
      - Query: "Where is the [METHOD] [path] endpoint handler implemented?"
      - Query: "What is the complete request flow for [METHOD] [path] endpoint?"
      - Query: "What business logic is executed in [METHOD] [path] endpoint?"
      - Query: "What data models are used by [METHOD] [path] endpoint?"
      - Query: "What external services or dependencies does [METHOD] [path] endpoint call?"
    * Use `grep` to find specific route definitions and handler functions:
      - Search for route patterns matching the endpoint path
      - Find handler method/function names
      - Locate middleware configurations
    * **Analysis must include:**
        * **Primary Handler:** Controller/function name and location
        * **Route Details:** Full path, HTTP method, route parameters, query parameters
        * **Request Flow:**
          - Entry point (controller/handler)
          - Middleware chain (authentication, authorization, logging, etc.)
          - Request validation
        * **Business Logic:**
          - Service layer calls
          - Business rules applied
          - Data transformations
        * **Data Layer:**
          - Database queries (if applicable)
          - Data models/schemas used
          - ORM/query builder usage
        * **Response Handling:**
          - Success response format and status codes
          - Error handling and error response formats
          - Response serialization
        * **Dependencies:**
          - External services called
          - Other endpoints or functions called
          - Configuration used

5.  **Generate Individual Flow Document:**
    * Create a *separate* Markdown file in the `.cursor/onboarding-docs/` directory.
    * **File Naming Convention:**
      - Sanitize the endpoint path: Replace `/` with `_`, `:` with `_`, `?` with `_`, remove leading/trailing slashes
      - Format: `CURSOR_[METHOD]_[sanitized_path].md`
      - Examples:
        - `GET /api/users` → `CURSOR_GET_api_users.md`
        - `POST /api/users/:id/activate` → `CURSOR_POST_api_users_id_activate.md`
        - `GET /api/search?q=term` → `CURSOR_GET_api_search.md`
    * **Document Structure:**
      ```markdown
      # [METHOD] [Full Path]
      
      ## Overview
      [Brief description of what this endpoint does]
      
      ## Route Details
      - **Method:** [HTTP Method]
      - **Path:** [Full path with parameters]
      - **Handler:** [Controller/Function name and file location]
      
      ## Request Flow
      ### Entry Point
      [Handler location and signature]
      
      ### Middleware
      [List of middleware applied, in order]
      
      ### Request Validation
      [Validation rules and schemas]
      
      ## Business Logic
      [Service layer calls and business rules]
      
      ## Data Layer
      ### Database Interactions
      [Queries, models, ORM usage]
      
      ### Data Models
      [Schemas and data structures]
      
      ## Dependencies
      [External services, other endpoints, configuration]
      
      ## Response Handling
      ### Success Response
      - **Status Code:** [e.g., 200, 201]
      - **Format:** [Response structure]
      
      ### Error Responses
      [Error scenarios and response formats]
      
      ## Notes
      [Any additional observations or important details]
      
      ## AI Reference Metadata
      ```json
      {
        "endpoint": "[METHOD] [path]",
        "handler": "[handler location]",
        "layer": "[Presentation/Business/Data]",
        "dependencies": ["dep1", "dep2"],
        "tags": ["#api", "#authentication", "#crud", etc.]
      }
      ```
      ```
    * Write all findings from Step 4 into this file.

6.  **Mark Task as Complete:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state).
    * Find the line for your claimed task (should be marked `[P]`).
    * **If the line is still `[P]`:** 
        * Re-write the file, changing that line from `[P]` to `[x]`.
        * Add this endpoint to `session_completed_endpoints` list: `[METHOD] [path] → [filename]`
        * Report success briefly: "Completed: [METHOD] [path] → [filename]"
    * **If the line is already `[x]`:** Another session may have completed it. Report this briefly and **IMMEDIATELY proceed to step 3** (do not stop).
    * **If the line is back to `[ ]`:** This shouldn't happen, but if it does, report an error briefly and **IMMEDIATELY proceed to step 3** (do not stop).
    * **CRITICAL: After reporting success, you MUST immediately proceed to step 3** to find and claim the next pending task.
    * **DO NOT stop here. DO NOT report a summary. DO NOT tell the user to run the command again.**
    * **Continue the loop immediately.**

7.  **Error Handling:**
    * **If analysis fails** (e.g., endpoint not found, code unreadable):
        * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again.
        * Find the `[P]` task line.
        * Change it to `[E]` and add a note: `* [E] [METHOD] [path] - [Error reason]`
        * Create a minimal document file noting the error: `CURSOR_[METHOD]_[sanitized_path].md` with content explaining the failure.
        * Add this endpoint to `session_completed_endpoints` list: `[METHOD] [path] → ERROR: [error reason]`
        * Report the error briefly: "Error: [METHOD] [path] - [Error reason]"
        * **CRITICAL: After reporting error, you MUST immediately proceed to step 3** to find and claim the next pending task.
        * **DO NOT stop here. Continue the loop immediately.**

8.  **Context Window Management:**
    * **If context window is running low during analysis:**
        * Complete the current task (steps 2-4).
        * Report completion.
        * **Instruct the user:** "Context window is running low. Please open a new session in a new tab and run `/onboarding/analyze-endpoint-flows` again to continue analyzing remaining endpoints."
        * Exit the loop (user will restart manually).

**MANDATORY LOOP INSTRUCTIONS - READ CAREFULLY:**

**CRITICAL RULES:**
1. After completing step 6 (task marked as `[x]`), you **MUST IMMEDIATELY** proceed to step 3 without stopping.
2. After handling an error in step 7, you **MUST IMMEDIATELY** proceed to step 3 without stopping.
3. **DO NOT** report progress summaries mid-loop (e.g., "Completed X endpoints, Y remaining").
4. **DO NOT** tell the user to "run the command again" while there are still `[ ]` tasks.
5. **DO NOT** stop after processing a few endpoints - continue until ALL are done.
6. Continue this recursive loop **continuously** until step 3 finds **ZERO** `[ ]` tasks remaining.
7. **ONLY** stop when step 3 reports "All endpoint flows have been analyzed. Onboarding complete!"
8. When you finally stop (all tasks done), step 3 will automatically generate a final summary report listing all endpoints completed in this session.

**The loop structure is:**
```
Step 3 → Step 4 → Step 5 → Step 6 → [CHECK: Are there more `[ ]` tasks?]
  ↓ YES (there are more)                    ↓ NO (all done)
  [Go back to Step 3]                    [Stop and report completion]
```

**Proceed with the mandatory recursive loop (steps 3-6) continuously until ALL tasks are complete.**
