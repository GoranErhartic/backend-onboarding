---
title: "05 - Analyze Configuration & Testing"
description: "Analyze Configuration & Testing Strategy - can run in parallel with other analysis steps"
author: "Goran Erhartic"
---

Analyze configuration management, environment variables, environment-specific settings, testing approach, test structure, and how to run tests.
**This step can be run independently or in parallel with other steps.**
**DO NOT MODIFY ANY EXISTING CODE.**

**CRITICAL - Parallel Execution & File Writes:**
* All file writes MUST be written directly to disk using file write tools (not staged/suggested edits).
* When updating `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, ALWAYS re-read the file first to get the latest state from any parallel sessions.
* If changes are staged and not applied, other parallel sessions will not see them and may overwrite work.
* This step marks itself as `[P]` (in progress) at the start to prevent duplicate execution.

EXECUTION PLAN:

## PART A: Configuration & Environment Management

0.  **Mark Command as In Progress [P]:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If it exists:** 
        * Read it to get the current Step Completion Status.
        * Update the Step Completion Status section to mark "Step 5 - Configuration & Testing" as `[P]` (in progress).
        * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * **If it doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

1.  **Check for Initialization:**
    * Check if `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` exists.
    * **If file doesn't exist:** Report error and stop. User must run `/onboarding/initialize` first.

2.  **Read Master File:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.
    * Review the stack analysis and key project files to identify configuration files (if available).

3.  **Identify Configuration Files:**
    * Based on stack analysis, identify configuration files:
      - **ASP.NET Core:** `appsettings.json`, `appsettings.{Environment}.json`, `.env`
      - **Node.js:** `.env`, `config/`, `config.json`
      - **Python:** `.env`, `settings.py`, `config.py`, `config/`
      - **Java/Spring:** `application.properties`, `application.yml`, `application-{profile}.properties`
      - **Go:** `.env`, `config/`, configuration structs
    * Use `glob_file_search` to find configuration files:
      - `appsettings*.json`, `.env*`, `config.*`, `settings.*`, `application.*`

3.  **Analyze Configuration Structure:**
    * Read identified configuration files.
    * Document:
      - Configuration sections/categories
      - Environment variables used
      - Configuration hierarchy (default → environment-specific)
      - Configuration loading order

4.  **Identify Environment Variables:**
    * Extract all environment variables referenced in:
      - Configuration files
      - Code (using `grep` for patterns like `process.env|Environment.GetEnvironmentVariable|os.Getenv`)
      - Docker files
      - Deployment scripts
    * For each environment variable:
      - Document name
      - Document purpose/description
      - Document if it's required or optional
      - Document default value (if any)
      - Document which environments it's used in

5.  **Analyze Environment-Specific Settings:**
    * Identify environment-specific configurations:
      - Development settings
      - Staging settings
      - Production settings
      - Test settings
    * Document differences between environments:
      - Database connections
      - API endpoints
      - Feature flags
      - Logging levels
      - Security settings

6.  **Identify Secrets Management:**
    * Use `codebase_search` to find:
      - How secrets are managed (Azure Key Vault, AWS Secrets Manager, HashiCorp Vault, etc.)
      - How sensitive data is stored
      - Secrets rotation mechanisms
    * Document:
      - Secrets management approach
      - Where secrets are stored
      - How secrets are accessed

7.  **Identify Feature Flags:**
    * Search for feature flag implementations:
      - `FeatureFlag|feature-flag|FeatureToggle|feature-toggle`
      - Configuration-based feature flags
    * Document:
      - Feature flags used
      - How they're configured
      - How they're checked in code

8.  **Analyze Deployment Configuration:**
    * Review deployment-related configuration:
      - Docker configuration (`Dockerfile`, `docker-compose.yml`)
      - Kubernetes configuration (`k8s/`, `kubernetes/`)
      - CI/CD configuration (`.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`)
    * Document:
      - Container configuration
      - Environment provisioning
      - Configuration injection in deployment

## PART B: Testing Strategy

9.  **Identify Test Files and Structure:**
    * Use `glob_file_search` to find test files:
      - **C#/.NET:** `*Test*.cs`, `*Tests.cs`, `*.Tests/`
      - **Node.js:** `*.test.js`, `*.spec.js`, `__tests__/`
      - **Python:** `test_*.py`, `*_test.py`, `tests/`
      - **Java:** `*Test.java`, `*Tests.java`, `src/test/`
      - **Go:** `*_test.go`
    * Identify test directory structure:
      - Test organization (by feature, by type, etc.)
      - Test file naming conventions
      - Test directory hierarchy

10. **Identify Test Types:**
    * Use `codebase_search` to understand test types:
      - Query: "What types of tests exist? Unit tests, integration tests, e2e tests?"
    * Use `grep` to identify test types:
      - **Unit Tests:** `[Fact]`, `[Test]`, `test(`, `it(`, `describe(`
      - **Integration Tests:** `[IntegrationTest]`, `IntegrationTest`, `integration`
      - **E2E Tests:** `[E2ETest]`, `e2e`, `end-to-end`, `cypress`, `playwright`
    * Document:
      - Unit test locations and patterns
      - Integration test locations and patterns
      - E2E test locations and patterns
      - Other test types (performance, load, etc.)

11. **Identify Test Frameworks:**
    * Based on stack analysis and test files:
      - **C#/.NET:** xUnit, NUnit, MSTest, Moq, NSubstitute
      - **Node.js:** Jest, Mocha, Jasmine, Vitest
      - **Python:** pytest, unittest, nose
      - **Java:** JUnit, TestNG, Mockito
      - **Go:** testing package, testify
    * Document:
      - Testing framework used
      - Mocking libraries used
      - Assertion libraries used
      - Test runners used

12. **Analyze Test Coverage:**
    * Look for test coverage reports:
      - Coverage configuration files (`.coveragerc`, `coverage.json`)
      - Coverage reports (`coverage/`, `htmlcov/`)
      - CI/CD coverage reporting
    * Document:
      - Coverage tools used
      - Coverage thresholds (if configured)
      - Areas with good coverage
      - Areas with limited coverage

13. **Analyze Mocking Strategies:**
    * Use `grep` to find mocking patterns:
      - `Mock|mock|Mockito|Moq|sinon|jest.mock`
    * Document:
      - What is mocked (databases, external APIs, services)
      - Mocking patterns used
      - Test data management

14. **Identify Test Execution:**
    * Look for test execution scripts:
      - `package.json` scripts (`test`, `test:unit`, `test:integration`)
      - Makefile targets
      - Test runner configurations
      - CI/CD test execution
    * Document:
      - How to run all tests
      - How to run specific test types
      - How to run tests in watch mode
      - Test execution in CI/CD

15. **Analyze Test Data Management:**
    * Identify how test data is managed:
      - Test fixtures
      - Test databases
      - Seed data
      - Test data factories
    * Document:
      - Test data setup/teardown
      - Test isolation strategies
      - Test data factories/builders

## PART C: Generate Documentation

16. **Generate Configuration Documentation:**
    * Create `.cursor/onboarding-docs/CONFIGURATION.md` with the following structure:

      ```markdown
      # Configuration & Environment Management

      ## Configuration Files

      ### Primary Configuration Files
      [List and describe main configuration files]

      ### Environment-Specific Files
      [List environment-specific configuration files]

      ## Configuration Structure

      [Document the structure of configuration files, sections, and categories]

      ## Environment Variables

      ### Required Environment Variables
      | Variable Name | Description | Default | Environments |
      |--------------|-------------|---------|--------------|
      | [VAR_NAME] | [Description] | [Default] | [dev/staging/prod] |

      ### Optional Environment Variables
      [List optional environment variables]

      ## Environment-Specific Settings

      ### Development
      [Document development-specific settings]

      ### Staging
      [Document staging-specific settings]

      ### Production
      [Document production-specific settings]

      ## Secrets Management

      [Document how secrets are managed]

      ## Feature Flags

      [List feature flags and their purposes]

      ## Configuration Loading

      [Document how configuration is loaded and in what order]

      ## Deployment Configuration

      [Document deployment-related configuration]

      ## Setup Instructions

      [Document how to set up configuration for local development]

      ## Notes
      [Any additional configuration observations]
      ```

17. **Generate Testing Documentation:**
    * Create `.cursor/onboarding-docs/TESTING.md` with the following structure:

      ```markdown
      # Testing Strategy

      ## Test Structure

      [Describe how tests are organized]

      ## Test Types

      ### Unit Tests
      [Describe unit tests, location, patterns]

      ### Integration Tests
      [Describe integration tests, location, patterns]

      ### E2E Tests
      [Describe e2e tests, location, patterns]

      ## Test Frameworks

      [List testing frameworks and libraries used]

      ## Running Tests

      ### Run All Tests
      [Command to run all tests]

      ### Run Unit Tests
      [Command to run unit tests only]

      ### Run Integration Tests
      [Command to run integration tests only]

      ### Run E2E Tests
      [Command to run e2e tests only]

      ### Watch Mode
      [Command to run tests in watch mode]

      ## Test Coverage

      [Document test coverage approach and tools]

      ## Mocking Strategy

      [Describe what is mocked and how]

      ## Test Data Management

      [Describe how test data is managed]

      ## CI/CD Testing

      [Document how tests run in CI/CD]

      ## Writing New Tests

      [Guidelines for writing new tests]

      ## Notes
      [Any additional testing observations]
      ```

18. **Update Master File (Parallel-Safe):**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again (to get the latest state from any parallel sessions).
    * **Update only if section is empty or marked as placeholder** - do not overwrite existing content from parallel sessions.
    * Find the `## Configuration` section and update with:
      ```markdown
      ## Configuration
      See [CONFIGURATION.md](.cursor/onboarding-docs/CONFIGURATION.md) for detailed configuration documentation.
      
      **Configuration Files:** [List main files]
      **Required Environment Variables:** [Count]
      **Environments:** [List environments: dev, staging, prod]
      **Secrets Management:** [Brief description]
      ```
    * Find the `## Testing` section and replace with:
      ```markdown
      ## Testing
      See [TESTING.md](.cursor/onboarding-docs/TESTING.md) for detailed testing documentation.
      
      **Test Framework:** [Framework name]
      **Test Types:** [List: Unit, Integration, E2E]
      **Coverage Tool:** [Coverage tool if applicable]
      **Run Tests:** [Command to run tests]
      ```
    * Write the updated content to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`, preserving all other sections and content from parallel sessions.

19. **Progress Report:**
    * Report completion status:
      - Number of configuration files identified
      - Number of environment variables identified
      - Number of environments identified
      - Test framework identified
      - Number of test types identified
      - Test execution commands documented

20. **Update Step Completion Status:**
    * Read `.cursor/onboarding-docs/CURSOR-ONBOARDING.md` again to get the latest state.
    * **Update the Step Completion Status section** to mark "Step 5 - Configuration & Testing" as `[x]` (complete).
    * If the Step Completion Status section doesn't exist, add it with Step 5 marked as complete.
    * Write the updated content back to `.cursor/onboarding-docs/CURSOR-ONBOARDING.md`.

21. **Completion:**
    * Tell the user that Step 5 is complete.
    * **Note:** Other steps can now be run independently or in parallel:
      - `/onboarding/analyze-integrations` - Analyze integrations & error handling (can run in parallel)
      - `/onboarding/analyze-domain-and-performance` - Analyze domain, API contracts & performance (can run in parallel)

**Proceed with all steps above (Parts A, B, and C).**
