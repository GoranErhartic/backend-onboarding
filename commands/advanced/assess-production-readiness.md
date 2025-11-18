---
title: "10 - Assess Production Readiness (OPTIONAL)"
description: "Assess production readiness focusing on robustness, test coverage, security, and best practices - OPTIONAL"
author: "Goran Erhartic"
---

Assess the project's production readiness by evaluating robustness, test coverage, security, monitoring, error handling, performance, scalability, and compliance with best practices.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: Initial Setup & Summary Checklist

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 10 - Assess Production Readiness" as `[P]` (in progress).
        * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

2.  **Read Master File:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Review existing sections to understand what has been analyzed:
      - Stack Analysis
      - Architecture
      - Security
      - Configuration
      - Testing
      - Error Handling
      - Integrations
      - Performance

## PART B: Robustness Assessment

3.  **Error Handling Analysis:**
    * Review error handling patterns:
      - Use `codebase_search`: "How are errors handled in this application?"
      - Use `grep` to find error handling patterns:
        - `try-catch|try/except|defer|recover|catch`
        - `throw|raise|panic|error`
        - `ErrorHandler|ExceptionHandler|error middleware`
    * Assess:
      - Global error handling mechanisms
      - Error logging and tracking
      - Error response formatting
      - Error recovery strategies
      - Graceful degradation
    * Document:
      - Error handling coverage (complete/partial/none)
      - Error handling patterns used
      - Missing error handling areas
      - Error logging implementation
    * **Generate Recommendations:**
      - For each gap identified, provide specific, actionable recommendations
      - Include code examples or patterns to follow (if applicable)
      - Prioritize recommendations (high/medium/low)
      - Even if status is "COMPLETED", provide improvement recommendations

4.  **Input Validation Assessment:**
    * Review input validation:
      - Use `codebase_search`: "How is input validation implemented?"
      - Use `grep` to find validation patterns:
        - `[Required]|@NotNull|@Valid|validate|Validate`
        - `ModelState|ValidationResult|validator`
    * Assess:
      - API endpoint input validation
      - Data model validation
      - Sanitization of user inputs
      - SQL injection prevention
      - XSS prevention
      - File upload validation
    * Document:
      - Validation coverage (complete/partial/none)
      - Validation frameworks used
      - Missing validation areas
      - Security vulnerabilities from missing validation
    * **Generate Recommendations:**
      - For each missing validation area, provide specific recommendations
      - Include examples of validation rules to implement
      - Prioritize security-critical validation gaps
      - Provide code examples or validation patterns

5.  **Resilience Patterns Assessment:**
    * Review resilience patterns:
      - Use `codebase_search`: "What resilience patterns are implemented? Retry, circuit breaker, timeout?"
      - Use `grep` to find resilience patterns:
        - `Retry|retry|CircuitBreaker|circuit-breaker|Timeout|timeout`
        - `Polly|Resilience4j|Hystrix|resilience`
    * Assess:
      - Retry mechanisms for external calls
      - Circuit breaker patterns
      - Timeout configurations
      - Rate limiting
      - Bulkhead pattern
      - Health checks
    * Document:
      - Resilience pattern coverage (complete/partial/none)
      - Patterns implemented
      - Missing resilience mechanisms
      - External dependency failure handling
    * **Generate Recommendations:**
      - Recommend specific resilience patterns for each external dependency
      - Provide implementation guidance (libraries, patterns)
      - Prioritize critical external dependencies
      - Include configuration examples

6.  **Resource Management Assessment:**
    * Review resource management:
      - Use `codebase_search`: "How are resources managed? Database connections, file handles, memory?"
      - Use `grep` to find resource patterns:
        - `using|dispose|close|finally|defer`
        - `IDisposable|Closeable|AutoCloseable`
    * Assess:
      - Database connection pooling
      - Memory leak prevention
      - File handle management
      - Resource cleanup
      - Async/await patterns
    * Document:
      - Resource management coverage (complete/partial/none)
      - Resource management patterns
      - Potential resource leaks
      - Best practices compliance
    * **Generate Recommendations:**
      - For each potential resource leak, provide specific fixes
      - Recommend resource management patterns
      - Include code examples for proper resource disposal
      - Prioritize critical resource leaks

