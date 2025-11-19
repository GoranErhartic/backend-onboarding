---
title: "09 - Analyze Code Structure"
description: "Analyze code patterns, conventions, dependencies, and structure - helps AI agents understand code organization"
author: "Goran Erhartic"
---

Analyze the codebase to identify common patterns, anti-patterns, code conventions, architectural decisions, and component dependencies. This comprehensive analysis helps AI agents understand coding standards, best practices, and component interdependencies used in the project.

**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.

EXECUTION PLAN:

## PART A: Code Patterns & Conventions

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 9 - Analyze Code Structure" as `[P]` (in progress).
        * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

2.  **Read Master File:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Review stack analysis and architecture documentation to understand the project structure.

3.  **Identify Naming Conventions:**
    * Use `codebase_search` with queries:
      - "What naming conventions are used for classes, methods, and variables?"
      - "How are files and directories named?"
    * Use `grep` to analyze naming patterns:
      - Class names: `class [A-Z]`
      - Method names: `function [a-z]|def [a-z]|public [A-Z]`
      - Variable names: `[a-z][a-zA-Z0-9]* =`
      - File naming patterns
    * Document:
      - Class naming (PascalCase, camelCase, snake_case, etc.)
      - Method naming conventions
      - Variable naming conventions
      - File naming conventions
      - Directory structure conventions

4.  **Identify Common Patterns:**
    * Use `codebase_search` to find patterns:
      - Query: "What design patterns are commonly used in this codebase?"
      - Query: "How are services typically structured?"
      - Query: "How are controllers typically structured?"
      - Query: "How is dependency injection used?"
    * Look for specific patterns using `grep`:
      - **Repository Pattern:** `Repository|IRepository`
      - **Factory Pattern:** `Factory|Create|Builder`
      - **Strategy Pattern:** `IStrategy|Strategy`
      - **Observer Pattern:** `Observer|Event|Subscribe`
      - **Singleton Pattern:** `getInstance|Singleton`
      - **Dependency Injection:** `AddScoped|AddSingleton|@Injectable|@Inject`
    * Document:
      - Common design patterns used
      - Pattern implementations
      - Pattern variations

5.  **Identify Anti-Patterns:**
    * Use `codebase_search` to find potential anti-patterns:
      - Query: "Are there any code smells or anti-patterns in this codebase?"
      - Query: "Where is business logic placed? In controllers or services?"
      - Query: "How are exceptions handled? Are there empty catch blocks?"
    * Look for common anti-patterns:
      - **God Object:** Large classes with too many responsibilities
      - **Spaghetti Code:** Complex, tangled control flow
      - **Magic Numbers:** Hard-coded values without constants
      - **Code Duplication:** Repeated code blocks
      - **Tight Coupling:** High interdependencies
      - **Business Logic in Controllers:** Logic that should be in services
      - **Empty Catch Blocks:** `catch { }` or `except: pass`
      - **Long Methods:** Methods with excessive lines
    * Document:
      - Anti-patterns found (if any)
      - Locations where they occur
      - Impact assessment

6.  **Identify Code Organization Patterns:**
    * Analyze directory structure:
      - How are features/modules organized?
      - How are layers separated?
      - How are shared/common code organized?
    * Document:
      - Directory structure patterns
      - File organization patterns
      - Module boundaries

7.  **Identify Error Handling Patterns:**
    * Use `codebase_search`:
      - Query: "How are errors and exceptions handled consistently?"
    * Use `grep` to find error handling:
      - `try-catch|try/except|defer|recover`
      - `throw|raise|panic|error`
      - `ErrorHandler|ExceptionHandler`
    * Document:
      - Error handling patterns
      - Exception types used
      - Error propagation patterns

8.  **Identify Testing Patterns:**
    * Review test files (if available):
      - Test organization patterns
      - Test naming conventions
      - Mocking patterns
      - Test data management
    * Document:
      - Testing patterns used
      - Test structure conventions

9.  **Identify API Design Patterns:**
    * Review endpoint implementations:
      - Request/response patterns
      - Validation patterns
      - Error response patterns
      - Pagination patterns
      - Filtering/sorting patterns
    * Document:
      - API design conventions
      - Common API patterns

10. **Identify Data Access Patterns:**
    * Use `codebase_search`:
      - Query: "How is data accessed? What patterns are used for database queries?"
    * Document:
      - Data access patterns (Repository, Active Record, etc.)
      - Query patterns
      - Transaction patterns

## PART B: Dependency Analysis

11. **Read Master File and Documentation:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Read `.cursor/onboarding-docs/ARCHITECTURE.md` (if exists).
    * Read `.cursor/onboarding-docs/INTEGRATIONS.md` (if exists).
    * Review core files analysis from `CURSOR-ONBOARDING.md`.

12. **Analyze Component Dependencies:**
    * Use `codebase_search` to understand dependencies:
      - Query: "What are the dependencies between modules and components?"
      - Query: "How do services depend on each other?"
      - Query: "What external dependencies does this project have?"
    * Analyze import/using statements:
      - Use `grep` to find imports: `import|using|require|from`
      - Map internal dependencies (between project files)
      - Map external dependencies (to libraries/packages)
    * Review dependency files:
      - `package.json`, `requirements.txt`, `.csproj`, etc.
      - Extract external package dependencies

