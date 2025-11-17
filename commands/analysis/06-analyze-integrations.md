---
title: "06 - Analyze Integrations & Error Handling"
description: "Analyze External Dependencies, Integrations & Error Handling - can run in parallel with other analysis steps"
author: "Goran Erhartic"
---

Analyze external services, third-party integrations, API clients, error handling mechanisms, logging strategy, and monitoring approach.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: External Dependencies & Integrations

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 6 - Integrations & Error Handling" as `[P]` (in progress).
        * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/01-initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/initialize-onboarding` first.

2.  **Read Master File:**
    * Read `.cursor/CURSOR-ONBOARDING.md`.
    * Review the stack analysis and endpoint flows from Step 3 to identify external integrations (if available).

3.  **Identify External API Integrations:**
    * Use `codebase_search` to find external API calls:
      - Query: "What external APIs or services are integrated?"
      - Query: "Where are HTTP clients configured for external services?"
    * Use `grep` to find HTTP client usage:
      - `HttpClient|fetch\(|axios|request\(|RestClient`
    * Look for API client wrappers:
      - SDK usage patterns
      - API client classes
      - Service wrappers for external APIs

3.  **Identify Third-Party Services:**
    * Review dependency files (package.json, requirements.txt, etc.) for:
      - Payment processors (Stripe, PayPal, etc.)
      - Email services (SendGrid, Mailgun, AWS SES, etc.)
      - Storage services (AWS S3, Azure Blob, etc.)
      - Messaging services (Twilio, etc.)
      - Analytics services (Google Analytics, etc.)
    * Use `codebase_search` to find service integrations:
      - Query: "What third-party services are used?"
    * Document:
      - Service name
      - Purpose
      - How it's integrated
      - Configuration required

4.  **Analyze Integration Patterns:**
    * Identify integration patterns used:
      - **REST APIs:** HTTP REST calls
      - **GraphQL:** GraphQL clients and queries
      - **gRPC:** gRPC clients and services
      - **Message Queues:** RabbitMQ, Azure Service Bus, AWS SQS, etc.
      - **Webhooks:** Webhook handlers
      - **Event Streaming:** Kafka, Event Hubs, etc.
    * Document:
      - Integration type
      - How it's implemented
      - Configuration required

5.  **Identify Webhook Handlers:**
    * Use `grep` to find webhook endpoints:
      - `webhook|Webhook|/webhook`
    * Document:
      - Webhook endpoints
      - What services send webhooks
      - Webhook processing logic

6.  **Analyze Event Publishers/Subscribers:**
    * Use `codebase_search` to find event patterns:
      - Query: "How are events published or subscribed to?"
    * Use `grep` to find event patterns:
      - `Publish|Subscribe|Event|event|emit|on\(`
    * Document:
      - Event types
      - Publishers
      - Subscribers
      - Event flow

7.  **Analyze Error Handling in Integrations:**
    * Review how external API errors are handled:
      - Retry logic
      - Circuit breakers
      - Fallback mechanisms
      - Error logging
    * Document:
      - Retry strategies
      - Error handling patterns
      - Timeout configurations

8.  **Identify Rate Limiting:**
    * Check for rate limiting in external API calls:
      - Rate limit handling
      - Throttling logic
      - Backoff strategies

## PART B: Error Handling & Logging

9.  **Identify Global Error Handling:**
    * Use `codebase_search` to find global error handling:
      - Query: "How are errors handled globally? Where is the global error handler?"
      - Query: "What is the exception handling middleware?"
    * Look for error handling middleware:
      - **ASP.NET Core:** `UseExceptionHandler`, `ExceptionMiddleware`
      - **Express.js:** Error middleware functions
      - **Flask:** Error handlers (`@app.errorhandler`)
      - **FastAPI:** Exception handlers
    * Document:
      - Global error handler location
      - How unhandled exceptions are caught
      - Error response format

10. **Identify Exception Types:**
    * Use `grep` to find exception/error classes:
      - `Exception|Error|class.*Exception|class.*Error`
    * Document:
      - Custom exception types
      - Exception hierarchy
      - When each exception type is used

11. **Analyze Error Response Formats:**
    * Review error response structures:
      - Standard error response format
      - Error codes
      - Error messages
      - Stack traces (in development vs production)
    * Document:
      - Error response schema
      - HTTP status code mapping
      - Error code system (if exists)

12. **Identify Logging Framework:**
    * Based on stack analysis and code search:
      - **C#/.NET:** Serilog, NLog, Microsoft.Extensions.Logging
      - **Node.js:** Winston, Pino, Bunyan
      - **Python:** logging, structlog
      - **Java:** Logback, Log4j, SLF4J
      - **Go:** log, zap, zerolog
    * Use `grep` to find logging usage:
      - `Logger|logger|Log|log\.|console\.log`

13. **Analyze Logging Configuration:**
    * Review logging configuration:
      - Log levels (Debug, Info, Warning, Error, Fatal)
      - Log output destinations (console, file, cloud)
      - Log formatting (structured logging, JSON)
      - Log rotation/retention policies
    * Document:
      - Logging configuration
      - Log levels used
      - Log output destinations

14. **Identify Structured Logging:**
    * Check for structured logging patterns:
      - JSON logging
      - Log context/correlation IDs
      - Log enrichment
    * Document:
      - Structured logging approach
      - Log fields/properties
      - Correlation ID handling

15. **Identify Log Aggregation:**
    * Check for log aggregation services:
      - Cloud logging (Azure Application Insights, AWS CloudWatch, GCP Cloud Logging)
      - ELK Stack (Elasticsearch, Logstash, Kibana)
      - Splunk
      - Datadog
    * Document:
      - Log aggregation service used
      - How logs are sent
      - Log querying capabilities

16. **Identify Error Tracking/Monitoring:**
    * Check for error tracking services:
      - Sentry
      - Application Insights
      - New Relic
      - Rollbar
    * Use `grep` to find error tracking:
      - `Sentry|ApplicationInsights|NewRelic|Rollbar|captureException`
    * Document:
      - Error tracking service used
      - How errors are tracked
      - Alerting configuration

17. **Analyze Logging Patterns:**
    * Review how logging is used throughout the codebase:
      - What is logged (requests, responses, errors, business events)
      - When logging occurs
      - Log level usage patterns
    * Document:
      - Logging patterns
      - What information is logged
      - Log level guidelines

## PART C: Generate Documentation

18. **Generate Integrations Documentation:**
    * Create `.cursor/INTEGRATIONS.md` with the following structure:

      ```markdown
      # External Dependencies & Integrations

      ## External APIs

      ### [API Name]
      - **Purpose:** [What this API is used for]
      - **Integration Type:** [REST, GraphQL, gRPC, etc.]
      - **Client/Implementation:** [How it's integrated]
      - **Configuration:** [Required configuration]
      - **Endpoints Used:** [List endpoints called]
      - **Error Handling:** [How errors are handled]
      - **Rate Limiting:** [Rate limiting approach]

      [Repeat for each external API]

      ## Third-Party Services

      ### [Service Name]
      - **Purpose:** [What this service is used for]
      - **Provider:** [Service provider]
      - **Integration Method:** [SDK, REST API, etc.]
      - **Configuration:** [Required configuration]
      - **Usage:** [How it's used in the codebase]

      [Repeat for each service]

      ## Webhooks

      ### [Webhook Name]
      - **Endpoint:** [Webhook endpoint path]
      - **Source Service:** [Service that sends webhook]
      - **Purpose:** [What the webhook does]
      - **Handler:** [Where it's processed]

      [Repeat for each webhook]

      ## Event System

      ### Event Types
      [List event types published/subscribed]

      ### Publishers
      [List event publishers]

      ### Subscribers
      [List event subscribers]

      ## Message Queues

      [Document message queue usage if applicable]

      ## Integration Patterns

      [Document common integration patterns used]

      ## Error Handling

      [Document error handling strategies for integrations]

      ## Dependencies

      [Document critical dependencies on external services]

      ## Notes
      [Any additional integration observations]
      ```

19. **Generate Error Handling & Logging Documentation:**
    * Create `.cursor/ERROR_HANDLING.md` with the following structure:

      ```markdown
      # Error Handling & Logging

      ## Global Error Handling

      ### Error Handler
      [Describe global error handler and location]

      ### Error Response Format
      [Document standard error response format]

      ### Exception Types
      [List custom exception types and when they're used]

      ## Error Handling Patterns

      [Document error handling patterns used throughout the codebase]

      ## Logging Framework

      [Document logging framework and configuration]

      ## Logging Configuration

      ### Log Levels
      [Document log levels and when they're used]

      ### Log Output
      [Document where logs are written]

      ### Log Format
      [Document log format: structured, JSON, etc.]

      ## Structured Logging

      [Document structured logging approach if used]

      ## Log Aggregation

      [Document log aggregation service and configuration]

      ## Error Tracking

      [Document error tracking service and configuration]

      ## Logging Patterns

      [Document what is logged and logging patterns]

      ## Monitoring & Alerting

      [Document monitoring and alerting setup]

      ## Best Practices

      [Document logging and error handling best practices]

      ## Notes
      [Any additional observations]
      ```

20. **Update Master File (Parallel-Safe):**
    * Read `.cursor/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Find the `## Integrations` section and update with:
      ```markdown
      ## Integrations
      See [INTEGRATIONS.md](.cursor/INTEGRATIONS.md) for detailed integration documentation.
      
      **External APIs:** [Count]
      **Third-Party Services:** [Count]
      **Webhooks:** [Count]
      **Integration Patterns:** [List: REST, GraphQL, Message Queue, etc.]
      ```
    * Find the `## Error Handling` section and replace with:
      ```markdown
      ## Error Handling
      See [ERROR_HANDLING.md](.cursor/ERROR_HANDLING.md) for detailed error handling and logging documentation.
      
      **Logging Framework:** [Framework name]
      **Error Tracking:** [Service name if applicable]
      **Log Aggregation:** [Service name if applicable]
      **Structured Logging:** [Yes/No]
      ```
    * Write the updated content to `.cursor/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

21. **Progress Report:**
    * Report completion status:
      - Number of external APIs identified
      - Number of third-party services identified
      - Number of webhooks identified
      - Global error handler identified
      - Logging framework identified
      - Error tracking service identified (if applicable)
      - Log aggregation service identified (if applicable)

22. **Update Step Completion Status:**
    * Read `.cursor/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 6 - Integrations & Error Handling" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 6 marked as complete.
    * Write the updated content back to `.cursor/CURSOR-ONBOARDING.md`.

23. **Completion:**
    * Tell the user that Step 6 is complete.
    * **Note:** Other steps can now be run independently or in parallel:
      - `/07-analyze-domain-and-performance` - Analyze domain, API contracts & performance (can run in parallel)

**Proceed with all steps above (Parts A, B, and C).**