7.  **Concurrency & Threading Assessment:**
    * Review concurrency handling:
      - Use `codebase_search`: "How is concurrency handled? Thread safety, locking, async patterns?"
      - Use `grep` to find concurrency patterns:
        - `lock|mutex|semaphore|async|await|Promise|Future`
        - `synchronized|volatile|Atomic|Concurrent`
    * Assess:
      - Thread safety
      - Race condition prevention
      - Deadlock prevention
      - Async/await usage
      - Concurrent data structure usage
    * Document:
      - Concurrency coverage (complete/partial/none)
      - Concurrency patterns used
      - Potential race conditions
      - Thread safety issues
    * **Generate Recommendations:**
      - For each race condition, provide specific fixes
      - Recommend thread-safe patterns or libraries
      - Include code examples for proper synchronization
      - Prioritize critical concurrency issues

## PART C: Test Coverage Assessment

8.  **Test Coverage Analysis:**
    * Review existing test coverage:
      - Read `.cursor/onboarding-docs/TESTING.md` if available
      - Use `codebase_search`: "What is the test coverage? How is it measured?"
      - Look for coverage reports:
        - `coverage/`, `htmlcov/`, `.coverage`
        - Coverage configuration files
        - CI/CD coverage reports
    * Assess:
      - Overall test coverage percentage
      - Unit test coverage
      - Integration test coverage
      - E2E test coverage
      - Critical path coverage
      - Edge case coverage
    * Document:
      - Coverage metrics (if available)
      - Coverage by layer (presentation/business/data)
      - Coverage by feature/module
      - Missing coverage areas
    * **Generate Recommendations:**
      - For each missing coverage area, recommend specific tests to add
      - Prioritize critical paths and business logic
      - Recommend coverage targets by layer
      - Provide test examples or patterns

9.  **Test Quality Assessment:**
    * Review test quality:
      - Read test files to assess:
        - Test naming conventions
        - Test organization
        - Test isolation
        - Test data management
        - Assertion quality
        - Mock usage
    * Assess:
      - Test maintainability
      - Test readability
      - Test independence
      - Test speed
      - Flaky tests
      - Test documentation
    * Document:
      - Test quality score (high/medium/low)
      - Test best practices compliance
      - Areas for improvement
      - Test anti-patterns found
    * **Generate Recommendations:**
      - For each test anti-pattern, provide refactoring recommendations
      - Recommend test organization improvements
      - Suggest test naming conventions
      - Provide examples of well-structured tests

10. **Test Types Coverage:**
    * Review test type coverage:
      - Unit tests: Are critical business logic units tested?
      - Integration tests: Are external dependencies tested?
      - E2E tests: Are critical user flows tested?
      - Performance tests: Are performance benchmarks in place?
      - Security tests: Are security vulnerabilities tested?
      - Load tests: Are load scenarios tested?
    * Document:
      - Test type coverage (complete/partial/none)
      - Missing test types
      - Critical gaps
    * **Generate Recommendations:**
      - For each missing test type, recommend implementation approach
      - Prioritize test types by criticality
      - Recommend testing frameworks/tools for each type
      - Provide examples or templates

## PART D: Security Assessment

11. **Security Best Practices Review:**
    * Review security implementation:
      - Read `.cursor/onboarding-docs/SECURITY.md` if available
      - Use `codebase_search`: "What security measures are implemented?"
      - Review security configurations:
        - Authentication mechanisms
        - Authorization patterns
        - Encryption usage
        - Secrets management
    * Assess against OWASP Top 10:
      - Injection vulnerabilities
      - Broken authentication
      - Sensitive data exposure
      - XML external entities (XXE)
      - Broken access control
      - Security misconfiguration
      - XSS vulnerabilities
      - Insecure deserialization
      - Using components with known vulnerabilities
      - Insufficient logging & monitoring
    * Document:
      - Security best practices compliance (complete/partial/none)
      - OWASP Top 10 coverage
      - Security vulnerabilities found
      - Security recommendations
    * **Generate Recommendations:**
      - For each OWASP Top 10 item, provide specific remediation steps
      - Prioritize vulnerabilities by severity (critical/high/medium/low)
      - Include code examples or configuration changes
      - Recommend security tools or libraries
      - Provide security testing recommendations

