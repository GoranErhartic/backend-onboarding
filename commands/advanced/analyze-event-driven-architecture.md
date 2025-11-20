---
title: "11 - Analyze Event-Driven Architecture"
description: "Deep dive into pub/sub messaging, brokers, schemas, reliability patterns, and observability"
author: "Goran Erhartic"
---

Analyze whether and how the project leverages event-driven patterns (publish/subscribe, message queues, streaming platforms) and document the supporting infrastructure, contracts, and operational safeguards.

**This step can be run independently once `/onboarding/initialize` has recorded event-driven status.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

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

## PART A: Pre-Checks & Gating

0.  **Mark Command as In Progress [P]:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` to get the current Step Completion Status.
    * Update the Step Completion Status section to mark "Step 11 - Analyze Event-Driven Architecture" as `[P]`.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

1.  **Check Initialization Artifacts:**
    * Verify `.cursor/onboarding-docs/EVENT_DRIVEN_STATUS.json` exists.
    * **If file is missing:** Report error ("Initialization must detect event-driven usage before running this step.") and stop.
    * Read the JSON and capture:
      - `detected` boolean
      - Any `evidence` entries
      - Notes to surface later.

2.  **Short-Circuit When Not Detected:**
    * **If `detected` is `false`:**
      - Create/overwrite `.cursor/onboarding-docs/EVENT_DRIVEN.md` with:
        ```markdown
        # Event-Driven Architecture

        > **Generated:** [Generate current date/time in human-readable format: YYYY-MM-DD HH:mm:ss UTC (e.g., 2024-12-19 14:30:00 UTC)]
        > Initialization did not find evidence of pub/sub messaging.

        No further analysis required. If this is unexpected, rerun `/onboarding/initialize`.
        ```
      - Update `CURSOR-ONBOARDING.md` `## Event-Driven Architecture` section with:
        - **Detected:** No
        - **Signals:** None
        - **Status:** "Step skipped – initialization found no pub/sub usage."
      - Mark Step 11 as `[x]` complete and **stop** (do not proceed to Parts B-D).

## PART B: Inventory Messaging Infrastructure

3.  **Identify Brokers & Infrastructure:**
    * Use `codebase_search` and documentation references to locate:
      - Managed services (Kafka, RabbitMQ, EventBridge, SQS/SNS, Pub/Sub, NATS, Azure Service Bus, Redis Streams, etc.).
      - Self-hosted broker deployments (`docker-compose`, Terraform, Helm charts).
    * Use `grep` for broker keywords:
      - `Kafka|kafka|EventBus|RabbitMQ|SQS|SNS|PubSub|PubSubClient|EventBridge|ServiceBus|NATS|RedisStream`
    * Document:
      - Broker name/provider
      - Deployment location/config file
      - Connection / authentication requirements

4.  **Catalog Topics, Queues & Streams:**
    * Search for constant definitions, config entries, or schema files listing topics/queues:
      - `topic|queue|stream|exchange|routingKey`
    * Extract:
      - Name
      - Purpose
      - Producer components
      - Consumer components
      - Dead-letter queues or retry topics.

5.  **Review Infrastructure Configuration:**
    * Inspect IaC / configuration for:
      - Partition/throughput settings
      - Retention periods
      - Ordering guarantees (FIFO vs standard)
      - Security settings (encryption, auth).
    * Summarize per broker/topic.

## PART C: Analyze Publishers, Subscribers & Contracts

6.  **Map Publishers:**
    * Use `codebase_search` queries:
      - "Where are events published?"
      - "How is EventBus/EventEmitter used?"
    * Use `grep` patterns:
      - `publish\(|send\(|emit\(|EventEmitter|producer\.send|bus\.publish`
    * For each publisher, capture:
      - Component (service, controller, job)
      - Trigger scenarios
      - Events emitted (name + schema reference)
      - Reliability safeguards (transactional outbox, confirm callbacks, retries).

7.  **Map Subscribers/Handlers:**
    * Search for:
      - `subscribe|onMessage|handleEvent|consumer\.run|topicSubscription`
    * Document per handler:
      - Listening topic/queue
      - Processing logic summary
      - Idempotency strategy (dedupe keys, guards)
      - Error handling (retry policy, DLQ, manual intervention).

