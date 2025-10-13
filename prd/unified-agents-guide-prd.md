# Project Requirements Document (PRD)
## Unified Agents.md Guide Project

**Status**: APPROVED  
**Feature Branch**: unified-agents-guide  
**Created**: 2025-06-17  
**Updated**: 2025-06-17  

### Project Context
Create a comprehensive unified agents.md guide that directs all future Factory.ai droids and custom droids on design patterns, coding approaches, and methodology.

### Problem Statement
Currently lacking a standardized guide for droids to follow consistent patterns, leading to potential inconsistencies in code quality, testing approaches, and project management methodology.

### Project Goals
1. Establish unified coding standards and conventions for all droids
2. Define project management methodology using AI dev tasks workflow
3. Specify testing methodology with TDD and comprehensive coverage requirements
4. Create modular, reusable code patterns
5. Define task delegation approaches for droids
6. **NEW**: Establish shadcn/ui as the primary component library with extensive usage

### Non-Goals
- Create actual code implementations
- Set up development infrastructure for this project
- Docker deployment (this is just a file)

### Constraints & Requirements
- Target audience: Factory.ai droids and custom droids only
- Language: TypeScript (.tsx/.ts) preferred
- Stack: Next.js 15, Node 24, Drizzle + Postgres 18, tRPC + TanStack Query, Valkey 8, Better Auth
- **NEW**: Component Library: shadcn/ui with extensive usage
- **NEW**: shadcn blocks available via CLI with API key in environment
- File limits: ≤300 LOC, functions ≤50 LOC, parameters ≤5, cyclomatic complexity ≤10
- Testing coverage: 90-100% (unit, integration, e2e)
- Task management: One task list per PRD/feature branch

### Guiding Principles

This guide is a living document, not a rigid set of rules. Droids should adhere to the following principles to balance consistency with the flexibility required for effective problem-solving.

1.  **Simplicity Above All**: Make every task and code change as simple as possible. Avoid complexity and impact the minimum amount of code necessary. When in doubt, choose the simpler solution.
2.  **Iterative Development (MVG)**: Start with a Minimum Viable Guide (MVG) and expand it iteratively. The goal is to deliver value quickly and refine the guide based on real-world application, rather than perfecting it before release.
3.  **Embrace Flexibility**: The patterns herein are guidelines, not immutable laws. Droids should have the autonomy to deviate when a clearly better, simpler, or more efficient solution presents itself. Such deviations should be documented via an Architecture Decision Record (ADR).
4.  **Clear Communication**: Use visual flow diagrams (ASCII art) and concise explanations to communicate complex concepts. Clarity is more important than jargon.

### Key Features to Include
1. **Project Management Methodology**
   - AI dev tasks workflow (PRD per feature branch)
   - Task list generation and maintenance
   - Feature branch independence

2. **Coding Standards**
   - Heavily modularized code approach
   - Reuse patterns (check existing modules first)
   - TypeScript conventions
   - Component-specific styles co-location
   - **NEW**: shadcn/ui integration patterns and best practices

3. **Testing Methodology**
   - Test-driven development
   - Comprehensive coverage requirements
   - Deterministic, independent tests
   - Regression testing for bug fixes

4. **Deployment Guidelines**
   - Dev: Docker with hot reload mounts
   - Production: Single Docker stack behind Nginx

5. **Core Agent Workflow & Mindset**
   - **Getting Started**: A quick-start guide for new droids, outlining the first five steps to becoming operational: 1. Read Guiding Principles, 2. Understand Core Tools, 3. Review Project Structure, 4. Execute a "Hello World" Task, 5. Learn the Human Escalation Protocol.
   - **Senior Engineer Thinking**: Emulate a senior engineer's thought process: define the problem, propose a simple solution, review the impact, and refactor as needed. Always evaluate multiple approaches.
   - **Human Escalation Protocol**: A clear protocol for when to request human assistance. Droids should escalate if:
     - Ambiguity in the PRD cannot be resolved after two attempts.
     - A task is blocked for more than three cycles due to external dependencies.
     - A proposed solution involves significant architectural changes or deviations from established patterns (and requires an ADR).
     - Conflicting instructions are received.

6. **NEW**: shadcn/ui Component Guidelines**
   - Extensive usage patterns
   - CLI integration for blocks
   - Customization approaches
   - Integration with existing design system

### Success Criteria
- Comprehensive agents.md guide created covering all specified sections
- Clear patterns for droid task delegation and coordination
- Established methodology for AI dev tasks workflow integration
- shadcn/ui integration patterns documented
- All guidelines are actionable and specific to Factory.ai droids

### Dependencies
- Factory.ai droid ecosystem access
- shadcn/ui CLI with API key configuration
- AI dev tools workflow templates and patterns