12. **Authentication & Authorization Assessment:**
    * Review auth implementation:
      - Token management (expiration, refresh, revocation)
      - Password policies (strength, hashing, storage)
      - Session management
      - Multi-factor authentication (if applicable)
      - Role-based access control
      - Permission checks
    * Assess:
      - Authentication robustness
      - Authorization granularity
      - Token security
      - Password security
      - Session security
    * Document:
      - Auth security score (high/medium/low)
      - Auth best practices compliance
      - Security gaps
      - Recommendations
    * **Generate Recommendations:**
      - For each security gap, provide specific implementation steps
      - Recommend token management improvements
      - Suggest password policy enhancements
      - Provide code examples for secure auth patterns
      - Prioritize critical auth vulnerabilities

13. **Data Protection Assessment:**
    * Review data protection:
      - Use `codebase_search`: "How is sensitive data protected? Encryption, masking?"
      - Use `grep` to find encryption patterns:
        - `encrypt|decrypt|hash|bcrypt|scrypt|AES|RSA`
        - `SSL|TLS|HTTPS|certificate`
    * Assess:
      - Data encryption at rest
      - Data encryption in transit
      - PII handling
      - Data masking
      - Secure storage
      - Key management
    * Document:
      - Data protection coverage (complete/partial/none)
      - Encryption mechanisms
      - Data protection gaps
      - Compliance considerations
    * **Generate Recommendations:**
      - For each data protection gap, provide specific encryption solutions
      - Recommend encryption libraries or services
      - Suggest data masking strategies
      - Provide key management recommendations
      - Include compliance-specific recommendations (GDPR, HIPAA, etc.)

14. **Dependency Security Assessment:**
    * Review dependency security:
      - Check for dependency vulnerability scanning:
        - `package-lock.json`, `yarn.lock`, `requirements.txt`
        - Security audit tools configuration
        - Dependency update policies
      - Use `codebase_search`: "How are dependency vulnerabilities managed?"
    * Assess:
      - Known vulnerability scanning
      - Dependency update frequency
      - Outdated dependencies
      - License compliance
    * Document:
      - Dependency security status (secure/at-risk/vulnerable)
      - Vulnerable dependencies
      - Update recommendations
    * **Generate Recommendations:**
      - For each vulnerable dependency, provide update path
      - Recommend alternative secure libraries if updates unavailable
      - Suggest dependency scanning tools and CI/CD integration
      - Prioritize critical vulnerabilities
      - Provide migration guides for major version updates

## PART E: Monitoring & Observability Assessment

15. **Logging Assessment:**
    * Review logging implementation:
      - Use `codebase_search`: "How is logging implemented? What logging framework?"
      - Use `grep` to find logging patterns:
        - `log|logger|Log|Logger|console.log|print`
        - `Serilog|NLog|log4j|winston|pino`
    * Assess:
      - Logging levels (debug, info, warn, error)
      - Structured logging
      - Log aggregation
      - Log retention
      - Sensitive data in logs
      - Log performance impact
    * Document:
      - Logging coverage (complete/partial/none)
      - Logging framework
      - Logging best practices compliance
      - Missing logging areas
    * **Generate Recommendations:**
      - For each missing logging area, recommend what to log
      - Suggest structured logging improvements
      - Recommend log aggregation tools
      - Provide examples of proper log statements
      - Suggest log retention policies

16. **Monitoring & Metrics Assessment:**
    * Review monitoring implementation:
      - Use `codebase_search`: "What monitoring and metrics are implemented?"
      - Use `grep` to find monitoring patterns:
        - `metrics|Metrics|monitor|Monitor|telemetry|Telemetry`
        - `Prometheus|Grafana|Datadog|Application Insights|New Relic`
    * Assess:
      - Application metrics (request rate, latency, errors)
      - Business metrics
      - Infrastructure metrics
      - Health checks
      - Alerting configuration
      - Dashboard availability
    * Document:
      - Monitoring coverage (complete/partial/none)
      - Monitoring tools used
      - Metrics collected
      - Missing monitoring areas
    * **Generate Recommendations:**
      - For each missing monitoring area, recommend specific metrics
      - Suggest monitoring tools and setup
      - Recommend alert thresholds
      - Provide dashboard examples
      - Prioritize critical metrics