8.  **Capture Event Schemas & Versioning:**
    * Identify schema definitions (Avro, JSON Schema, Protobuf, custom classes).
    * Document:
      - Schema versioning approach
      - Backward compatibility rules
      - Validation/marshalling libraries used.

9.  **Reliability & Delivery Semantics:**
    * Look for:
      - Exactly-once / at-least-once statements
      - Transactional outbox or change data capture
      - Retry/backoff configuration
      - Dead-letter queues and monitoring hooks.
    * Document per channel.

## PART D: Observability & Documentation Output

10. **Monitoring & Alerting:**
    * Identify metrics/logs/traces for messaging:
      - Lag metrics, consumer health checks
      - Structured logging of message IDs
      - Alerting pipelines (PagerDuty, Slack, etc.)
    * Document tooling and key dashboards.

11. **Generate Event-Driven Documentation:**
    * Create/overwrite `.cursor/onboarding-docs/EVENT_DRIVEN.md`:
      ```markdown
      # Event-Driven Architecture

      > **Generated:** [Generate current date/time in human-readable format: YYYY-MM-DD HH:mm:ss UTC (e.g., 2024-12-19 14:30:00 UTC)]
      > **Source:** /onboarding/analyze-event-driven-architecture

      ## Detection Summary
      - **Detected:** Yes
      - **Signals:** [list of key indicators]

      ## Brokers & Infrastructure
      | Broker | Deployment | Purpose | Notes |
      |:-------|:-----------|:--------|:------|
      | Kafka | terraform/brokers.tf | Streaming | SASL auth |

      ## Topics & Queues
      | Name | Type | Producers | Consumers | DLQ | Notes |
      |:------|:------|:-----------|:-----------|:-----|:------|
      | orders.created | topic | OrderService | BillingService | orders.dlq | At-least-once |

      ## Publishers
      ### [Component]
      - Events: [...]
      - Trigger: [...]
      - Reliability: [...]

      ## Subscribers
      ### [Handler]
      - Source: [topic/queue]
      - Idempotency: [...]
      - Error Handling: [...]

      ## Event Schemas
      - [Schema name] – format, versioning, compatibility notes

      ## Delivery & Reliability Patterns
      - [Bullet list]

      ## Observability
      - Metrics: [...]
      - Logging: [...]
      - Alerts: [...]

      ## Open Questions
      - [List follow-ups or unknowns]
      ```
      *Replace placeholders with actual findings; trim sections if data is unavailable (state "Not documented").*

12. **Update Detection Metadata:**
    * Overwrite `.cursor/onboarding-docs/EVENT_DRIVEN_STATUS.json` with refined data:
      ```json
      {
        "detected": true,
        "brokers": ["Kafka", "SQS"],
        "topics": ["orders.created", "billing.failed"],
        "notes": "Short synopsis of findings",
        "lastAnalyzedBy": "/onboarding/analyze-event-driven-architecture",
        "lastUpdated": "[Generate current date/time in human-readable format: YYYY-MM-DD HH:mm:ss UTC (e.g., 2024-12-19 14:30:00 UTC)]"
      }
      ```

13. **Update Master File (Parallel-Safe):**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` fresh.
    * Find `## Event-Driven Architecture` section and update with:
      ```markdown
      ## Event-Driven Architecture
      See [EVENT_DRIVEN.md](.cursor/onboarding-docs/EVENT_DRIVEN.md) for messaging details.

      **Detected:** Yes
      **Brokers:** [comma-separated list]
      **Channels:** [count of topics/queues]
      **Next Step:** Keep documentation in sync when adding topics or handlers.
      ```
    * Add/refresh any checklist or note references as needed without overwriting unrelated sections.

14. **Completion & Status Update:**
    * Mark "Step 11 - Analyze Event-Driven Architecture" as `[x]` in the Step Completion Status.
    * Summarize to the user:
      - Brokers identified
      - Topics/queues counted
      - Number of publishers/subscribers documented
      - Reliability/observability highlights
    * Note if any gaps or TODOs remain (e.g., missing schema references).

**Proceed with all steps above unless the detection file indicates event-driven architecture is absent (in which case stop after Part A).**

