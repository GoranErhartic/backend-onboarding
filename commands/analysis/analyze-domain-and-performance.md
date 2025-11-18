---
title: "07 - Analyze Domain, API Contracts & Performance"
description: "Analyze Business Domain, API Contracts & Performance - can run in parallel with other analysis steps"
author: "Goran Erhartic"
---

Analyze business domain, domain models, business rules, API contracts, request/response schemas, validation rules, performance considerations, caching strategies, and optimization patterns.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: Business Domain & Domain Models

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 7 - Domain, API Contracts & Performance" as `[P]` (in progress).
        * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

2.  **Read Master File:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Review data models from Step 4 and endpoint flows from Step 3 to understand business domain (if available).

3.  **Identify Domain Entities:**
    * Review data models from Step 4.
    * Use `codebase_search` with optimized queries for AI agents:
      - Query: "What are the main business entities or domain concepts in this application?"
      - Query: "What is the business domain of this application? What problem does it solve?"
      - Query: "What are the core business objects and their relationships?"
      - Query: "What business concepts and terminology are used in this domain?"
    * Document:
      - Core domain entities
      - Entity relationships
      - Entity purposes

3.  **Analyze Business Rules:**
    * Use `codebase_search` to find business rules:
      - Query: "What business rules are implemented?"
      - Query: "Where are business validation rules defined?"
    * Look for business rule implementations:
      - Validation logic
      - Business logic in services
      - Domain service methods
      - Rule engines (if used)
    * Document:
      - Business rules identified
      - Where rules are enforced
      - Rule complexity

4.  **Identify Domain Events:**
    * Use `codebase_search` to find domain events:
      - Query: "What domain events are published?"
    * Use `grep` to find event patterns:
      - `DomainEvent|domain.*event|Event|event\.publish`
    * Document:
      - Domain events
      - Event publishers
      - Event handlers

5.  **Analyze Use Cases and Workflows:**
    * Review endpoint flows from Step 3 to identify:
      - Key business workflows
      - Use cases implemented
      - Business processes
    * Document:
      - Major use cases
      - Workflow steps
      - Process flows

6.  **Identify Business Logic Organization:**
    * Review how business logic is organized:
      - Domain services
      - Application services
      - Business logic in controllers
      - Business logic in models
    * Document:
      - Business logic organization
      - Separation of concerns
      - Business logic patterns

7.  **Document Domain-Specific Terminology:**
    * Identify domain-specific terms:
      - Business concepts
      - Domain language
      - Abbreviations
      - Business acronyms
    * Create a glossary of domain terms.

8.  **Analyze Key Business Processes:**
    * Identify critical business processes:
      - Order processing
      - User registration
      - Payment processing
      - Content management
      - etc.
    * Document:
      - Process steps
      - Process actors
      - Process outcomes

## PART B: API Contracts & Validation

9.  **Identify Request/Response Schemas:**
    * Review endpoint flows from Step 3.
    * Use `codebase_search` to find DTOs and schemas:
      - Query: "Where are request and response DTOs defined?"
      - Query: "What are the API request and response models?"
    * Look for DTO/model definitions:
      - Request DTOs
      - Response DTOs
      - View models
      - API models
    * Document:
      - Request schemas for each endpoint
      - Response schemas for each endpoint
      - Schema structure

10. **Analyze Validation Rules:**
    * Review validation implementations:
      - Data annotations/attributes
      - Fluent validation
      - Custom validation
      - Schema validation
    * Use `grep` to find validation patterns:
      - `[Required]|@NotNull|required|validate|Validation`
    * Document:
      - Validation rules per endpoint
      - Required fields
      - Field constraints
      - Custom validation logic

11. **Identify API Versioning:**
    * Review endpoint paths from Step 2.
    * Look for versioning patterns:
      - URL versioning (`/api/v1/users`)
      - Header versioning (`Api-Version: 1`)
      - Query parameter versioning (`?version=1`)
    * Use `grep` to find versioning:
      - `v1|v2|version|Version|api-version`
    * Document:
      - Versioning strategy
      - API versions available
      - Version deprecation policy (if any)

12. **Check for API Documentation:**
    * Look for API documentation:
      - OpenAPI/Swagger specifications (`swagger.json`, `openapi.yaml`)
      - Swagger UI configuration
      - API documentation files
      - README files with API docs
    * Document:
      - API documentation existence
      - Documentation format
      - Documentation completeness

13. **Analyze Serialization/Deserialization:**
    * Review how data is serialized:
      - JSON serialization
      - XML serialization (if used)
      - Custom serializers
      - Serialization settings
    * Document:
      - Serialization format
      - Serialization settings
      - Custom serialization logic