17. **Distributed Tracing Assessment:**
    * Review tracing implementation:
      - Use `codebase_search`: "Is distributed tracing implemented?"
      - Use `grep` to find tracing patterns:
        - `trace|Trace|span|Span|correlation|Correlation`
        - `OpenTelemetry|Jaeger|Zipkin|Application Insights`
    * Assess:
      - Request tracing
      - Correlation IDs
      - Trace sampling
      - Trace visualization
    * Document:
      - Tracing coverage (complete/partial/none)
      - Tracing tools used
      - Tracing gaps
    * **Generate Recommendations:**
      - Recommend distributed tracing tools
      - Suggest correlation ID implementation
      - Provide tracing instrumentation examples
      - Recommend trace sampling strategies

## PART F: Performance & Scalability Assessment

18. **Performance Best Practices Assessment:**
    * Review performance optimizations:
      - Read `.cursor/onboarding-docs/PERFORMANCE.md` if available (from 07-analyze-domain-and-performance)
      - Use `codebase_search`: "What performance optimizations are implemented?"
      - Review:
        - Caching strategies
        - Database query optimization
        - API response optimization
        - Resource optimization
    * Assess:
      - Caching implementation
      - Database indexing
      - Query optimization
      - Response compression
      - CDN usage
      - Lazy loading
    * Document:
      - Performance optimizations (complete/partial/none)
      - Optimization techniques used
      - Performance bottlenecks
      - Recommendations
    * **Generate Recommendations:**
      - For each bottleneck, provide specific optimization strategies
      - Recommend caching solutions and strategies
      - Suggest database optimization techniques
      - Provide code examples for performance improvements
      - Prioritize optimizations by impact

19. **Scalability Assessment:**
    * Review scalability considerations:
      - Use `codebase_search`: "How is the application designed for scalability?"
      - Review:
        - Stateless design
        - Horizontal scaling support
        - Database scaling strategy
        - Caching strategy
        - Load balancing
    * Assess:
      - Horizontal scalability
      - Vertical scalability
      - Database scalability
      - State management
      - Session management
    * Document:
      - Scalability readiness (ready/partial/not-ready)
      - Scalability patterns
      - Scalability limitations
      - Recommendations
    * **Generate Recommendations:**
      - For each limitation, provide scalability solutions
      - Recommend stateless design improvements
      - Suggest database scaling strategies
      - Provide architecture patterns for horizontal scaling
      - Recommend load balancing configurations

20. **Resource Efficiency Assessment:**
    * Review resource usage:
      - Memory usage patterns
      - CPU usage patterns
      - Network efficiency
      - Storage efficiency
    * Assess:
      - Memory leaks
      - CPU bottlenecks
      - Network optimization
      - Storage optimization
    * Document:
      - Resource efficiency (efficient/inefficient)
      - Resource usage patterns
      - Optimization opportunities
    * **Generate Recommendations:**
      - For each inefficiency, provide specific optimization steps
      - Recommend memory optimization techniques
      - Suggest CPU optimization strategies
      - Provide code examples for resource-efficient patterns
      - Prioritize optimizations by resource impact

## PART G: Configuration & Deployment Assessment

21. **Configuration Management Assessment:**
    * Review configuration practices:
      - Read `.cursor/onboarding-docs/CONFIGURATION.md` if available
      - Assess:
        - Environment-specific configuration
        - Secrets management
        - Configuration validation
        - Configuration versioning
    * Document:
      - Configuration management (complete/partial/none)
      - Configuration best practices
      - Configuration gaps
    * **Generate Recommendations:**
      - For each gap, provide specific configuration improvements
      - Recommend secrets management solutions
      - Suggest configuration validation approaches
      - Provide examples of environment-specific configs
      - Recommend configuration management tools

22. **Deployment Readiness Assessment:**
    * Review deployment setup:
      - Use `codebase_search`: "How is the application deployed? CI/CD, containers?"
      - Review:
        - Docker configuration
        - Kubernetes configuration
        - CI/CD pipelines
        - Deployment scripts
        - Rollback strategies
    * Assess:
      - Containerization
      - Orchestration
      - CI/CD maturity
      - Deployment automation
      - Blue-green deployment
      - Canary deployment
    * Document:
      - Deployment readiness (ready/partial/not-ready)
      - Deployment practices
      - Deployment gaps
    * **Generate Recommendations:**
      - For each gap, provide specific deployment improvements
      - Recommend containerization strategies
      - Suggest CI/CD pipeline improvements
      - Provide deployment automation examples
      - Recommend blue-green or canary deployment setup
      - Suggest rollback strategies

