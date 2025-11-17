---
title: "04 - Analyze Architecture, Data Models & Security"
description: "Analyze Architecture, Data Models & Security - can run in parallel with other analysis steps"
author: "Goran Erhartic"
---

Analyze the project's architecture, design patterns, data models, database schema, authentication mechanisms, and authorization patterns.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: Architecture & Design Patterns

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 4 - Architecture, Data Models & Security" as `[P]` (in progress).
        * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/01-initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/initialize-onboarding` first.

2.  **Read Master File:**
    * Read `.cursor/CURSOR-ONBOARDING.md`.
    * Review the stack analysis and key project files sections to understand the project structure (if available).
    * **Note:** If stack analysis is not yet available, proceed with analysis - this step can discover the stack independently.

3.  **Identify Architectural Patterns:**
    * Use `codebase_search` with optimized queries for AI agents:
      - Query: "What architectural pattern is used in this project? MVC, Clean Architecture, Hexagonal Architecture, etc."
      - Query: "How are the layers organized in this codebase? What is the layer structure?"
      - Query: "What is the overall architecture of this application? How is the codebase structured?"
      - Query: "What is the separation of concerns between presentation, business, and data layers?"
    * Look for common architectural indicators:
      - **MVC:** Controllers, Models, Views separation
      - **Clean Architecture:** Domain, Application, Infrastructure layers
      - **Hexagonal Architecture:** Ports and Adapters pattern
      - **Microservices:** Multiple independent services
      - **Layered Architecture:** Presentation, Business, Data layers
      - **Onion Architecture:** Core, Application, Infrastructure layers
    * Read key files identified in Step 2 to understand structure:
      - Entry point files (Program.cs, main.py, etc.)
      - Directory structure from PROJECT_MAP.txt
      - Key service/controller files

3.  **Identify Design Patterns:**
    * Use `codebase_search` and `grep` to identify common design patterns:
      - **Repository Pattern:** Search for "Repository" classes/interfaces using `grep` pattern: `class.*Repository|interface.*Repository`
      - **Factory Pattern:** Search for "Factory" classes using `grep` pattern: `class.*Factory|Factory.*create`
      - **Strategy Pattern:** Search for strategy interfaces/implementations using `grep` pattern: `IStrategy|Strategy.*interface|implements.*Strategy`
      - **Observer Pattern:** Search for event handlers, observers using `grep` pattern: `Observer|EventListener|subscribe|publish`
      - **Singleton Pattern:** Search for singleton implementations using `grep` pattern: `getInstance|Singleton`
      - **Dependency Injection:** Search for DI container usage, constructor injection using `grep` pattern: `AddScoped|AddSingleton|AddTransient|@Injectable|@Inject`
      - **Service Locator:** Search for service locator patterns using `grep` pattern: `ServiceLocator|GetService|Resolve`
      - **Builder Pattern:** Search for builder classes using `grep` pattern: `Builder|\.build\(\)|\.with\(\)`
      - **Adapter Pattern:** Search for adapter classes using `grep` pattern: `Adapter|adapt|Adapt`
      - **Decorator Pattern:** Search for decorator usage using `grep` pattern: `@Decorator|Decorator|decorate`
    * For each pattern found:
      - Identify where it's used
      - Document its purpose in the codebase
      - Note any variations or custom implementations

4.  **Map Layer Organization:**
    * Based on directory structure and code analysis:
      - Identify presentation layer (Controllers, Views, API endpoints)
      - Identify business/service layer (Services, Use Cases, Domain Services)
      - Identify data layer (Repositories, Data Access, ORM)
      - Identify infrastructure layer (External services, Configuration)
    * Document the flow between layers:
      - How requests flow from presentation to data layer
      - How dependencies are injected
      - How layers communicate

5.  **Analyze Module/Component Boundaries:**
    * Identify major modules or components:
      - Feature-based modules (User module, Order module, etc.)
      - Technical modules (Authentication, Payment, Notification, etc.)
    * Document:
      - Module boundaries
      - Inter-module dependencies
      - Shared/common modules
      - Module communication patterns

6.  **Document Dependency Flow:**
    * Analyze dependency direction:
      - Which layers depend on which layers
      - Dependency injection configuration
      - Circular dependencies (if any)
    * Document:
      - Dependency graph (text-based)
      - Dependency injection patterns
      - Service registration

## PART B: Data Models & Database Schema

7.  **Identify Model/Entity Locations:**
    * Based on stack analysis, identify likely locations for models/entities:
      - **ASP.NET Core:** `Models/`, `Entities/`, `Domain/`, files with `DbContext`
      - **Python/Django:** `models.py`, `models/` directory
      - **Python/SQLAlchemy:** Files with SQLAlchemy models
      - **Node.js/TypeORM:** `entities/`, `models/` directories
      - **Java/Spring:** `entity/`, `model/` packages, JPA annotations
      - **Go:** `models/`, `entities/` directories
    * Use `glob_file_search` to find model files:
      - Search for common patterns: `*Model*.cs`, `*Entity*.cs`, `models.py`, `*entity*.java`, etc.
    * Use `codebase_search` with queries like:
      - "Where are the data models or entities defined?"
      - "Where is the database schema defined?"

8.  **Analyze Entity/Model Definitions:**
    * Read identified model/entity files.
    * For each entity/model:
      - Extract entity name
      - Extract properties/fields
      - Extract relationships (foreign keys, navigation properties)
      - Extract validation rules/constraints
      - Extract indexes (if defined in code)
      - Extract data annotations/attributes

9.  **Map Relationships:**
    * Identify relationship types:
      - One-to-One relationships
      - One-to-Many relationships
      - Many-to-Many relationships
    * Document:
      - Parent-child relationships
      - Foreign key relationships
      - Join tables (for many-to-many)
      - Cascade delete rules

10. **Analyze Database Schema:**
    * If migration files exist:
      - **ASP.NET Core:** `Migrations/` directory
      - **Django:** `migrations/` directory
      - **Rails:** `db/migrate/` directory
      - **Laravel:** `database/migrations/` directory
    * Read migration files to understand:
      - Table structures
      - Indexes
      - Constraints (primary keys, foreign keys, unique constraints)
      - Default values
      - Column types and sizes
    * If no migrations, analyze model definitions to infer schema.

11. **Identify Data Access Patterns:**
    * Use `codebase_search` to find:
      - Repository pattern implementations
      - Unit of Work pattern
      - Data access layer organization
      - Query patterns (LINQ, SQL, ORM queries)
    * Document:
      - How data is accessed
      - CRUD operation patterns
      - Query optimization strategies
      - Transaction handling

12. **Document Validation Rules:**
    * Extract validation rules from:
      - Data annotations/attributes
      - Fluent validation configurations
      - Model validation methods
    * Document:
      - Required fields
      - Field length constraints
      - Format validations (email, phone, etc.)
      - Custom validation rules

## PART C: Authentication & Authorization

13. **Identify Authentication Mechanisms:**
    * Use `codebase_search` to find authentication implementation:
      - Query: "How does authentication work in this application?"
      - Query: "Where is user authentication implemented?"
      - Query: "What authentication mechanism is used? JWT, OAuth, Session-based?"
    * Use `grep` to search for authentication patterns:
      - **JWT:** `JwtBearer|JWT|jwt|JsonWebToken`
      - **OAuth:** `OAuth|oauth|OpenIdConnect`
      - **Session:** `Session|session|ISession`
      - **Basic Auth:** `BasicAuthentication|Authorization: Basic`
      - **API Keys:** `ApiKey|X-API-Key|apikey`
    * Identify authentication middleware/configuration:
      - Authentication middleware registration
      - Token validation logic
      - Login/logout endpoints
      - Password hashing mechanisms

14. **Identify Authorization Patterns:**
    * Use `codebase_search` to find authorization implementation:
      - Query: "How does authorization work? What roles and permissions exist?"
      - Query: "Where are authorization policies defined?"
    * Use `grep` to search for authorization patterns:
      - **RBAC:** `[Authorize(Roles|Role|Policy|Policies`
      - **Policy-based:** `Policy|Requirement|Handler`
      - **Attribute-based:** `[Authorize]|@PreAuthorize|@Secured`
    * Identify:
      - Role definitions
      - Permission/claim structures
      - Authorization policies
      - Authorization handlers

15. **Map Protected Endpoints:**
    * Review endpoint list from Step 2.
    * For each endpoint, identify:
      - Authentication requirements (public/authenticated)
      - Authorization requirements (roles, policies)
      - Permission checks
    * Use `grep` to find authorization attributes on endpoints:
      - `[Authorize]`, `[AllowAnonymous]`, `@PreAuthorize`, `@Secured`, etc.

16. **Analyze Security Configuration:**
    * Read security configuration files:
      - Authentication configuration in startup/entry point files
      - Security middleware configuration
      - CORS configuration
      - HTTPS/SSL configuration
    * Document:
      - Token expiration settings
      - Password requirements
      - Session timeout settings
      - Security headers

17. **Document User Roles and Permissions:**
    * Identify all user roles in the system.
    * For each role, document:
      - Role name and description
      - Permissions/claims associated
      - Endpoints accessible
      - Data access restrictions

## PART D: Generate Documentation

18. **Generate Architecture Documentation:**
    * Create `.cursor/ARCHITECTURE.md` with the following structure:

      ```markdown
      # Architecture Overview

      ## Architectural Pattern
      [Identify and describe the primary architectural pattern used]

      ## Layer Organization
      ### Presentation Layer
      [Description of presentation layer, location, responsibilities]

      ### Business/Service Layer
      [Description of business layer, location, responsibilities]

      ### Data Layer
      [Description of data layer, location, responsibilities]

      ### Infrastructure Layer
      [Description of infrastructure layer, location, responsibilities]

      ## Design Patterns Used

      ### [Pattern Name 1]
      - **Purpose:** [Why this pattern is used]
      - **Location:** [Where it's implemented]
      - **Examples:** [Specific examples in codebase]

      [Repeat for each pattern found]

      ## Module/Component Structure
      [Document major modules and their boundaries]

      ## Dependency Flow
      [Describe how dependencies flow between layers]

      ## Key Architectural Decisions
      [Document any notable architectural decisions or trade-offs]

      ## Notes
      [Any additional observations about the architecture]
      ```

19. **Generate Data Models Documentation:**
    * Create `.cursor/DATA_MODELS.md` with the following structure:

      ```markdown
      # Data Models & Database Schema

      ## Overview
      [Brief description of the data model structure]

      ## Entities/Models

      ### [Entity Name 1]
      - **Table Name:** [Database table name if different]
      - **Purpose:** [What this entity represents]
      - **Properties:**
        - `PropertyName` (Type) - [Description, constraints]
        - [Continue for all properties]
      - **Relationships:**
        - [Relationship type] with [Related Entity] via [Foreign Key/Join Table]
      - **Indexes:** [List indexes if any]
      - **Constraints:** [List constraints if any]
      - **Validation Rules:** [List validation rules]

      [Repeat for each entity]

      ## Entity Relationships

      ### Relationship Diagram (Text-based)
      ```
      [Entity1] --1:N--> [Entity2]
      [Entity2] --N:1--> [Entity3]
      [Entity1] --N:N--> [Entity3] (via [JoinTable])
      ```

      ### Detailed Relationships
      - **[Entity1] → [Entity2]:** [Description of relationship]
      - [Continue for all relationships]

      ## Database Schema

      ### Tables
      [List all tables with their columns and types]

      ### Indexes
      [List all indexes]

      ### Constraints
      [List all constraints: primary keys, foreign keys, unique constraints]

      ## Data Access Patterns

      ### Repository Pattern
      [Document repository implementations if used]

      ### Query Patterns
      [Document common query patterns]

      ### Transaction Handling
      [Document transaction patterns]

      ## Validation Rules Summary
      [Summary of all validation rules across entities]

      ## Notes
      [Any additional observations about the data model]
      ```

20. **Generate Security Documentation:**
    * Create `.cursor/SECURITY.md` with the following structure:

      ```markdown
      # Security Documentation

      ## Authentication

      ### Authentication Mechanism
      [Describe the authentication mechanism used: JWT, OAuth, Session-based, etc.]

      ### Authentication Flow
      [Describe how users authenticate (login process)]

      ### Token Management
      [Describe token generation, validation, refresh, expiration]

      ### Password Handling
      [Describe password hashing, requirements, reset process]

      ## Authorization

      ### Authorization Pattern
      [Describe the authorization pattern: RBAC, ABAC, Policy-based, etc.]

      ### Roles
      [List all roles and their descriptions]

      ### Permissions/Claims
      [List permissions or claims used in the system]

      ### Authorization Policies
      [Document authorization policies if policy-based authorization is used]

      ## Protected Endpoints

      ### Public Endpoints
      [List endpoints that don't require authentication]

      ### Authenticated Endpoints
      [List endpoints that require authentication but no specific role]

      ### Role-Based Endpoints
      [List endpoints grouped by required role]

      ## Security Configuration

      ### Authentication Configuration
      [Document authentication middleware and settings]

      ### CORS Configuration
      [Document CORS settings if applicable]

      ### Security Headers
      [Document security headers configured]

      ## Security Best Practices
      [Document any security best practices observed or recommendations]

      ## Notes
      [Any additional security observations]
      ```

21. **Update Master File (Parallel-Safe):**
    * Read `.cursor/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Find the `## Architecture` section and update with:
      ```markdown
      ## Architecture
      See [ARCHITECTURE.md](.cursor/ARCHITECTURE.md) for detailed architecture documentation.
      
      **Architectural Pattern:** [Brief description]
      **Key Design Patterns:** [List main patterns]
      **Layers:** [List layers identified]
      ```
    * Find the `## Data Models` section and replace with:
      ```markdown
      ## Data Models
      See [DATA_MODELS.md](.cursor/DATA_MODELS.md) for detailed data model documentation.
      
      **Total Entities:** [Number]
      **Key Entities:** [List main entities]
      **Data Access Pattern:** [Repository, Active Record, etc.]
      ```
    * Find the `## Security` section and update with:
      ```markdown
      ## Security
      See [SECURITY.md](.cursor/SECURITY.md) for detailed security documentation.
      
      **Authentication:** [Brief description: JWT, OAuth, Session, etc.]
      **Authorization:** [Brief description: RBAC, Policy-based, etc.]
      **Roles:** [List main roles]
      **Public Endpoints:** [Count]
      **Protected Endpoints:** [Count]
      ```
    * Write the updated content to `.cursor/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

22. **Progress Report:**
    * Report completion status:
      - Architectural pattern identified
      - Number of design patterns found
      - Number of entities/models identified
      - Number of relationships mapped
      - Authentication mechanism identified
      - Authorization pattern identified
      - Number of roles identified

23. **Update Step Completion Status:**
    * Read `.cursor/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 4 - Architecture, Data Models & Security" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 4 marked as complete.
    * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.

24. **Completion:**
    * Tell the user that Step 4 is complete.
    * **Note:** Other steps can now be run independently or in parallel:
      - `/05-analyze-config-and-testing` - Analyze configuration & testing (can run in parallel)
      - `/06-analyze-integrations` - Analyze integrations & error handling (can run in parallel)
      - `/07-analyze-domain-and-performance` - Analyze domain, API contracts & performance (can run in parallel)

**Proceed with all steps above (Parts A, B, C, and D).**