14. **Identify Data Transfer Objects (DTOs):**
    * Review DTO patterns:
      - Request DTOs
      - Response DTOs
      - Mapping between entities and DTOs
    * Document:
      - DTO structure
      - Mapping patterns
      - DTO usage

15. **Analyze API Error Responses:**
    * Review error response formats from Step 6.
    * Document:
      - Error response schema
      - Error codes
      - Error message format

## PART C: Performance & Optimization

16. **Identify Caching Strategies:**
    * Use `codebase_search` to find caching implementations:
      - Query: "What caching is used? Where is caching implemented?"
    * Look for caching patterns:
      - **In-Memory Cache:** `IMemoryCache`, `MemoryCache`, `cache`
      - **Distributed Cache:** `IDistributedCache`, `Redis`, `RedisCache`
      - **CDN:** CDN configuration
      - **HTTP Cache:** Cache headers, ETag
    * Use `grep` to find caching:
      - `Cache|cache|Redis|MemoryCache|DistributedCache|@Cacheable`
    * Document:
      - Caching mechanisms used
      - What is cached
      - Cache expiration policies
      - Cache invalidation strategies

17. **Analyze Database Query Optimization:**
    * Review data access patterns from Step 4.
    * Look for query optimization:
      - Index usage
      - Query optimization patterns
      - Eager vs lazy loading
      - Query batching
      - Connection pooling
    * Document:
      - Database optimization strategies
      - Index usage
      - Query patterns
      - Connection pooling configuration

18. **Identify Performance Bottlenecks:**
    * Review endpoint flows and code structure:
      - N+1 query problems
      - Synchronous blocking operations
      - Large data transfers
      - Inefficient algorithms
    * Use `codebase_search` to find performance concerns:
      - Query: "What performance optimizations are implemented?"
    * Document:
      - Known bottlenecks
      - Optimization opportunities
      - Performance concerns

19. **Analyze Async/Await Patterns:**
    * Review async processing:
      - Async/await usage
      - Task parallelization
      - Background processing
    * Use `grep` to find async patterns:
      - `async|await|Task|Promise|Future`
    * Document:
      - Async patterns used
      - Async/await best practices
      - Parallel processing

20. **Identify Connection Pooling:**
    * Review connection management:
      - Database connection pooling
      - HTTP connection pooling
      - Connection pool configuration
    * Document:
      - Connection pooling approach
      - Pool size configuration
      - Connection management

21. **Analyze Rate Limiting:**
    * Look for rate limiting implementations:
      - API rate limiting
      - Request throttling
      - Rate limit headers
    * Use `grep` to find rate limiting:
      - `RateLimit|rate.*limit|throttle|Throttle`
    * Document:
      - Rate limiting strategy
      - Rate limits configured
      - Throttling mechanisms

22. **Identify Load Balancing Considerations:**
    * Review deployment configuration from Step 7:
      - Load balancer configuration
      - Session affinity
      - Health checks
    * Document:
      - Load balancing approach
      - Session management
      - Health check configuration

23. **Analyze Performance Monitoring:**
    * Look for performance monitoring:
      - Application Performance Monitoring (APM)
      - Performance metrics
      - Profiling tools
    * Document:
      - Performance monitoring tools
      - Metrics collected
      - Performance tracking

## PART D: Generate Documentation

24. **Generate Domain Documentation:**
    * Create `.cursor/onboarding-docs/DOMAIN.md` with the following structure:

      ```markdown
      # Business Domain & Domain Models

      ## Business Domain Overview

      [Describe the business domain and purpose of the application]

      ## Core Domain Entities

      ### [Entity Name]
      - **Purpose:** [What this entity represents in the business]
      - **Key Attributes:** [Key business attributes]
      - **Business Rules:** [Business rules related to this entity]
      - **Relationships:** [Business relationships]

      [Repeat for each core entity]

      ## Business Rules

      ### [Rule Name/Description]
      - **Rule:** [Description of the rule]
      - **Enforcement:** [Where/how it's enforced]
      - **Impact:** [What it affects]

      [Repeat for each business rule]

      ## Domain Events

      ### [Event Name]
      - **Trigger:** [What triggers this event]
      - **Payload:** [Event data]
      - **Handlers:** [What handles this event]

      [Repeat for each domain event]

      ## Use Cases

      ### [Use Case Name]
      - **Description:** [What this use case does]
      - **Actors:** [Who performs this use case]
      - **Steps:** [Process steps]
      - **Outcome:** [Expected outcome]

      [Repeat for each use case]

      ## Business Workflows

      ### [Workflow Name]
      [Describe the workflow steps and process]

      [Repeat for each workflow]

      ## Business Logic Organization

      [Describe how business logic is organized]

      ## Domain Glossary

      | Term | Definition |
      |------|------------|
      | [Term] | [Definition] |

      ## Key Business Processes

      [Document critical business processes]

      ## Notes
      [Any additional domain observations]
      ```