## PART H: Documentation & Compliance Assessment

23. **Documentation Assessment:**
    * Review documentation:
      - API documentation
      - Architecture documentation
      - Deployment documentation
      - Runbooks
      - README files
    * Assess:
      - Documentation completeness
      - Documentation accuracy
      - Documentation accessibility
      - Code documentation
    * Document:
      - Documentation coverage (complete/partial/none)
      - Documentation quality
      - Missing documentation
    * **Generate Recommendations:**
      - For each missing documentation area, specify what to document
      - Recommend documentation tools and formats
      - Suggest API documentation standards (OpenAPI, Swagger, etc.)
      - Provide documentation templates
      - Prioritize critical documentation gaps

24. **Compliance Assessment:**
    * Review compliance considerations:
      - GDPR compliance (if applicable)
      - Data retention policies
      - Audit logging
      - Privacy policies
      - Industry-specific compliance
    * Assess:
      - Compliance readiness
      - Compliance gaps
    * Document:
      - Compliance status (compliant/partial/non-compliant)
      - Compliance requirements
      - Compliance gaps
    * **Generate Recommendations:**
      - For each compliance gap, provide specific remediation steps
      - Recommend compliance tools and frameworks
      - Suggest audit logging improvements
      - Provide data retention policy examples
      - Include industry-specific compliance guidance

## PART I: Generate Production Readiness Report

25. **Create Summary Checklist:**
    * Create `.cursor/onboarding-docs/PRODUCTION_READINESS.md` with summary checklist at the top:

      ```markdown
      # Production Readiness Assessment

      > **Assessment Date:** [Current Date/Time]
      > **Project:** [Project Name]
      > **Overall Status:** [Ready/Partial/Not Ready]

      ## Summary Checklist

      ### Robustness
      - [ ] Error Handling - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Input Validation - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Resilience Patterns - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Resource Management - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Concurrency & Threading - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Test Coverage
      - [ ] Overall Test Coverage - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Unit Test Coverage - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Integration Test Coverage - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] E2E Test Coverage - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Test Quality - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Security
      - [ ] Security Best Practices - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Authentication & Authorization - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Data Protection - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Dependency Security - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] OWASP Top 10 Compliance - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Monitoring & Observability
      - [ ] Logging - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Monitoring & Metrics - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Distributed Tracing - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Alerting - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Performance & Scalability
      - [ ] Performance Optimizations - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Scalability Design - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Resource Efficiency - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Load Testing - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Configuration & Deployment
      - [ ] Configuration Management - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Secrets Management - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Deployment Automation - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] CI/CD Pipeline - [COMPLETED/PARTIAL/NOT EXISTING]

      ### Documentation & Compliance
      - [ ] API Documentation - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Architecture Documentation - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Deployment Documentation - [COMPLETED/PARTIAL/NOT EXISTING]
      - [ ] Compliance Readiness - [COMPLETED/PARTIAL/NOT EXISTING]

      ## Detailed Assessment

      [Continue with detailed sections below]
      ```

26. **Generate Detailed Robustness Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Robustness Assessment

      ### Error Handling
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe current error handling implementation]

      **Best Practices Comparison:**
      - [ ] Global error handler implemented
      - [ ] Consistent error response format
      - [ ] Error logging and tracking
      - [ ] Error recovery strategies
      - [ ] Graceful degradation

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Missing input validation on UserController.Create endpoint"
        - Recommendation: "Add [Required] attributes to UserDto properties and implement FluentValidation rules. Example: [code example or reference]"
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations (even if status is COMPLETED):**
      - [Suggestion for continuous improvement]

      ### Input Validation
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe current input validation]

      **Best Practices Comparison:**
      - [ ] API endpoint validation
      - [ ] Data model validation
      - [ ] Input sanitization
      - [ ] SQL injection prevention
      - [ ] XSS prevention

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Resilience Patterns
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe current resilience patterns]

      **Best Practices Comparison:**
      - [ ] Retry mechanisms for external calls
      - [ ] Circuit breaker patterns
      - [ ] Timeout configurations
      - [ ] Rate limiting
      - [ ] Health checks

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Resource Management
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe current resource management]

      **Best Practices Comparison:**
      - [ ] Database connection pooling
      - [ ] Memory leak prevention
      - [ ] File handle management
      - [ ] Resource cleanup
      - [ ] Async/await patterns

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Concurrency & Threading
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe current concurrency handling]

      **Best Practices Comparison:**
      - [ ] Thread safety
      - [ ] Race condition prevention
      - [ ] Deadlock prevention
      - [ ] Async/await usage
      - [ ] Concurrent data structures

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