13. **Map Service Dependencies:**
    * Identify service classes/interfaces.
    * Map service-to-service dependencies:
      - Which services depend on which other services
      - Service dependency chains
      - Circular dependencies (if any)
    * Document:
      - Service dependency graph
      - Dependency direction
      - Circular dependencies

14. **Map Data Model Dependencies:**
    * Review data models from `.cursor/onboarding-docs/DATA_MODELS.md` (if exists).
    * Map entity relationships:
      - Foreign key relationships
      - Navigation properties
      - Entity dependencies
    * Document:
      - Entity relationship graph
      - Data dependencies

15. **Map Endpoint Dependencies:**
    * Review endpoint documentation files (`CURSOR_*.md`).
    * Map endpoint dependencies:
      - Which endpoints call which services
      - Which endpoints depend on which data models
      - Which endpoints call external APIs
    * Document:
      - Endpoint-to-service dependencies
      - Endpoint-to-model dependencies
      - Endpoint-to-external dependencies

16. **Map External Dependencies:**
    * Review integrations documentation.
    * Map external service dependencies:
      - Which components depend on which external APIs
      - Which components depend on which third-party services
      - External dependency usage patterns
    * Document:
      - External API dependencies
      - Third-party service dependencies

## PART C: Generate Documentation

17. **Generate Code Patterns Documentation:**
    * Create `.cursor/onboarding-docs/CODE_PATTERNS.md` with the following structure:

      ```markdown
      # Code Patterns & Conventions
      
      > **Generated:** [Current Date/Time]
      > **Purpose:** Document common patterns, conventions, and anti-patterns for AI agent reference
      
      ## Naming Conventions
      
      ### Classes
      - **Pattern:** [PascalCase/camelCase/etc.]
      - **Examples:** [examples from codebase]
      
      ### Methods/Functions
      - **Pattern:** [camelCase/snake_case/etc.]
      - **Examples:** [examples]
      
      ### Variables
      - **Pattern:** [camelCase/snake_case/etc.]
      - **Examples:** [examples]
      
      ### Files & Directories
      - **Pattern:** [conventions]
      - **Examples:** [examples]
      
      ## Common Design Patterns
      
      ### [Pattern Name]
      - **Purpose:** [why it's used]
      - **Implementation:** [how it's implemented]
      - **Examples:** [file locations or code snippets]
      - **When to Use:** [guidelines]
      
      [Repeat for each pattern]
      
      ## Code Organization Patterns
      
      ### Directory Structure
      [Describe directory organization patterns]
      
      ### File Organization
      [Describe file organization patterns]
      
      ### Module Boundaries
      [Describe module organization]
      
      ## Error Handling Patterns
      
      ### Exception Types
      [List exception types and when to use them]
      
      ### Error Handling Flow
      [Describe error handling flow]
      
      ### Error Response Patterns
      [Describe error response patterns]
      
      ## API Design Patterns
      
      ### Request Patterns
      [Describe request patterns]
      
      ### Response Patterns
      [Describe response patterns]
      
      ### Validation Patterns
      [Describe validation patterns]
      
      ## Data Access Patterns
      
      ### Query Patterns
      [Describe query patterns]
      
      ### Transaction Patterns
      [Describe transaction patterns]
      
      ## Testing Patterns
      
      ### Test Organization
      [Describe test organization]
      
      ### Mocking Patterns
      [Describe mocking patterns]
      
      ## Anti-Patterns & Code Smells
      
      ### [Anti-Pattern Name]
      - **Description:** [what it is]
      - **Impact:** [why it's problematic]
      - **Locations:** [where it occurs, if any]
      - **Recommendation:** [how to fix]
      
      [Repeat for each anti-pattern found]
      
      ## Best Practices Observed
      
      [List best practices observed in the codebase]
      
      ## Code Style Guidelines
      
      [Document code style guidelines inferred from the codebase]
      
      ## AI Agent Guidelines
      
      ### When Adding New Code
      - Follow naming conventions: [guidelines]
      - Use patterns: [list patterns to use]
      - Avoid: [list anti-patterns to avoid]
      - Organize: [organization guidelines]
      
      ### When Modifying Existing Code
      - Maintain consistency with existing patterns
      - Follow established conventions
      - Respect module boundaries
      
      ## Notes
      [Any additional observations about code patterns]
      ```