25. **Generate API Contracts Documentation:**
    * Create `.cursor/onboarding-docs/API_CONTRACTS.md` with the following structure:

      ```markdown
      # API Contracts & Validation

      ## API Versioning

      [Document API versioning strategy]

      ## Request/Response Schemas

      ### [Endpoint] [METHOD] [Path]

      #### Request Schema
      ```json
      {
        "field1": "type",
        "field2": "type"
      }
      ```

      #### Response Schema
      ```json
      {
        "field1": "type",
        "field2": "type"
      }
      ```

      #### Validation Rules
      - `field1`: Required, [constraints]
      - `field2`: Optional, [constraints]

      [Repeat for each endpoint]

      ## Validation Rules Summary

      [Summary of validation rules across all endpoints]

      ## DTOs (Data Transfer Objects)

      [Document DTO structure and mapping]

      ## Serialization

      [Document serialization format and settings]

      ## API Documentation

      [Document API documentation availability and location]

      ## Error Response Format

      [Document standard error response format]

      ## API Best Practices

      [Document API design patterns and best practices observed]

      ## Notes
      [Any additional API contract observations]
      ```

26. **Generate Performance Documentation:**
    * Create `.cursor/onboarding-docs/PERFORMANCE.md` with the following structure:

      ```markdown
      # Performance & Optimization

      ## Caching Strategies

      ### [Cache Type]
      - **Purpose:** [What is cached]
      - **Implementation:** [How it's implemented]
      - **Expiration:** [Cache expiration policy]
      - **Invalidation:** [Cache invalidation strategy]

      [Repeat for each cache type]

      ## Database Optimization

      ### Indexes
      [Document database indexes]

      ### Query Optimization
      [Document query optimization strategies]

      ### Connection Pooling
      [Document connection pooling configuration]

      ## Async Processing

      [Document async/await patterns and parallel processing]

      ## Performance Bottlenecks

      [Document known bottlenecks and optimization opportunities]

      ## Rate Limiting

      [Document rate limiting strategy and configuration]

      ## Load Balancing

      [Document load balancing approach and configuration]

      ## Performance Monitoring

      [Document performance monitoring tools and metrics]

      ## Optimization Recommendations

      [Document optimization recommendations and best practices]

      ## Notes
      [Any additional performance observations]
      ```

27. **Update Master File (Parallel-Safe):**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Find the `## Business Domain` section and update with:
      ```markdown
      ## Business Domain
      See [DOMAIN.md](.cursor/onboarding-docs/DOMAIN.md) for detailed business domain documentation.
      
      **Domain:** [Brief description]
      **Core Entities:** [List main entities]
      **Key Use Cases:** [List main use cases]
      **Business Rules:** [Count or brief description]
      ```
    * Find the `## API Contracts` section and replace with:
      ```markdown
      ## API Contracts
      See [API_CONTRACTS.md](.cursor/onboarding-docs/API_CONTRACTS.md) for detailed API contracts documentation.
      
      **API Versioning:** [Strategy: URL, Header, Query, etc.]
      **API Documentation:** [Available/Not Available]
      **Serialization:** [Format: JSON, XML, etc.]
      **Validation:** [Brief description]
      ```
    * Find the `## Performance` section and replace with:
      ```markdown
      ## Performance
      See [PERFORMANCE.md](.cursor/onboarding-docs/PERFORMANCE.md) for detailed performance documentation.
      
      **Caching:** [Types: In-Memory, Redis, CDN, etc.]
      **Database Optimization:** [Brief description]
      **Async Processing:** [Yes/No]
      **Rate Limiting:** [Yes/No]
      **Performance Monitoring:** [Tool name if applicable]
      ```
    * Write the updated content to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

28. **Progress Report:**
    * Report completion status:
      - Domain identified
      - Number of core entities identified
      - Number of business rules identified
      - API versioning strategy identified
      - Request/response schemas documented
      - Caching strategies identified
      - Database optimization strategies identified
      - Performance bottlenecks identified

29. **Update Step Completion Status:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 7 - Domain, API Contracts & Performance" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 7 marked as complete.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

30. **Completion:**
    * Tell the user that Step 7 is complete.
    * **Final step:** Tell the user that all onboarding steps are complete and they now have comprehensive documentation of the system.

**Proceed with all steps above (Parts A, B, C, and D).**