27. **Generate Detailed Test Coverage Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Test Coverage Assessment

      ### Overall Test Coverage
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      - Coverage Percentage: [X%] (if available)
      - Test Framework: [Framework name]
      - Coverage Tool: [Tool name]

      **Best Practices Comparison:**
      - [ ] >80% overall coverage
      - [ ] >90% critical path coverage
      - [ ] Coverage thresholds enforced
      - [ ] Coverage reports in CI/CD

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Coverage is 45%, target is 80%"
        - Recommendation: "Focus on business logic layer first. Add unit tests for [specific classes/modules]. Use [testing framework] with [mocking library]. Example test structure: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Unit Test Coverage
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe unit test coverage]

      **Coverage by Layer:**
      - Presentation Layer: [X%]
      - Business Layer: [X%]
      - Data Layer: [X%]

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Integration Test Coverage
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe integration test coverage]

      **Best Practices Comparison:**
      - [ ] External API integration tests
      - [ ] Database integration tests
      - [ ] Service integration tests

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### E2E Test Coverage
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe E2E test coverage]

      **Best Practices Comparison:**
      - [ ] Critical user flows tested
      - [ ] E2E test framework configured
      - [ ] Test data management

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Test Quality
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe test quality]

      **Best Practices Comparison:**
      - [ ] Test maintainability
      - [ ] Test readability
      - [ ] Test independence
      - [ ] Test speed
      - [ ] No flaky tests

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

28. **Generate Detailed Security Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Security Assessment

      ### Security Best Practices
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **OWASP Top 10 Compliance:**
      - [ ] A01:2021 – Broken Access Control
      - [ ] A02:2021 – Cryptographic Failures
      - [ ] A03:2021 – Injection
      - [ ] A04:2021 – Insecure Design
      - [ ] A05:2021 – Security Misconfiguration
      - [ ] A06:2021 – Vulnerable and Outdated Components
      - [ ] A07:2021 – Identification and Authentication Failures
      - [ ] A08:2021 – Software and Data Integrity Failures
      - [ ] A09:2021 – Security Logging and Monitoring Failures
      - [ ] A10:2021 – Server-Side Request Forgery (SSRF)

      **Current State:**
      [Describe security implementation]

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [OWASP item]: [Specific vulnerability and remediation]
        - Example: "A03:2021 – Injection: SQL queries use string concatenation"
        - Recommendation: "Replace with parameterized queries/ORM. Use [specific ORM/library]. Example: [code example showing before/after]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Authentication & Authorization
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe auth implementation]

      **Best Practices Comparison:**
      - [ ] Secure token management
      - [ ] Token expiration and refresh
      - [ ] Strong password policies
      - [ ] Secure password storage (hashing)
      - [ ] Role-based access control
      - [ ] Permission checks

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Tokens don't expire"
        - Recommendation: "Implement token expiration (15 minutes) and refresh tokens (7 days). Use [library]. Example configuration: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Data Protection
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe data protection implementation]

      **Best Practices Comparison:**
      - [ ] Data encryption at rest
      - [ ] Data encryption in transit
      - [ ] PII handling
      - [ ] Data masking
      - [ ] Key management

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Dependency Security
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe dependency security status]

      **Best Practices Comparison:**
      - [ ] Vulnerability scanning
      - [ ] Regular dependency updates
      - [ ] License compliance

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Package X version 1.2.3 has CVE-2024-12345"
        - Recommendation: "Update to version 2.0.1. Breaking changes: [list]. Migration guide: [link or steps]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