18. **Generate Dependency Graph Documentation:**
    * Create `.cursor/onboarding-docs/DEPENDENCY_GRAPH.md` with the following structure:

      ```markdown
      # Dependency Graph
      
      > **Generated:** [Current Date/Time]
      > **Purpose:** Visual representation of component dependencies for AI agent reference
      
      ## Overview
      
      [Brief description of dependency structure]
      
      ## Dependency Types
      
      ### Internal Dependencies
      - Service-to-Service
      - Controller-to-Service
      - Service-to-Repository
      - Model-to-Model
      
      ### External Dependencies
      - Third-party libraries
      - External APIs
      - Infrastructure services
      
      ## Service Dependency Graph
      
      ### Text-Based Graph
      ```
      [Service1] --> [Service2]
      [Service2] --> [Service3]
      [Service1] --> [Service3]
      ```
      
      ### Detailed Service Dependencies
      
      #### [Service Name]
      - **Depends On:**
        - [Service1] - [reason]
        - [Service2] - [reason]
      - **Used By:**
        - [Service3]
        - [Controller1]
      
      [Repeat for each service]
      
      ## Module Dependencies
      
      ### [Module Name]
      - **Depends On Modules:**
        - [Module1]
        - [Module2]
      - **Provides To Modules:**
        - [Module3]
      
      [Repeat for each module]
      
      ## Data Model Dependencies
      
      ### Entity Relationships
      ```
      [Entity1] --1:N--> [Entity2]
      [Entity2] --N:1--> [Entity3]
      ```
      
      ### Foreign Key Dependencies
      - **[Entity1]** depends on **[Entity2]** via [foreign key]
      
      [List all foreign key dependencies]
      
      ## Endpoint Dependencies
      
      ### [Endpoint] [METHOD] [Path]
      - **Services Used:** [list services]
      - **Models Used:** [list models]
      - **External APIs:** [list external APIs]
      
      [Repeat for each endpoint]
      
      ## External Dependencies
      
      ### Third-Party Libraries
      | Library | Version | Used By | Purpose |
      |---------|---------|---------|---------|
      | [lib] | [ver] | [components] | [purpose] |
      
      ### External APIs
      | API | Used By | Purpose |
      |-----|---------|---------|
      | [API] | [components] | [purpose] |
      
      ## Circular Dependencies
      
      [List any circular dependencies found, if any]
      
      ## Dependency Layers
      
      ### Layer Hierarchy
      ```
      Presentation Layer
        ↓ depends on
      Business Layer
        ↓ depends on
      Data Layer
        ↓ depends on
      Infrastructure Layer
      ```
      
      ## Critical Dependencies
      
      [List critical dependencies that many components rely on]
      
      ## Dependency Impact Analysis
      
      ### High-Impact Components
      [Components that many other components depend on]
      
      ### Isolated Components
      [Components with minimal dependencies]
      
      ## Dependency Metadata (JSON)
      
      ```json
      {
        "services": [
          {
            "name": "[ServiceName]",
            "dependencies": ["Service1", "Service2"],
            "dependents": ["Service3", "Controller1"]
          }
        ],
        "modules": [
          {
            "name": "[ModuleName]",
            "dependencies": ["Module1"],
            "dependents": ["Module2"]
          }
        ],
        "external": [
          {
            "type": "library|api|service",
            "name": "[Name]",
            "usedBy": ["Component1", "Component2"]
          }
        ]
      }
      ```
      
      ## AI Agent Usage Guidelines
      
      ### When Modifying Components
      - Check dependencies before modifying shared components
      - Understand impact of changes on dependent components
      - Consider breaking changes to dependencies
      
      ### When Adding New Components
      - Follow existing dependency patterns
      - Avoid circular dependencies
      - Document new dependencies
      
      ## Notes
      [Any additional observations about dependencies]
      ```

19. **Generate Dependency Metadata File:**
    * Create `.cursor/onboarding-docs/DEPENDENCY_METADATA.json` with structured dependency data:
      - Service dependencies (graph structure)
      - Module dependencies
      - External dependencies
      - Endpoint dependencies
      - Data model dependencies

20. **Update Master File (Parallel-Safe):**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Find the `## Code Patterns & Conventions` section and update with:
      ```markdown
      ## Code Patterns & Conventions
      See [CODE_PATTERNS.md](.cursor/onboarding-docs/CODE_PATTERNS.md) for detailed code patterns and conventions documentation.
      
      **Naming Conventions:** [Brief summary]
      **Common Patterns:** [List main patterns]
      **Anti-Patterns Found:** [Count or brief description]
      ```
    * Find the `## Dependency Graph` section and update with:
      ```markdown
      ## Dependency Graph
      See [DEPENDENCY_GRAPH.md](.cursor/onboarding-docs/DEPENDENCY_GRAPH.md) for detailed dependency relationships.
      See [DEPENDENCY_METADATA.json](.cursor/onboarding-docs/DEPENDENCY_METADATA.json) for structured dependency data.
      
      **Total Services:** [count]
      **Total Modules:** [count]
      **External Dependencies:** [count]
      **Circular Dependencies:** [count or "None"]
      ```
    * Write the updated content to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

21. **Update Step Completion Status:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 9 - Analyze Code Structure" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 9 marked as complete.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

22. **Completion:**
    * Report completion status:
      - Naming conventions identified
      - Common patterns identified
      - Anti-patterns found (if any)
      - Code organization patterns documented
      - Services mapped
      - Modules mapped
      - External dependencies mapped
      - Circular dependencies found (if any)
      - Dependency graph generated

**Proceed with all steps above (Parts A, B, and C).**