29. **Generate Detailed Monitoring Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Monitoring & Observability Assessment

      ### Logging
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      - Logging Framework: [Framework name]
      - Log Levels: [Levels used]
      - Log Aggregation: [Tool/Service]

      **Best Practices Comparison:**
      - [ ] Structured logging
      - [ ] Appropriate log levels
      - [ ] Log aggregation
      - [ ] Log retention policy
      - [ ] No sensitive data in logs
      - [ ] Performance-optimized logging

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No structured logging"
        - Recommendation: "Implement structured logging using [Serilog/NLog/etc]. Format: JSON. Include correlation IDs. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Monitoring & Metrics
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      - Monitoring Tool: [Tool name]
      - Metrics Collected: [List metrics]

      **Best Practices Comparison:**
      - [ ] Application metrics (request rate, latency, errors)
      - [ ] Business metrics
      - [ ] Infrastructure metrics
      - [ ] Health checks
      - [ ] Alerting configured
      - [ ] Dashboards available

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No application metrics collected"
        - Recommendation: "Implement Prometheus metrics. Track: request rate, latency (p50, p95, p99), error rate. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Distributed Tracing
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe distributed tracing implementation]

      **Best Practices Comparison:**
      - [ ] Request tracing
      - [ ] Correlation IDs
      - [ ] Trace sampling
      - [ ] Trace visualization

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

30. **Generate Detailed Performance Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Performance & Scalability Assessment

      ### Performance Optimizations
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe performance optimizations]

      **Best Practices Comparison:**
      - [ ] Caching strategy implemented
      - [ ] Database query optimization
      - [ ] API response optimization
      - [ ] Response compression
      - [ ] CDN usage (if applicable)
      - [ ] Lazy loading

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No caching implemented"
        - Recommendation: "Implement Redis caching for [specific data/queries]. Cache TTL: [duration]. Invalidation strategy: [strategy]. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Scalability Design
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe scalability design]

      **Best Practices Comparison:**
      - [ ] Stateless design
      - [ ] Horizontal scaling support
      - [ ] Database scaling strategy
      - [ ] Caching strategy
      - [ ] Load balancing support

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Application is stateful, preventing horizontal scaling"
        - Recommendation: "Move session state to Redis. Remove in-memory state. Use stateless design pattern. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Resource Efficiency
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe resource efficiency]

      **Best Practices Comparison:**
      - [ ] Memory optimization
      - [ ] CPU optimization
      - [ ] Network optimization
      - [ ] Storage optimization

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

31. **Generate Detailed Configuration & Deployment Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Configuration & Deployment Assessment

      ### Configuration Management
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe configuration management]

      **Best Practices Comparison:**
      - [ ] Environment-specific configuration
      - [ ] Secrets management
      - [ ] Configuration validation
      - [ ] Configuration versioning

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "Secrets hardcoded in configuration files"
        - Recommendation: "Use [Azure Key Vault/AWS Secrets Manager/HashiCorp Vault]. Migrate secrets: [list]. Update code to use: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Deployment Readiness
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      - Containerization: [Yes/No]
      - Orchestration: [Tool/None]
      - CI/CD: [Tool/None]

      **Best Practices Comparison:**
      - [ ] Containerized deployment
      - [ ] Orchestration support
      - [ ] Automated CI/CD pipeline
      - [ ] Blue-green deployment support
      - [ ] Canary deployment support
      - [ ] Rollback strategy

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No CI/CD pipeline"
        - Recommendation: "Set up GitHub Actions/Azure DevOps pipeline. Stages: build, test, security scan, deploy. Example pipeline: [YAML example or reference]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

32. **Generate Detailed Documentation & Compliance Section:**
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Documentation & Compliance Assessment

      ### Documentation
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      - API Documentation: [Available/Partial/None]
      - Architecture Documentation: [Available/Partial/None]
      - Deployment Documentation: [Available/Partial/None]

      **Best Practices Comparison:**
      - [ ] Complete API documentation
      - [ ] Architecture documentation
      - [ ] Deployment runbooks
      - [ ] Code documentation
      - [ ] README with setup instructions

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No API documentation"
        - Recommendation: "Generate OpenAPI/Swagger documentation. Use [tool/library]. Document all endpoints, request/response schemas, authentication. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]

      ### Compliance
      **Status:** [COMPLETED/PARTIAL/NOT EXISTING]

      **Current State:**
      [Describe compliance status]

      **Best Practices Comparison:**
      - [ ] GDPR compliance (if applicable)
      - [ ] Data retention policies
      - [ ] Audit logging
      - [ ] Privacy policies
      - [ ] Industry-specific compliance

      **Gaps & Recommendations:**
      
      **Priority: [HIGH/MEDIUM/LOW]**
      - [Gap description]: [Specific recommendation with actionable steps]
        - Example: "No GDPR compliance measures"
        - Recommendation: "Implement: data retention policies, right to deletion, consent management, audit logging. Use [tools/frameworks]. Example: [code example]"
      
      **Improvement Recommendations:**
      - [Suggestion for continuous improvement]
      ```

33. **Generate Recommendations Summary:**
    * **IMPORTANT:** Extract all recommendations from all sections above and organize by priority.
    * For each recommendation, include:
      - Section/category it belongs to
      - Specific issue/gap
      - Actionable steps to resolve
      - Estimated effort (if possible)
      - Dependencies (if any)
    * Add to `.cursor/onboarding-docs/PRODUCTION_READINESS.md`:

      ```markdown
      ## Critical Recommendations Summary

      ### High Priority (Must Address Before Production)
      
      **1. [Category]: [Issue Title]**
      - **Issue:** [Brief description]
      - **Impact:** [Why this is critical]
      - **Recommendation:** [Specific actionable steps]
      - **Example/Reference:** [Code example, tool, or documentation link]
      - **Estimated Effort:** [Time estimate]
      
      **2. [Category]: [Issue Title]**
      [Repeat format above]
      
      ### Medium Priority (Should Address Soon)
      
      **1. [Category]: [Issue Title]**
      - **Issue:** [Brief description]
      - **Impact:** [Why this matters]
      - **Recommendation:** [Specific actionable steps]
      - **Example/Reference:** [Code example, tool, or documentation link]
      - **Estimated Effort:** [Time estimate]
      
      [Continue for all medium priority items]
      
      ### Low Priority (Future Improvements)
      
      **1. [Category]: [Issue Title]**
      - **Issue:** [Brief description]
      - **Recommendation:** [Specific actionable steps]
      - **Example/Reference:** [Code example, tool, or documentation link]
      
      [Continue for all low priority items]
      
      ### Recommendations by Category
      
      **Robustness:**
      - [Count] high priority, [Count] medium priority, [Count] low priority
      - [List key recommendations]
      
      **Test Coverage:**
      - [Count] high priority, [Count] medium priority, [Count] low priority
      - [List key recommendations]
      
      **Security:**
      - [Count] high priority, [Count] medium priority, [Count] low priority
      - [List key recommendations]
      
      [Continue for all categories]

      ## Production Readiness Score

      **Overall Score:** [X/100]

      **Breakdown:**
      - Robustness: [X/20]
      - Test Coverage: [X/20]
      - Security: [X/20]
      - Monitoring: [X/15]
      - Performance: [X/15]
      - Configuration & Deployment: [X/10]

      **Recommendation:** [Ready for Production/Needs Work/Not Ready]
      ```

## PART J: Update Master File & Complete

34. **Update Master File (Parallel-Safe):**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Add a new section:

      ```markdown
      ## Production Readiness
      See [PRODUCTION_READINESS.md](.cursor/onboarding-docs/PRODUCTION_READINESS.md) for detailed production readiness assessment.
      
      **Overall Status:** [Ready/Partial/Not Ready]
      **Readiness Score:** [X/100]
      **Critical Issues:** [Count]
      ```
    * Write the updated content to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

35. **Progress Report:**
    * Report completion status:
      - Production readiness score
      - Number of completed items
      - Number of partial items
      - Number of missing items
      - Critical recommendations count

36. **Update Step Completion Status:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 10 - Assess Production Readiness" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 10 marked as complete.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

37. **Completion:**
    * Tell the user that Production Readiness Assessment is complete.
    * Report the overall readiness status and key findings.
    * Highlight critical recommendations that must be addressed before production.

**Proceed with all steps above (Parts A through J).**

