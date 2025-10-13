# Unified Agents Guide

**Purpose**: Comprehensive guide for Factory.ai droids and custom droids on coding standards, project management, testing methodology, and development workflows.

**Target Audience**: Factory.ai droids and custom droids exclusively  
**Version**: 1.0.0 - MVG (Minimum Viable Guide)  
**Last Updated**: 2025-06-17  

---

## Table of Contents

### 🏗️ FOUNDATIONAL LAYER
1. [Guiding Principles](#1-guiding-principles)
2. [Getting Started](#2-getting-started)
3. [Core Agent Workflow & Mindset](#3-core-agent-workflow--mindset)

### 💻 CORE SKILLS LAYER
4. [Technology Stack Overview](#4-technology-stack-overview)
5. [Coding Standards & Best Practices](#5-coding-standards--best-practices)
6. [Testing Methodology](#6-testing-methodology)

### ⚙️ OPERATIONAL LAYER
7. [Project Management Workflow](#7-project-management-workflow)
8. [Modular Code Patterns](#8-modular-code-patterns)
9. [Droid Coordination & Delegation](#9-droid-coordination--delegation)

### 🔧 SUPPORT LAYER
10. [Deployment Patterns](#10-deployment-patterns)
11. [Security Guidelines](#11-security-guidelines)
12. [Troubleshooting & FAQ](#12-troubleshooting--faq)

---

## 1. Guiding Principles

This guide is a living document, not a rigid set of rules. Droids should adhere to the following principles to balance consistency with the flexibility required for effective problem-solving.

### 1.1 Simplicity Above All
- Make every task and code change as simple as possible
- Avoid complexity and impact the minimum amount of code necessary
- When in doubt, choose the simpler solution
- Prefer explicit code over hidden "magic"

### 1.2 Iterative Development (MVG)
- Start with a Minimum Viable Guide (MVG) and expand it iteratively
- Deliver value quickly and refine based on real-world application
- Perfect is the enemy of good - focus on working solutions first
- Use feedback loops to improve incrementally

### 1.3 Embrace Flexibility
- The patterns herein are guidelines, not immutable laws
- Autonomy to deviate when a clearly better, simpler, or more efficient solution presents itself
- Document deviations via an Architecture Decision Record (ADR)
- Balance consistency with pragmatic problem-solving

#### Architecture Decision Records (ADRs)

ADRs are lightweight documentation for significant architectural decisions. Use ADRs when:

- **Deviating from established patterns** with clear justification
- **Making technology stack changes** that affect multiple components
- **Implementing breaking changes** to APIs or interfaces
- **Choosing between major architectural alternatives**
- **Addressing security or performance concerns** with architectural impact

**ADR Process**:
1. **Create**: Use the ADR template in `docs/adr/template.md`
2. **Document**: Record context, decision, and consequences
3. **Review**: Peer review by at least one other droid or human
4. **Store**: Save in `docs/adr/` with sequential numbering
5. **Reference**: Link to ADR in relevant code comments and documentation

**ADR Template Structure**:
```markdown
# ADR-[Number]: [Title]

## Status
[Proposed/Accepted/Rejected/Deprecated]

## Context
[What is the issue or problem that requires a decision?]

## Decision
[What is the change that we're proposing and/or doing?]

## Consequences
[What becomes easier or more difficult to do because of this change?]

## References
[Links to relevant discussions, issues, or documentation]
```

### 1.4 Clear Communication
- Use visual flow diagrams (ASCII art) and concise explanations
- Clarity is more important than jargon
- Document decisions and their rationale
- Provide concrete examples for abstract concepts

---

## 2. Getting Started

### 2.1 First Five Steps to Becoming Operational

1. **Read Guiding Principles** - Understand the core philosophy and approach
2. **Understand Core Tools** - Familiarize yourself with the technology stack
3. **Review Project Structure** - Learn the organization patterns and conventions
4. **Execute a "Hello World" Task** - Complete a simple task to validate understanding
5. **Learn the Human Escalation Protocol** - Know when and how to request human assistance

### 2.2 Core Tools Setup

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Development   │    │    Testing      │    │   Deployment    │
│   Environment   │───▶│   Framework     │───▶│   Pipeline      │
│                 │    │                 │    │                 │
│ • Next.js 15    │    │ • Jest/Vitest    │    │ • Docker        │
│ • TypeScript    │    │ • Testing Lib   │    │ • Nginx         │
│ • tRPC          │    │ • E2E Testing   │    │ • Production    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2.3 Project Structure Understanding

```
project-root/
├── src/
│   ├── components/          # Reusable UI components
│   ├── lib/                # Utility functions and configurations
│   ├── server/             # Server-side code (tRPC routers)
│   └── types/              # TypeScript type definitions
├── tests/                  # Test files
├── docs/                   # Documentation
├── prd/                    # Project Requirements Documents
├── tasks/                  # Task lists per PRD/feature branch
└── agents.md               # This guide
```

---

## 3. Core Agent Workflow & Mindset

### 3.1 Senior Engineer Thinking

Emulate a senior engineer's thought process:
1. **Define the problem** - Understand what needs to be solved
2. **Propose a simple solution** - Start with the most straightforward approach
3. **Review the impact** - Consider consequences and side effects
4. **Refactor as needed** - Improve the solution based on findings
5. **Always evaluate multiple approaches** - Consider alternatives before deciding

### 3.2 Standard Task Workflow

For most tasks, follow this 4-step pattern:

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Research   │───▶│  Analysis   │───▶│ Definition  │───▶│  Creation   │
│             │    │             │    │             │    │             │
│ • Gather    │    │ • Identify  │    │ • Define    │    │ • Implement │
│   context   │    │   patterns  │    │   approach  │    │   solution  │
│ • Understand│    │ • Find gaps  │    │ • Create    │    │ • Validate  │
│   scope     │    │ • Analyze   │    │   plan      │    │   results   │
│             │    │   issues    │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

### 3.3 Fast-Track Workflow for Simple Tasks

Use this condensed workflow for simple tasks that meet specific criteria:

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Understand  │───▶│ Implement   │───▶│   Verify    │
│             │    │             │    │             │
│ • Quick     │    │ • Direct    │    │ • Validate  │
│   assessment│    │   execution │    │   results   │
│ • Confirm   │    │ • Minimal   │    │ • Test      │
│   scope     │    │   changes  │    │   outcomes  │
└─────────────┘    └─────────────┘    └─────────────┘
```

#### 3.3.1 Simple Task Criteria Matrix

**A task qualifies for Fast-Track Workflow if it meets ALL of the following criteria:**

| Criteria | Requirement | Examples |
|----------|-------------|----------|
| **File Scope** | Single file modification | Fix typo in README, update one component |
| **Logic Complexity** | No business logic changes | Add comments, fix formatting, update imports |
| **Risk Level** | Low risk of breaking existing functionality | Documentation updates, style fixes |
| **Dependencies** | No new external dependencies | Update internal config, change constant values |
| **Test Impact** | No new test requirements needed | Fix existing test, update documentation |
| **Rollback** | Simple to undo if issues arise | Single file change, clear revert path |

#### 3.3.2 Task Type Classifications

**✅ Qualifies for Fast-Track:**
- **Documentation fixes**: Typos, grammar corrections, README updates
- **Configuration updates**: Change constant values, update config files
- **Style and formatting**: Prettier fixes, code formatting, comment additions
- **Simple test additions**: Add missing test case for existing function
- **Minor bug fixes**: Clear one-line fixes with obvious solutions
- **Import/Export updates**: Add/remove imports, fix circular dependencies

**❌ Requires Standard Workflow:**
- **New feature implementation**: Multiple files, business logic changes
- **API changes**: Endpoint modifications, data structure changes
- **Database schema changes**: Migrations, table modifications
- **Security updates**: Authentication changes, permission modifications
- **Performance optimizations**: Algorithm changes, caching strategies
- **Major refactoring**: Multiple component changes, architecture modifications

#### 3.3.3 Decision Tree for Workflow Selection

```
┌─────────────────┐
│  Start Task     │
│  Assessment     │
└─────────┬───────┘
          │
    Is it a single file? ──No─┐
          │                │
          Yes              │ Use Standard
          │           4-Step Workflow
    Is there business logic? ──Yes─┐
          │                      │
          No                     │
          │                      │
    Are there external dependencies? ──Yes─┐
          │                              │
          No                             │
          │                              │
    Is risk of breaking changes LOW? ──Yes─┐
          │                                  │
          Yes                                 │
          │                                  │
          ▼                                  ▼
   ┌─────────────┐                   ┌─────────────┐
   │ USE FAST-   │                   │ USE STANDARD │
   │ TRACK       │                   │ WORKFLOW     │
   │ WORKFLOW    │                   │ (4 steps)    │
   └─────────────┘                   └─────────────┘
```

#### 3.3.4 Fast-Track Workflow Examples

**Example 1: Documentation Fix**
- **Task**: Fix typo in section 3.2 of agents.md
- **Qualification**: ✅ Single file, no logic, low risk, no dependencies
- **Workflow**: Understand (fix typo) → Implement (edit file) → Verify (check result)

**Example 2: Configuration Update**
- **Task**: Update API timeout from 5000ms to 10000ms in config.ts
- **Qualification**: ✅ Single file, no logic change, low risk, no new deps
- **Workflow**: Understand (update timeout) → Implement (change value) → Verify (test functionality)

**Example 3: Test Addition**
- **Task**: Add test case for existing function `calculateTotal()`
- **Qualification**: ✅ Single test file, no logic changes, low risk, no new deps
- **Workflow**: Understand (add missing test) → Implement (write test) → Verify (run tests)

**Example 4: Import Fix**
- **Task**: Remove unused import in component.tsx
- **Qualification**: ✅ Single file, no logic change, low risk, no new deps
- **Workflow**: Understand (remove unused import) → Implement (delete line) → Verify (check compilation)

#### 3.3.5 Fast-Track Validation Checklist

Before using Fast-Track Workflow, verify:
- [ ] **Single File**: Task involves only one file modification
- [ ] **No Business Logic**: No changes to business rules or algorithms
- [ ] **Low Risk**: Minimal chance of breaking existing functionality
- [ ] **No New Dependencies**: No additional packages or external services
- [ ] **Simple Rollback**: Easy to undo changes if needed
- [ ] **Clear Requirements**: Task scope is well-defined and unambiguous

#### 3.3.6 Common Fast-Track Anti-Patterns

**Avoid Fast-Track for these disguised simple tasks:**
- **"Simple" config changes** that affect multiple systems
- **"Quick" bug fixes** that require understanding complex logic
- **"Minor" documentation changes** that update API contracts
- **"Small" refactoring** that changes component interfaces
- **"Easy" test additions** that require complex mocking

When in doubt, use the Standard 4-Step Workflow to ensure thorough analysis and prevent unintended consequences.

### 3.4 Human Escalation Protocol

Request human assistance if:
- **Ambiguity in the PRD cannot be resolved after two attempts**
- **A task is blocked for more than three cycles due to external dependencies**
- **A proposed solution involves significant architectural changes or deviations from established patterns** (requires an ADR)
- **Conflicting instructions are received**

**Escalation Process**:
1. Document the issue and attempted solutions
2. Gather all relevant context and error messages
3. Prepare specific questions for human review
4. Submit escalation with clear priority level

---

## 4. Technology Stack Overview

### 4.1 Core Technologies

- **Next.js 15**: React framework with App Router
- **TypeScript**: Type-safe JavaScript
- **tRPC**: End-to-end typesafe APIs
- **TanStack Query**: Server state management
- **Drizzle ORM**: Type-safe SQL toolkit
- **PostgreSQL 18**: Primary database
- **Valkey 8**: Caching and session storage
- **Better Auth**: Authentication solution
- **shadcn/ui**: Component library with extensive usage

### 4.2 Development Environment

- **Docker**: Containerized development with hot reload mounts
- **Node 24**: JavaScript runtime
- **pnpm**: Package manager (preferred)
- **ESLint/Prettier**: Code quality and formatting

### 4.3 Production Environment

- **Docker**: Hardened distroless containers
- **Nginx**: Reverse proxy and load balancer
- **PostgreSQL**: Production database
- **Valkey**: Production cache

---

## 5. Coding Standards & Best Practices

### 5.1 TypeScript Standards

#### 5.1.1 Core Principles

**Context**: Establish consistent TypeScript patterns for Factory.ai droids that prioritize type safety, maintainability, and cognitive simplicity.

**Key Concepts**:
- **Type Safety**: Leverage TypeScript's type system to catch errors at compile time
- **Explicit Typing**: Avoid `any` and use explicit types wherever possible
- **Interface over Type**: Prefer interfaces for object shapes that may be extended
- **Utility Types**: Use built-in utility types (Partial, Required, Pick, Omit) effectively
- **Function Parameters**: Limit to ≤5 parameters following established constraints

#### 5.1.2 Implementation Guidelines

1. **Interface Definitions**: Define clear, descriptive interfaces for all data structures
2. **Function Signatures**: Use explicit return types and parameter types
3. **Error Handling**: Use discriminated unions for error states
4. **Async Patterns**: Prefer async/await over Promise chains
5. **Generic Types**: Use generics for reusable components and utilities

#### 5.1.3 Code Example

```typescript
// === Section 5.1: Component Interface Definition ===
// Context: Standard pattern for component props in React/Next.js
// Prerequisites: Understanding of React props and TypeScript interfaces

import React, { useState } from 'react';

interface ComponentProps {
  id: string; // Unique identifier for the component
  title: string; // Display title for the component
  isActive?: boolean; // Optional flag for active state
  onSubmit?: (data: FormData) => Promise<void>; // Optional submit handler
  children?: React.ReactNode; // Optional child elements
}

export const MyComponent: React.FC<ComponentProps> = ({
  id,
  title,
  isActive = false,
  onSubmit,
  children,
}) => {
  // Component implementation follows established patterns
  const [loading, setLoading] = useState(false);
  
  const handleSubmit = async (data: FormData) => {
    if (!onSubmit) return;
    
    setLoading(true);
    try {
      await onSubmit(data);
    } catch (error) {
      // Error handling follows Section 5.3 patterns
      console.error('Submit failed:', error);
    } finally {
      setLoading(false);
    }
  };
  
  return (
    <div className={`component ${isActive ? 'active' : ''}`}>
      <h2>{title}</h2>
      {children}
    </div>
  );
};

// Usage Example:
// <MyComponent id="123" title="My Title" onSubmit={handleSubmit} />
```

#### 5.1.4 Validation Checklist

- [ ] All functions have explicit return types
- [ ] Interfaces are used over type aliases for object shapes
- [ ] No usage of `any` type without explicit justification
- [ ] Function parameters limited to ≤5 (use parameter objects if needed)
- [ ] Async functions use proper error handling patterns
- [ ] Generic types are properly constrained where applicable
- [ ] Utility types are used to reduce code duplication

#### 5.1.5 Common Issues & Solutions

- **Issue**: Overly complex type definitions
  - **Solution**: Break down complex types into smaller, composable interfaces
- **Issue**: Missing return types on functions
  - **Solution**: Always specify return types, even if inferred
- **Issue**: Excessive use of optional properties
  - **Solution**: Use required properties with default values where appropriate

#### 5.1.6 Related Sections
- Section 5.2: Code organization and file structure patterns
- Section 5.6: shadcn/ui integration with TypeScript
- Section 6.1: Testing TypeScript code patterns

#### 5.1.7 Droid Delegation Notes
- **Recommended Droid**: typescript-integration-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 2-3 hours for comprehensive section
- **Prerequisites**: Understanding of TypeScript basics and React patterns

### 5.2 Code Organization

#### 5.2.1 Naming Conventions

**Context**: Establish consistent naming patterns for Factory.ai droids to reduce cognitive load and improve code maintainability.

**File Naming Rules**:
- **Components**: `PascalCase.tsx` (UserProfile.tsx, ProductCard.tsx)
- **Hooks**: `use-kebab-case.ts` (use-mobile.ts, use-toast.ts)
- **Utilities**: `lowercase.ts` (utils.ts, helpers.ts)
- **Types**: `lowercase.ts` (user.ts, product.ts)
- **Services**: `kebab-case.service.ts` (auth.service.ts, data.service.ts)
- **Constants**: `lowercase.ts` (constants.ts, config.ts)
- **Tests**: `filename.test.ts` (UserProfile.test.ts)
- **Stories**: `ComponentName.stories.tsx` (UserProfile.stories.tsx)

**Variable Naming Rules**:
```typescript
// Functions and Variables: camelCase
const getUserData = async (userId: string) => { /* ... */ };
const isActive = true;

// Constants: UPPER_SNAKE_CASE
const API_BASE_URL = 'https://api.example.com';
const MAX_RETRIES = 3;

// Classes and Interfaces: PascalCase
class UserService { /* ... */ }
interface UserProfileProps { /* ... */ }

// Components: PascalCase
export const NavigationBar: React.FC = () => { /* ... */ };

// Hooks: use prefix
const useMobile = () => { /* ... */ };
```

#### 5.2.2 Directory Structure

**Standard Project Organization**:
```
project-root/
├── src/
│   ├── app/                    # Next.js App Router pages
│   │   ├── (auth)/            # Route groups
│   │   ├── api/               # API routes
│   │   ├── globals.css        # Global styles
│   │   ├── layout.tsx         # Root layout
│   │   └── page.tsx           # Home page
│   ├── components/
│   │   ├── ui/                # Reusable UI components
│   │   │   ├── button.tsx
│   │   │   ├── input.tsx
│   │   │   └── index.ts       # Barrel export
│   │   ├── features/          # Feature-specific components
│   │   │   ├── auth/
│   │   │   └── dashboard/
│   │   └── layout/            # Layout components
│   │       ├── header.tsx
│   │       └── sidebar.tsx
│   ├── lib/                   # Utilities and configurations
│   │   ├── utils.ts
│   │   ├── constants.ts
│   │   └── validations.ts
│   ├── hooks/                 # Custom React hooks
│   │   ├── use-mobile.ts
│   │   ├── use-auth.ts
│   │   └── index.ts
│   ├── types/                 # TypeScript type definitions
│   │   ├── user.ts
│   │   ├── api.ts
│   │   └── index.ts
│   ├── services/              # API and business logic
│   │   ├── auth.service.ts
│   │   ├── user.service.ts
│   │   └── index.ts
│   └── stores/                # State management
│       ├── auth.store.ts
│       └── user.store.ts
├── tests/                     # Test files
│   ├── __mocks__/            # Mock files
│   ├── setup.ts              # Test setup
│   └── utils.test.ts
├── docs/                      # Documentation
├── docs/adr/                  # Architecture Decision Records
└── public/                    # Static assets
```

#### 5.2.3 Import Organization

**Import Structure** (order matters):
```typescript
// 1. React and Next.js imports
import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';

// 2. Third-party libraries
import { z } from 'zod';
import { clsx } from 'clsx';

// 3. Internal imports (absolute paths)
import { Button } from '@/components/ui/button';
import { useAuth } from '@/hooks/use-auth';
import { UserService } from '@/services/user.service';

// 4. Type imports
import type { UserProps } from '@/types/user';
import type { ApiResponse } from '@/types/api';

// 5. Relative imports (for co-located files)
import { LocalComponent } from './LocalComponent';
```

#### 5.2.4 Component Organization

**Co-location Pattern**:
```
components/
├── UserProfile/
│   ├── UserProfile.tsx        # Main component
│   ├── UserProfile.test.tsx   # Tests
│   ├── UserProfile.stories.tsx # Stories
│   ├── hooks.ts               # Component-specific hooks
│   └── index.ts               # Barrel export
```

**Component File Structure**:
```typescript
// UserProfile.tsx
import React from 'react';
import { Button } from '@/components/ui/button';
import { useUser } from './hooks';

interface UserProfileProps {
  userId: string;
  onUpdate?: (user: User) => void;
}

export const UserProfile: React.FC<UserProfileProps> = ({ 
  userId, 
  onUpdate 
}) => {
  const { user, loading } = useUser(userId);

  if (loading) return <div>Loading...</div>;

  return (
    <div className="user-profile">
      {/* Component JSX */}
    </div>
  );
};
```

#### 5.2.5 Validation Checklist

**Before committing code, verify**:
- [ ] **File Names**: Follow appropriate case convention (PascalCase, camelCase, etc.)
- [ ] **Directory Structure**: Matches established project organization
- [ ] **Component Names**: Use PascalCase and are descriptive
- [ ] **Hook Names**: Use `use` prefix and kebab-case file names
- [ ] **Constants**: Use UPPER_SNAKE_CASE
- [ ] **Imports**: Organized following standard order (React/Next.js, third-party, internal, types, relative)
- [ ] **File Names**: No spaces or special characters (except hyphens)
- [ ] **Index Files**: Used for barrel exports in component directories
- [ ] **Co-location**: Related files grouped together

#### 5.2.6 Common Issues & Solutions

- **Issue**: Inconsistent file naming across components
  - **Solution**: Use automated linting rules to enforce naming conventions
- **Issue**: Mixed import organization causing readability issues
  - **Solution**: Configure Prettier and ESLint to auto-format imports
- **Issue**: Deep directory nesting making imports complex
  - **Solution**: Use absolute imports and barrel exports for cleaner imports

### 5.3 Error Handling and Logging Best Practices

#### 5.3.1 Core Error Handling Principles

**Context**: Establish comprehensive error handling patterns for Factory.ai droids to ensure robust, maintainable, and debuggable code with consistent logging practices.

**Key Concepts**:
- **Fail Fast**: Detect and handle errors as early as possible
- **Structured Logging**: Use consistent, machine-readable log formats
- **Error Classification**: Distinguish between recoverable and unrecoverable errors
- **Context Preservation**: Include relevant context in error messages and logs
- **Graceful Degradation**: Provide fallback behavior when possible

#### 5.3.2 Error Types and Classification

**Error Categories**:
```typescript
// === Section 5.3: Error Type Definitions ===
// Context: Standardized error classification system for droids
// Prerequisites: Understanding of TypeScript discriminated unions

// Base error interface
export interface BaseError {
  code: string;
  message: string;
  timestamp: Date;
  context?: Record<string, unknown>;
  stack?: string;
}

// Error severity levels
export type ErrorSeverity = 'low' | 'medium' | 'high' | 'critical';

// Error categories
export enum ErrorCategory {
  VALIDATION = 'validation',
  NETWORK = 'network',
  DATABASE = 'database',
  AUTHENTICATION = 'authentication',
  AUTHORIZATION = 'authorization',
  BUSINESS_LOGIC = 'business_logic',
  SYSTEM = 'system',
  EXTERNAL_SERVICE = 'external_service'
}

// Comprehensive error type
export interface DroidError extends BaseError {
  category: ErrorCategory;
  severity: ErrorSeverity;
  recoverable: boolean;
  userId?: string;
  requestId?: string;
  operation?: string;
}

// Error result wrapper
export type ErrorResult<T = never> = {
  success: false;
  error: DroidError;
  data?: never;
} | {
  success: true;
  error?: never;
  data: T;
};
```

#### 5.3.3 Error Handling Patterns

**1. Result Pattern for Function Returns**:
```typescript
// Example: User service with comprehensive error handling
export class UserService {
  async createUser(userData: CreateUserRequest): Promise<ErrorResult<User>> {
    try {
      // Validation
      const validation = this.validateUserData(userData);
      if (!validation.success) {
        return {
          success: false,
          error: {
            code: 'VALIDATION_ERROR',
            message: 'Invalid user data provided',
            category: ErrorCategory.VALIDATION,
            severity: 'medium',
            recoverable: true,
            timestamp: new Date(),
            context: { validationErrors: validation.errors }
          }
        };
      }

      // Database operation
      const existingUser = await this.userRepository.findByEmail(userData.email);
      if (existingUser) {
        return {
          success: false,
          error: {
            code: 'USER_ALREADY_EXISTS',
            message: 'User with this email already exists',
            category: ErrorCategory.BUSINESS_LOGIC,
            severity: 'medium',
            recoverable: true,
            timestamp: new Date(),
            context: { email: userData.email }
          }
        };
      }

      const user = await this.userRepository.create(userData);
      
      // Success log
      logger.info('User created successfully', {
        userId: user.id,
        email: user.email,
        operation: 'createUser'
      });

      return {
        success: true,
        data: user
      };

    } catch (error) {
      // Unexpected error handling
      const droidError: DroidError = {
        code: 'USER_CREATION_FAILED',
        message: 'Failed to create user due to system error',
        category: ErrorCategory.SYSTEM,
        severity: 'high',
        recoverable: false,
        timestamp: new Date(),
        context: { originalError: error, userData: this.sanitizeUserData(userData) },
        stack: error instanceof Error ? error.stack : undefined
      };

      logger.error('User creation failed', droidError);
      
      return {
        success: false,
        error: droidError
      };
    }
  }

  private validateUserData(userData: CreateUserRequest): ErrorResult<void> {
    const errors: string[] = [];
    
    if (!userData.email?.includes('@')) {
      errors.push('Invalid email format');
    }
    
    if (userData.password && userData.password.length < 8) {
      errors.push('Password must be at least 8 characters');
    }

    if (errors.length > 0) {
      return {
        success: false,
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Validation failed',
          category: ErrorCategory.VALIDATION,
          severity: 'medium',
          recoverable: true,
          timestamp: new Date(),
          context: { errors }
        }
      };
    }

    return { success: true, data: undefined };
  }

  private sanitizeUserData(userData: CreateUserRequest): Partial<CreateUserRequest> {
    const { password, ...sanitized } = userData;
    return sanitized;
  }
}
```

**2. Global Error Handler Pattern**:
```typescript
// Global error boundary for Next.js applications
export class DroidErrorBoundary extends React.Component<
  { children: React.ReactNode },
  { hasError: boolean; error?: Error }
> {
  constructor(props: { children: React.ReactNode }) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error: Error) {
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    const droidError: DroidError = {
      code: 'REACT_ERROR_BOUNDARY',
      message: 'Unhandled React error occurred',
      category: ErrorCategory.SYSTEM,
      severity: 'high',
      recoverable: false,
      timestamp: new Date(),
      context: {
        errorInfo,
        componentStack: errorInfo.componentStack,
        userAgent: navigator.userAgent
      },
      stack: error.stack
    };

    logger.error('React error boundary triggered', droidError);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="error-boundary">
          <h2>Something went wrong</h2>
          <p>We're working to fix this issue. Please try again later.</p>
          <button onClick={() => window.location.reload()}>
            Reload Page
          </button>
        </div>
      );
    }

    return this.props.children;
  }
}
```

#### 5.3.4 Logging Framework and Standards

**Logger Interface and Implementation**:
```typescript
// === Section 5.3: Logging Framework ===
// Context: Structured logging system for droid applications
// Prerequisites: Understanding of logging levels and structured data

export interface LogEntry {
  level: LogLevel;
  message: string;
  timestamp: Date;
  context?: Record<string, unknown>;
  error?: DroidError;
  userId?: string;
  requestId?: string;
  operation?: string;
  duration?: number;
}

export enum LogLevel {
  DEBUG = 'debug',
  INFO = 'info',
  WARN = 'warn',
  ERROR = 'error',
  FATAL = 'fatal'
}

export interface Logger {
  debug(message: string, context?: Record<string, unknown>): void;
  info(message: string, context?: Record<string, unknown>): void;
  warn(message: string, context?: Record<string, unknown>): void;
  error(message: string, error?: DroidError | Error, context?: Record<string, unknown>): void;
  fatal(message: string, error?: DroidError | Error, context?: Record<string, unknown>): void;
}

// Logger implementation
export class StructuredLogger implements Logger {
  constructor(
    private serviceName: string,
    private minLevel: LogLevel = LogLevel.INFO
  ) {}

  private shouldLog(level: LogLevel): boolean {
    const levels = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR, LogLevel.FATAL];
    return levels.indexOf(level) >= levels.indexOf(this.minLevel);
  }

  private createLogEntry(level: LogLevel, message: string, context?: Record<string, unknown>, error?: DroidError | Error): LogEntry {
    return {
      level,
      message,
      timestamp: new Date(),
      context: {
        ...context,
        service: this.serviceName,
        environment: process.env.NODE_ENV || 'development'
      },
      error: error ? this.normalizeError(error) : undefined
    };
  }

  private normalizeError(error: DroidError | Error): DroidError {
    if ('category' in error) {
      return error as DroidError;
    }

    return {
      code: 'UNEXPECTED_ERROR',
      message: error.message,
      category: ErrorCategory.SYSTEM,
      severity: 'high',
      recoverable: false,
      timestamp: new Date(),
      stack: error.stack
    };
  }

  private writeLog(entry: LogEntry): void {
    const formattedLog = JSON.stringify(entry);
    
    switch (entry.level) {
      case LogLevel.DEBUG:
        console.debug(formattedLog);
        break;
      case LogLevel.INFO:
        console.info(formattedLog);
        break;
      case LogLevel.WARN:
        console.warn(formattedLog);
        break;
      case LogLevel.ERROR:
      case LogLevel.FATAL:
        console.error(formattedLog);
        break;
    }

    // In production, send to external logging service
    if (process.env.NODE_ENV === 'production') {
      this.sendToExternalLogger(entry);
    }
  }

  private sendToExternalLogger(entry: LogEntry): void {
    // Integration with logging services (e.g., LogRocket, Sentry, etc.)
    // This would be implemented based on the chosen logging service
  }

  debug(message: string, context?: Record<string, unknown>): void {
    if (!this.shouldLog(LogLevel.DEBUG)) return;
    const entry = this.createLogEntry(LogLevel.DEBUG, message, context);
    this.writeLog(entry);
  }

  info(message: string, context?: Record<string, unknown>): void {
    if (!this.shouldLog(LogLevel.INFO)) return;
    const entry = this.createLogEntry(LogLevel.INFO, message, context);
    this.writeLog(entry);
  }

  warn(message: string, context?: Record<string, unknown>): void {
    if (!this.shouldLog(LogLevel.WARN)) return;
    const entry = this.createLogEntry(LogLevel.WARN, message, context);
    this.writeLog(entry);
  }

  error(message: string, error?: DroidError | Error, context?: Record<string, unknown>): void {
    if (!this.shouldLog(LogLevel.ERROR)) return;
    const entry = this.createLogEntry(LogLevel.ERROR, message, context, error);
    this.writeLog(entry);
  }

  fatal(message: string, error?: DroidError | Error, context?: Record<string, unknown>): void {
    if (!this.shouldLog(LogLevel.FATAL)) return;
    const entry = this.createLogEntry(LogLevel.FATAL, message, context, error);
    this.writeLog(entry);
  }
}

// Global logger instance
export const logger = new StructuredLogger('droid-service');
```

#### 5.3.5 Error Handling Workflow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Error      │───▶│  Classify   │───▶│   Handle    │───▶│    Log      │
│  Detection  │    │   Error     │    │   Error     │    │   Event     │
│             │    │             │    │             │    │             │
│ • Try/Catch │    │ • Determine │    │ • Recover   │    │ • Structured│
│ • Validations│   │   Category  │    │ • Fallback  │    │   Format    │
│ • Bounds    │    │ • Severity  │    │ • User      │    │ • Context   │
│   Checking  │    │ • Recoverable│   │   Feedback  │    │ • Metadata  │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

#### 5.3.6 Validation Checklist

**Before committing error handling code, verify**:
- [ ] **Error Classification**: All errors are properly categorized and classified
- [ ] **Structured Logging**: All log entries follow the structured format
- [ ] **Context Preservation**: Error messages include relevant context
- [ ] **Sensitive Data**: No sensitive information (passwords, tokens) is logged
- [ ] **Error Recovery**: Recoverable errors have appropriate fallback mechanisms
- [ ] **User Feedback**: User-facing errors provide clear, actionable messages
- [ ] **Monitoring Integration**: Critical errors are sent to monitoring systems
- [ ] **Performance**: Error handling doesn't significantly impact performance
- [ ] **Testing**: Error scenarios are covered by comprehensive tests
- [ ] **Documentation**: Error codes and their meanings are documented

#### 5.3.7 Common Issues & Solutions

- **Issue**: Inconsistent error handling across services
  - **Solution**: Use the standardized `DroidError` interface and `ErrorResult` pattern
- **Issue**: Overly verbose logging that obscures important information
  - **Solution**: Use appropriate log levels and structured context filtering
- **Issue**: Missing context in error messages making debugging difficult
  - **Solution**: Always include relevant context (userId, requestId, operation) in error logs
- **Issue**: Sensitive data exposure in logs
  - **Solution**: Implement sanitization functions for sensitive user data
- **Issue**: Errors not being properly propagated through the call stack
  - **Solution**: Use consistent error propagation patterns and wrapper types

#### 5.3.8 Related Sections
- Section 5.1: TypeScript patterns for error types
- Section 6.1: Testing error handling scenarios
- Section 11.1: Security considerations for error messages
- Section 10.4: Monitoring and observability practices

#### 5.3.9 Droid Delegation Notes
- **Recommended Droid**: debugging-assessment-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 2-3 hours for comprehensive error handling implementation
- **Prerequisites**: Understanding of TypeScript, async/await patterns, and logging concepts

### 5.4 API Design Patterns for Droid Interactions

#### 5.4.1 Core API Design Principles

**Context**: Establish standardized API design patterns for Factory.ai droid interactions to ensure consistency, type safety, and maintainability across all services.

**Key Concepts**:
- **Type Safety**: Leverage TypeScript for end-to-end type safety
- **Consistency**: Uniform patterns across all APIs
- **Documentation**: Self-documenting APIs with clear contracts
- **Error Handling**: Standardized error responses and status codes
- **Versioning**: Semantic versioning and backward compatibility

#### 5.4.2 Standard API Response Structure

**Unified Response Format**:
```typescript
// === Section 5.4: Standard API Response Patterns ===
// Context: Consistent API response structure for droid communications
// Prerequisites: Understanding of REST APIs and TypeScript interfaces

export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: ApiError;
  meta?: ResponseMeta;
  pagination?: PaginationMeta;
}

export interface ApiError {
  code: string;
  message: string;
  details?: Record<string, unknown>;
  timestamp: Date;
  requestId: string;
}

export interface ResponseMeta {
  requestId: string;
  timestamp: Date;
  version: string;
  processingTime: number;
  rateLimit?: RateLimitInfo;
}

export interface PaginationMeta {
  page: number;
  limit: number;
  total: number;
  totalPages: number;
  hasNext: boolean;
  hasPrev: boolean;
}

export interface RateLimitInfo {
  limit: number;
  remaining: number;
  resetAt: Date;
}

// Usage example
export const createSuccessResponse = <T>(
  data: T,
  meta?: Partial<ResponseMeta>
): ApiResponse<T> => ({
  success: true,
  data,
  meta: {
    requestId: generateRequestId(),
    timestamp: new Date(),
    version: '1.0.0',
    processingTime: 0,
    ...meta
  }
});

export const createErrorResponse = (
  code: string,
  message: string,
  details?: Record<string, unknown>
): ApiResponse => ({
  success: false,
  error: {
    code,
    message,
    details,
    timestamp: new Date(),
    requestId: generateRequestId()
  },
  meta: {
    requestId: generateRequestId(),
    timestamp: new Date(),
    version: '1.0.0',
    processingTime: 0
  }
});
```

#### 5.4.3 tRPC Integration Patterns

**tRPC Router Structure**:
```typescript
// === Section 5.4: tRPC Integration Patterns ===
// Context: Type-safe API development with tRPC for droid services
// Prerequisites: Understanding of tRPC and Next.js 15

import { initTRPC } from '@trpc/server';
import { z } from 'zod';
import superjson from 'superjson';

export type Context = {
  userId?: string;
  requestId: string;
  rateLimit: RateLimitInfo;
};

const t = initTRPC.context<Context>().create({
  transformer: superjson,
  errorFormatter: ({ shape, error }) => ({
    ...shape,
    data: {
      ...shape.data,
      zodError: error.code === 'BAD_REQUEST' && error.cause instanceof z.ZodError
        ? error.cause.flatten()
        : null,
    },
  }),
});

export const router = t.router;
export const publicProcedure = t.procedure;
export const protectedProcedure = t.procedure.use(({ ctx, next }) => {
  if (!ctx.userId) {
    throw new TRPCError({
      code: 'UNAUTHORIZED',
      message: 'Authentication required'
    });
  }
  return next({
    ctx: {
      ...ctx,
      userId: ctx.userId,
    },
  });
});

// Example user router
export const userRouter = router({
  getById: protectedProcedure
    .input(z.object({ id: z.string().uuid() }))
    .query(async ({ input, ctx }) => {
      const user = await userService.findById(input.id);
      
      if (!user) {
        throw new TRPCError({
          code: 'NOT_FOUND',
          message: 'User not found'
        });
      }

      return {
        success: true,
        data: sanitizeUser(user),
        meta: {
          requestId: ctx.requestId,
          timestamp: new Date(),
          processingTime: Date.now() - Date.now()
        }
      };
    }),

  create: protectedProcedure
    .input(z.object({
      email: z.string().email(),
      username: z.string().min(3).max(50),
      password: z.string().min(8)
    }))
    .mutation(async ({ input, ctx }) => {
      const validation = validateUserData(input);
      if (!validation.success) {
        throw new TRPCError({
          code: 'BAD_REQUEST',
          message: 'Validation failed',
          cause: validation.errors
        });
      }

      const existingUser = await userService.findByEmail(input.email);
      if (existingUser) {
        throw new TRPCError({
          code: 'CONFLICT',
          message: 'User with this email already exists'
        });
      }

      const user = await userService.create({
        ...input,
        createdBy: ctx.userId
      });

      return {
        success: true,
        data: sanitizeUser(user),
        meta: {
          requestId: ctx.requestId,
          timestamp: new Date()
        }
      };
    }),

  list: protectedProcedure
    .input(z.object({
      page: z.number().min(1).default(1),
      limit: z.number().min(1).max(100).default(20),
      search: z.string().optional(),
      role: z.enum(['admin', 'user']).optional()
    }))
    .query(async ({ input, ctx }) => {
      const { users, total } = await userService.findMany({
        ...input,
        offset: (input.page - 1) * input.limit
      });

      return {
        success: true,
        data: users.map(sanitizeUser),
        pagination: {
          page: input.page,
          limit: input.limit,
          total,
          totalPages: Math.ceil(total / input.limit),
          hasNext: input.page * input.limit < total,
          hasPrev: input.page > 1
        },
        meta: {
          requestId: ctx.requestId,
          timestamp: new Date()
        }
      };
    })
});
```

#### 5.4.4 API Documentation Standards

**OpenAPI Specification Integration**:
```typescript
// === Section 5.4: API Documentation Standards ===
// Context: Automated API documentation generation for droid services
// Prerequisites: Understanding of OpenAPI specification and documentation

export interface ApiDocumentationConfig {
  title: string;
  description: string;
  version: string;
  servers: ApiServer[];
  tags: ApiTag[];
  security: SecurityScheme[];
}

export interface ApiServer {
  url: string;
  description: string;
  variables?: Record<string, ServerVariable>;
}

export interface ApiTag {
  name: string;
  description: string;
  externalDocs?: ExternalDocumentation;
}

export const generateOpenApiSpec = (config: ApiDocumentationConfig): OpenAPIDocument => ({
  openapi: '3.0.0',
  info: {
    title: config.title,
    description: config.description,
    version: config.version,
    contact: {
      name: 'API Support',
      email: 'api-support@factory.ai'
    },
    license: {
      name: 'MIT',
      url: 'https://opensource.org/licenses/MIT'
    }
  },
  servers: config.servers,
  tags: config.tags,
  paths: generatePaths(),
  components: {
    securitySchemes: generateSecuritySchemes(config.security),
    schemas: generateSchemas(),
    responses: generateResponses(),
    parameters: generateParameters()
  },
  security: config.security.map(scheme => ({ [scheme.name]: [] }))
});

// Documentation middleware
export const documentationMiddleware = (req: Request, res: Response, next: NextFunction) => {
  // Add API documentation headers
  res.setHeader('X-API-Version', '1.0.0');
  res.setHeader('X-Documentation', '/api/docs');
  
  // Rate limiting information
  const rateLimit = getRateLimitInfo(req);
  res.setHeader('X-RateLimit-Limit', rateLimit.limit);
  res.setHeader('X-RateLimit-Remaining', rateLimit.remaining);
  res.setHeader('X-RateLimit-Reset', rateLimit.resetAt.toISOString());
  
  next();
};

// Interactive documentation endpoint
export const documentationRouter = router({
  spec: publicProcedure.query(() => {
    return generateOpenApiSpec({
      title: 'Factory.ai Droids API',
      description: 'Comprehensive API for Factory.ai droid operations',
      version: '1.0.0',
      servers: [
        {
          url: 'https://api.factory.ai/v1',
          description: 'Production server'
        },
        {
          url: 'https://staging-api.factory.ai/v1',
          description: 'Staging server'
        }
      ],
      tags: [
        { name: 'users', description: 'User management operations' },
        { name: 'auth', description: 'Authentication operations' },
        { name: 'droids', description: 'Droid management operations' }
      ],
      security: [
        {
          name: 'bearerAuth',
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT'
        }
      ]
    });
  }),

  ui: publicProcedure.query(() => {
    return {
      title: 'API Documentation',
      description: 'Interactive API documentation',
      specUrl: '/api/docs/spec',
      uiUrl: '/api/docs/ui'
    };
  })
});
```

#### 5.4.5 API Validation and Testing

**Request/Response Validation**:
```typescript
// === Section 5.4: API Validation and Testing Patterns ===
// Context: Comprehensive validation and testing for droid APIs
// Prerequisites: Understanding of validation libraries and testing frameworks

export interface ValidationSchema {
  body?: z.ZodSchema;
  query?: z.ZodSchema;
  params?: z.ZodSchema;
  headers?: z.ZodSchema;
}

export class ApiValidator {
  static validateRequest(schema: ValidationSchema) {
    return async (req: Request, res: Response, next: NextFunction) => {
      try {
        const validationErrors: Record<string, z.ZodIssue[]> = {};

        // Validate request body
        if (schema.body && req.body) {
          const bodyResult = schema.body.safeParse(req.body);
          if (!bodyResult.success) {
            validationErrors.body = bodyResult.error.issues;
          } else {
            req.body = bodyResult.data;
          }
        }

        // Validate query parameters
        if (schema.query && req.query) {
          const queryResult = schema.query.safeParse(req.query);
          if (!queryResult.success) {
            validationErrors.query = queryResult.error.issues;
          } else {
            req.query = queryResult.data;
          }
        }

        // Validate path parameters
        if (schema.params && req.params) {
          const paramsResult = schema.params.safeParse(req.params);
          if (!paramsResult.success) {
            validationErrors.params = paramsResult.error.issues;
          } else {
            req.params = paramsResult.data;
          }
        }

        // Validate headers
        if (schema.headers && req.headers) {
          const headersResult = schema.headers.safeParse(req.headers);
          if (!headersResult.success) {
            validationErrors.headers = headersResult.error.issues;
          } else {
            req.headers = headersResult.data;
          }
        }

        if (Object.keys(validationErrors).length > 0) {
          return res.status(400).json(createErrorResponse(
            'VALIDATION_ERROR',
            'Request validation failed',
            { validationErrors }
          ));
        }

        next();
      } catch (error) {
        logger.error('Request validation error', error as Error);
        return res.status(500).json(createErrorResponse(
          'VALIDATION_ERROR',
          'Internal validation error'
        ));
      }
    };
  }

  static validateResponse(schema: z.ZodSchema) {
    return (req: Request, res: Response, next: NextFunction) => {
      const originalJson = res.json;
      
      res.json = function(data: unknown) {
        try {
          const result = schema.safeParse(data);
          if (!result.success) {
            logger.error('Response validation failed', {
              errors: result.error.issues,
              data
            });
            
            // Return validation error instead of invalid data
            return originalJson.call(this, createErrorResponse(
              'RESPONSE_VALIDATION_ERROR',
              'Internal server error: Invalid response format'
            ));
          }
          
          return originalJson.call(this, result.data);
        } catch (error) {
          logger.error('Response validation error', error as Error);
          return originalJson.call(this, createErrorResponse(
            'RESPONSE_VALIDATION_ERROR',
            'Internal server error'
          ));
        }
      };
      
      next();
    };
  }
}

// Test utilities
export class ApiTestUtils {
  static createTestClient(baseURL: string) {
    return {
      async get<T>(endpoint: string, options?: RequestOptions): Promise<ApiResponse<T>> {
        const response = await fetch(`${baseURL}${endpoint}`, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            ...options?.headers
          },
          ...options
        });
        
        return response.json();
      },

      async post<T>(endpoint: string, data: unknown, options?: RequestOptions): Promise<ApiResponse<T>> {
        const response = await fetch(`${baseURL}${endpoint}`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            ...options?.headers
          },
          body: JSON.stringify(data),
          ...options
        });
        
        return response.json();
      },

      async put<T>(endpoint: string, data: unknown, options?: RequestOptions): Promise<ApiResponse<T>> {
        const response = await fetch(`${baseURL}${endpoint}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
            ...options?.headers
          },
          body: JSON.stringify(data),
          ...options
        });
        
        return response.json();
      },

      async delete<T>(endpoint: string, options?: RequestOptions): Promise<ApiResponse<T>> {
        const response = await fetch(`${baseURL}${endpoint}`, {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
            ...options?.headers
          },
          ...options
        });
        
        return response.json();
      }
    };
  }

  static async testEndpoint<T>(
    client: ReturnType<typeof ApiTestUtils.createTestClient>,
    method: keyof typeof ApiTestUtils.createTestClient,
    endpoint: string,
    data?: unknown,
    expectedStatus?: number
  ): Promise<{ response: ApiResponse<T>; status: number }> {
    const response = await client[method](endpoint, data);
    const status = expectedStatus || (response.success ? 200 : 400);
    
    return { response, status };
  }
}
```

#### 5.4.6 API Rate Limiting and Caching

**Rate Limiting Implementation**:
```typescript
// === Section 5.4: API Rate Limiting and Caching Patterns ===
// Context: Performance optimization for droid APIs with rate limiting and caching
// Prerequisites: Understanding of rate limiting algorithms and caching strategies

export interface RateLimitConfig {
  windowMs: number;
  maxRequests: number;
  skipSuccessfulRequests?: boolean;
  skipFailedRequests?: boolean;
  keyGenerator?: (req: Request) => string;
}

export class RateLimiter {
  private store = new Map<string, { count: number; resetTime: number }>();

  constructor(private config: RateLimitConfig) {}

  middleware() {
    return async (req: Request, res: Response, next: NextFunction) => {
      const key = this.config.keyGenerator ? this.config.keyGenerator(req) : this.getDefaultKey(req);
      const now = Date.now();
      
      let record = this.store.get(key);
      
      if (!record || now > record.resetTime) {
        record = { count: 0, resetTime: now + this.config.windowMs };
        this.store.set(key, record);
      }

      if (record.count >= this.config.maxRequests) {
        const resetAt = new Date(record.resetTime);
        res.setHeader('X-RateLimit-Limit', this.config.maxRequests);
        res.setHeader('X-RateLimit-Remaining', 0);
        res.setHeader('X-RateLimit-Reset', resetAt.toISOString());
        
        return res.status(429).json(createErrorResponse(
          'RATE_LIMIT_EXCEEDED',
          'Too many requests',
          {
            retryAfter: Math.ceil((record.resetTime - now) / 1000),
            limit: this.config.maxRequests,
            windowMs: this.config.windowMs
          }
        ));
      }

      record.count++;
      
      res.setHeader('X-RateLimit-Limit', this.config.maxRequests);
      res.setHeader('X-RateLimit-Remaining', Math.max(0, this.config.maxRequests - record.count));
      res.setHeader('X-RateLimit-Reset', new Date(record.resetTime).toISOString());

      // Clean up expired entries
      if (now % 60000 < 1000) { // Cleanup every minute
        this.cleanup();
      }

      next();
    };

  private getDefaultKey(req: Request): string {
    return req.ip || 'unknown';
  }

  private cleanup(): void {
    const now = Date.now();
    for (const [key, record] of this.store.entries()) {
      if (now > record.resetTime) {
        this.store.delete(key);
      }
    }
  }
}

// Caching middleware
export interface CacheConfig {
  ttl: number;
  keyGenerator?: (req: Request) => string;
  shouldCache?: (req: Request, res: Response) => boolean;
}

export class ResponseCache {
  private cache = new Map<string, { data: unknown; expiresAt: number }>();

  constructor(private config: CacheConfig) {}

  middleware() {
    return async (req: Request, res: Response, next: NextFunction) => {
      // Only cache GET requests
      if (req.method !== 'GET') {
        return next();
      }

      const key = this.config.keyGenerator ? this.config.keyGenerator(req) : this.getDefaultKey(req);
      const cached = this.cache.get(key);

      if (cached && Date.now() < cached.expiresAt) {
        res.setHeader('X-Cache', 'HIT');
        return res.json(cached.data);
      }

      // Override res.json to cache the response
      const originalJson = res.json;
      res.json = function(data: unknown) {
        if (config.shouldCache ? config.shouldCache(req, res) : true) {
          this.cache.set(key, {
            data,
            expiresAt: Date.now() + config.ttl
          });
        }
        
        res.setHeader('X-Cache', 'MISS');
        return originalJson.call(this, data);
      }.bind(this);

      next();
    };
  }

  private getDefaultKey(req: Request): string {
    return `${req.method}:${req.url}:${JSON.stringify(req.query)}`;
  }

  invalidate(pattern: string | RegExp): void {
    for (const key of this.cache.keys()) {
      if (typeof pattern === 'string' ? key.includes(pattern) : pattern.test(key)) {
        this.cache.delete(key);
      }
    }
  }

  clear(): void {
    this.cache.clear();
  }
}
```

#### 5.4.7 API Validation Checklist

**Before deploying API changes, verify**:
- [ ] **Response Format**: All responses follow the standardized ApiResponse structure
- [ ] **Error Handling**: Proper error codes and messages are implemented
- [ ] **Type Safety**: All endpoints have proper TypeScript types
- [ ] **Documentation**: API documentation is automatically generated and up to date
- [ ] **Rate Limiting**: Appropriate rate limits are configured for all endpoints
- [ ] **Validation**: Input and output validation schemas are defined
- [ ] **Testing**: Comprehensive test coverage for all endpoints
- [ ] **Security**: Authentication and authorization are properly implemented
- [ ] **Caching**: Caching strategies are implemented where appropriate
- [ ] **Monitoring**: API performance and error monitoring is in place

#### 5.4.8 Related Sections
- Section 5.1: TypeScript patterns for API development
- Section 5.3: Error handling patterns for APIs
- Section 6.1: Testing API endpoints
- Section 11.3: Security best practices for APIs

#### 5.4.9 Droid Delegation Notes
- **Recommended Droid**: typescript-integration-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 3-4 hours for comprehensive API implementation
- **Prerequisites**: Understanding of REST APIs, tRPC, and TypeScript

### 5.5 shadcn/ui Integration Patterns and Best Practices

#### 5.5.1 Core Integration Principles

**Context**: Establish comprehensive shadcn/ui integration patterns for Factory.ai droids to ensure consistent, accessible, and maintainable UI components with Next.js 15.

**Key Concepts**:
- **Component Consistency**: Unified design system across all droid interfaces
- **Type Safety**: Full TypeScript integration with component props
- **Accessibility**: WCAG compliant components by default
- **Performance**: Optimized components with minimal bundle impact
- **Customization**: Themable components with design system integration

#### 5.5.2 shadcn/ui Setup and Configuration

**Project Initialization**:
```typescript
// === Section 5.5: shadcn/ui Setup and Configuration ===
// Context: Complete shadcn/ui setup for Next.js 15 with TypeScript
// Prerequisites: Understanding of Next.js 15 and component libraries

// package.json dependencies
{
  "dependencies": {
    "@radix-ui/react-accordion": "^1.1.2",
    "@radix-ui/react-alert-dialog": "^1.0.5",
    "@radix-ui/react-avatar": "^1.0.4",
    "@radix-ui/react-button": "^1.0.4",
    "@radix-ui/react-card": "^1.0.4",
    "@radix-ui/react-checkbox": "^1.0.4",
    "@radix-ui/react-dialog": "^1.0.5",
    "@radix-ui/react-dropdown-menu": "^2.0.6",
    "@radix-ui/react-form": "^0.0.3",
    "@radix-ui/react-icons": "^1.3.0",
    "@radix-ui/react-label": "^2.0.2",
    "@radix-ui/react-popover": "^1.0.7",
    "@radix-ui/react-progress": "^1.0.3",
    "@radix-ui/react-radio-group": "^1.1.3",
    "@radix-ui/react-scroll-area": "^1.0.5",
    "@radix-ui/react-select": "^2.0.0",
    "@radix-ui/react-separator": "^1.0.3",
    "@radix-ui/react-slider": "^1.1.2",
    "@radix-ui/react-switch": "^1.0.3",
    "@radix-ui/react-tabs": "^1.0.4",
    "@radix-ui/react-toast": "^1.1.5",
    "@radix-ui/react-toggle": "^1.0.3",
    "@radix-ui/react-tooltip": "^1.0.7",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.0.0",
    "lucide-react": "^0.294.0",
    "tailwind-merge": "^2.2.0",
    "tailwindcss-animate": "^1.0.7",
    // Icon Libraries
    "@hugeicons/react": "^0.4.0",
    "@lineicons/react": "^3.0.0",
    // shadcnblocks.com CLI Integration
    "shadcnblocks-cli": "^1.0.0"
  }
}

// components.json configuration
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "src/app/globals.css",
    "baseColor": "slate",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils"
  }
}

// tailwind.config.ts
import type { Config } from 'tailwindcss';

const config: Config = {
  darkMode: ['class'],
  content: [
    './pages/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './app/**/*.{ts,tsx}',
    './src/**/*.{ts,tsx}',
  ],
  prefix: '',
  theme: {
    container: {
      center: true,
      padding: '2rem',
      screens: {
        '2xl': '1400px',
      },
    },
    extend: {
      colors: {
        border: 'hsl(var(--border))',
        input: 'hsl(var(--input))',
        ring: 'hsl(var(--ring))',
        background: 'hsl(var(--background))',
        foreground: 'hsl(var(--foreground))',
        primary: {
          DEFAULT: 'hsl(var(--primary))',
          foreground: 'hsl(var(--primary-foreground))',
        },
        secondary: {
          DEFAULT: 'hsl(var(--secondary))',
          foreground: 'hsl(var(--secondary-foreground))',
        },
        destructive: {
          DEFAULT: 'hsl(var(--destructive))',
          foreground: 'hsl(var(--destructive-foreground))',
        },
        muted: {
          DEFAULT: 'hsl(var(--muted))',
          foreground: 'hsl(var(--muted-foreground))',
        },
        accent: {
          DEFAULT: 'hsl(var(--accent))',
          foreground: 'hsl(var(--accent-foreground))',
        },
        popover: {
          DEFAULT: 'hsl(var(--popover))',
          foreground: 'hsl(var(--popover-foreground))',
        },
        card: {
          DEFAULT: 'hsl(var(--card))',
          foreground: 'hsl(var(--card-foreground))',
        },
      },
      borderRadius: {
        lg: 'var(--radius)',
        md: 'calc(var(--radius) - 2px)',
        sm: 'calc(var(--radius) - 4px)',
      },
      keyframes: {
        'accordion-down': {
          from: { height: '0' },
          to: { height: 'var(--radix-accordion-content-height)' },
        },
        'accordion-up': {
          from: { height: 'var(--radix-accordion-content-height)' },
          to: { height: '0' },
        },
      },
      animation: {
        'accordion-down': 'accordion-down 0.2s ease-out',
        'accordion-up': 'accordion-up 0.2s ease-out',
      },
    },
  },
  plugins: [require('tailwindcss-animate')],
};

export default config;

// src/lib/utils.ts
import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
```

#### 5.5.3 Icon Library Integration

**Context**: Establish comprehensive icon library integration patterns for Factory.ai droids using shadcn/ui with HugeIcons, LineIcons, and prioritized shadcnblocks.com components.

**Key Concepts**:
- **Icon Priority**: shadcnblocks.com components > HugeIcons > LineIcons > Lucide (fallback)
- **Performance**: Tree-shaking and lazy loading for optimal bundle size
- **Consistency**: Unified icon API across different libraries
- **Accessibility**: Proper ARIA labels and semantic icon usage

**Icon Library Setup and Configuration**:
```typescript
// === Section 5.5: Icon Library Integration Setup ===
// Context: Complete icon library setup for shadcn/ui with multiple providers
// Prerequisites: Understanding of React components and TypeScript

// src/lib/icons/index.ts - Unified Icon System
import React from 'react';
import { LucideProps } from 'lucide-react';
import { HugeiconsProps } from '@hugeicons/react';
import { LineiconsProps } from '@lineicons/react';

// Icon provider types
export type IconProvider = 'lucide' | 'hugeicons' | 'lineicons' | 'shadcnblocks';

export interface IconProps extends Omit<LucideProps, 'ref'> {
  provider?: IconProvider;
  name: string;
  fallback?: React.ReactNode;
  lazy?: boolean;
}

// Icon mapping for different providers
const iconMap = {
  // Priority order: shadcnblocks -> HugeIcons -> LineIcons -> Lucide
  navigation: {
    shadcnblocks: 'navigation-menu',
    hugeicons: 'menu-01',
    lineicons: 'menu',
    lucide: 'Menu'
  },
  user: {
    shadcnblocks: 'user-avatar',
    hugeicons: 'user-01',
    lineicons: 'user',
    lucide: 'User'
  },
  settings: {
    shadcnblocks: 'settings-gear',
    hugeicons: 'setting-01',
    lineicons: 'cog',
    lucide: 'Settings'
  },
  search: {
    shadcnblocks: 'search-magnifier',
    hugeicons: 'search-01',
    lineicons: 'search',
    lucide: 'Search'
  },
  logout: {
    shadcnblocks: 'logout-exit',
    hugeicons: 'logout-01',
    lineicons: 'exit',
    lucide: 'LogOut'
  }
};

// Dynamic icon loader with provider priority
export const DynamicIcon: React.FC<IconProps> = ({
  provider = 'shadcnblocks',
  name,
  size = 20,
  className,
  fallback,
  lazy = true,
  ...props
}) => {
  const [IconComponent, setIconComponent] = React.useState<React.ComponentType<any> | null>(null);
  const [loading, setLoading] = React.useState(true);
  const [error, setError] = React.useState<string | null>(null);

  React.useEffect(() => {
    if (!lazy) {
      loadIcon();
    }
  }, [name, provider, lazy]);

  const loadIcon = async () => {
    try {
      setLoading(true);
      setError(null);

      // Try shadcnblocks first (highest priority)
      if (provider === 'shadcnblocks') {
        const { loadShadcnblocksIcon } = await import('./shadcnblocks-loader');
        const icon = await loadShadcnblocksIcon(name);
        if (icon) {
          setIconComponent(() => icon);
          setLoading(false);
          return;
        }
      }

      // Try HugeIcons second
      if (provider === 'hugeicons') {
        const { loadHugeiconsIcon } = await import('./hugeicons-loader');
        const icon = await loadHugeiconsIcon(name);
        if (icon) {
          setIconComponent(() => icon);
          setLoading(false);
          return;
        }
      }

      // Try LineIcons third
      if (provider === 'lineicons') {
        const { loadLineiconsIcon } = await import('./lineicons-loader');
        const icon = await loadLineiconsIcon(name);
        if (icon) {
          setIconComponent(() => icon);
          setLoading(false);
          return;
        }
      }

      // Fallback to Lucide
      const { loadLucideIcon } = await import('./lucide-loader');
      const icon = await loadLucideIcon(name);
      if (icon) {
        setIconComponent(() => icon);
      } else {
        setError(`Icon "${name}" not found in any provider`);
      }

    } catch (err) {
      setError(`Failed to load icon "${name}": ${err}`);
    } finally {
      setLoading(false);
    }
  };

  if (lazy && loading) {
    return <div className={`animate-pulse bg-muted rounded ${className}`} style={{ width: size, height: size }} />;
  }

  if (error && fallback) {
    return <>{fallback}</>;
  }

  if (error) {
    return (
      <div className={`text-destructive ${className}`} style={{ width: size, height: size }}>
        <span title={error}>⚠️</span>
      </div>
    );
  }

  if (IconComponent) {
    return <IconComponent size={size} className={className} {...props} />;
  }

  return null;
};

// Icon provider with automatic fallback
export const Icon: React.FC<IconProps> = ({ name, provider, ...props }) => {
  const iconMapping = iconMap[name as keyof typeof iconMap];
  const providers: IconProvider[] = ['shadcnblocks', 'hugeicons', 'lineicons', 'lucide'];

  // If specific provider is requested, try it first
  if (provider) {
    return <DynamicIcon name={iconMapping?.[provider] || name} provider={provider} {...props} />;
  }

  // Try providers in priority order
  return (
    <>
      {providers.map((p) => (
        <DynamicIcon
          key={p}
          name={iconMapping?.[p] || name}
          provider={p}
          {...props}
          fallback={p === 'lucide' ? <span>❓</span> : undefined}
        />
      ))}
    </>
  );
};

// Common icon components for consistency
export const NavigationIcon = (props: Omit<IconProps, 'name'>) => <Icon name="navigation" {...props} />;
export const UserIcon = (props: Omit<IconProps, 'name'>) => <Icon name="user" {...props} />;
export const SettingsIcon = (props: Omit<IconProps, 'name'>) => <Icon name="settings" {...props} />;
export const SearchIcon = (props: Omit<IconProps, 'name'>) => <Icon name="search" {...props} />;
export const LogoutIcon = (props: Omit<IconProps, 'name'>) => <Icon name="logout" {...props} />;
```

**shadcnblocks.com CLI Integration**:
```typescript
// === Section 5.5: shadcnblocks.com CLI Integration ===
// Context: Complete shadcnblocks.com CLI setup and integration patterns
// Prerequisites: shadcnblocks.com API key and CLI installation

// shadcnblocks.config.ts
export interface ShadcnblocksConfig {
  apiKey: string;
  projectId: string;
  outputDir: string;
  componentPrefix: string;
  theme: 'default' | 'dark' | 'custom';
  customTheme?: ThemeConfig;
  iconProvider: 'hugeicons' | 'lineicons' | 'lucide';
  components: {
    include: string[];
    exclude: string[];
  };
  optimization: {
    treeShake: boolean;
    minify: boolean;
    bundleAnalysis: boolean;
  };
}

// src/lib/shadcnblocks/config.ts
export const shadcnblocksConfig: ShadcnblocksConfig = {
  apiKey: process.env.SHADCNBLOCKS_API_KEY || '',
  projectId: process.env.SHADCNBLOCKS_PROJECT_ID || '',
  outputDir: 'src/components/shadcnblocks',
  componentPrefix: 'Sb',
  theme: 'default',
  iconProvider: 'hugeicons',
  components: {
    include: [
      'navigation',
      'hero-sections',
      'feature-cards',
      'testimonials',
      'pricing-sections',
      'contact-forms',
      'footers'
    ],
    exclude: ['deprecated', 'experimental']
  },
  optimization: {
    treeShake: true,
    minify: true,
    bundleAnalysis: true
  }
};

// src/lib/shadcnblocks/manager.ts
export class ShadcnblocksManager {
  private config: ShadcnblocksConfig;
  private cache = new Map<string, any>();

  constructor(config: ShadcnblocksConfig) {
    this.config = config;
    this.validateConfig();
  }

  private validateConfig(): void {
    if (!this.config.apiKey) {
      throw new Error('SHADCNBLOCKS_API_KEY environment variable is required');
    }
    
    if (!this.config.projectId) {
      throw new Error('SHADCNBLOCKS_PROJECT_ID environment variable is required');
    }
  }

  async installComponents(componentList?: string[]): Promise<void> {
    const components = componentList || this.config.components.include;
    
    for (const component of components) {
      try {
        await this.installComponent(component);
        console.log(`✅ Installed shadcnblocks component: ${component}`);
      } catch (error) {
        console.error(`❌ Failed to install component ${component}:`, error);
      }
    }
  }

  private async installComponent(componentName: string): Promise<void> {
    // Check cache first
    if (this.cache.has(componentName)) {
      return this.cache.get(componentName);
    }

    const response = await fetch(`https://api.shadcnblocks.com/v1/components/${componentName}`, {
      headers: {
        'Authorization': `Bearer ${this.config.apiKey}`,
        'X-Project-ID': this.config.projectId,
        'Content-Type': 'application/json'
      }
    });

    if (!response.ok) {
      throw new Error(`Failed to fetch component: ${response.statusText}`);
    }

    const componentData = await response.json();
    
    // Process and save component
    await this.processComponent(componentData, componentName);
    
    // Cache the result
    this.cache.set(componentName, componentData);
  }

  private async processComponent(componentData: any, componentName: string): Promise<void> {
    const { code, dependencies, styles } = componentData;
    
    // Create component file
    const componentPath = `${this.config.outputDir}/${componentName}.tsx`;
    await this.writeFile(componentPath, this.processComponentCode(code));
    
    // Install dependencies
    if (dependencies?.length) {
      await this.installDependencies(dependencies);
    }
    
    // Process styles
    if (styles) {
      await this.processStyles(styles, componentName);
    }
  }

  private processComponentCode(code: string): string {
    // Replace icon imports with our unified icon system
    return code
      .replace(/from ['"]lucide-react['"]/g, "from '@/lib/icons'")
      .replace(/lucide-([a-zA-Z]+)/g, (match, iconName) => {
        const mappedIcon = this.mapIconName(iconName);
        return `${mappedIcon}`;
      })
      .replace(/import\s+\{([^}]+)\}\s+from\s+['"]@radix-ui\/react-icons['"]/g, 
        "import { Icon } from '@/lib/icons'");
  }

  private mapIconName(lucideName: string): string {
    const iconMapping: Record<string, string> = {
      'Menu': 'NavigationIcon',
      'User': 'UserIcon',
      'Settings': 'SettingsIcon',
      'Search': 'SearchIcon',
      'LogOut': 'LogoutIcon'
      // Add more mappings as needed
    };
    
    return iconMapping[lucideName] || `Icon name="${lucideName.toLowerCase()}"`;
  }

  private async installDependencies(dependencies: string[]): Promise<void> {
    const { execSync } = require('child_process');
    
    try {
      execSync(`npm install ${dependencies.join(' ')}`, { stdio: 'inherit' });
    } catch (error) {
      console.warn(`Failed to install dependencies: ${dependencies.join(', ')}`);
    }
  }

  private async writeFile(path: string, content: string): Promise<void> {
    const fs = require('fs').promises;
    const pathModule = require('path');
    
    await fs.mkdir(pathModule.dirname(path), { recursive: true });
    await fs.writeFile(path, content);
  }

  private async processStyles(styles: string, componentName: string): Promise<void> {
    const stylePath = `${this.config.outputDir}/${componentName}.module.css`;
    await this.writeFile(stylePath, styles);
  }

  async updateComponents(): Promise<void> {
    const components = this.config.components.include;
    
    for (const component of components) {
      try {
        // Clear cache for this component
        this.cache.delete(component);
        await this.installComponent(component);
        console.log(`✅ Updated shadcnblocks component: ${component}`);
      } catch (error) {
        console.error(`❌ Failed to update component ${component}:`, error);
      }
    }
  }
}

// Global shadcnblocks manager instance
export const shadcnblocksManager = new ShadcnblocksManager(shadcnblocksConfig);
```

**Icon Component Usage Examples**:
```typescript
// === Section 5.5: Icon Usage Examples ===
// Context: Practical examples of using the unified icon system

// Basic icon usage
import { Icon, NavigationIcon, UserIcon } from '@/lib/icons';

// Using specific icon components
const Header = () => (
  <header className="flex items-center justify-between p-4">
    <NavigationIcon size={24} className="text-primary" />
    <UserIcon size={20} className="text-muted-foreground" />
  </header>
);

// Using dynamic icon with provider preference
const DynamicIconExample = () => (
  <div className="flex gap-4">
    <Icon name="navigation" provider="shadcnblocks" size={24} />
    <Icon name="user" provider="hugeicons" size={24} />
    <Icon name="settings" provider="lineicons" size={24} />
    <Icon name="search" provider="lucide" size={24} />
  </div>
);

// Icon with fallback and lazy loading
const LazyIconExample = () => (
  <Icon 
    name="custom-icon" 
    provider="hugeicons" 
    size={32}
    lazy={true}
    fallback={<div className="w-8 h-8 bg-muted rounded" />}
    className="text-primary"
  />
);

// Icon in button with shadcn/ui
import { Button } from '@/components/ui/button';

const IconButton = () => (
  <Button variant="ghost" size="sm">
    <SettingsIcon size={16} className="mr-2" />
    Settings
  </Button>
);

// shadcnblocks component integration
import { SbHeroSection } from '@/components/shadcnblocks/hero-section';

const HomePage = () => (
  <main>
    <SbHeroSection 
      title="Welcome to Factory.ai"
      subtitle="Build amazing droids with our unified platform"
      primaryAction={<Button>Get Started</Button>}
      secondaryAction={<Button variant="outline">Learn More</Button>}
    />
  </main>
);
```

**Validation Checklist**:
- [ ] **API Key Security**: shadcnblocks.com API key stored in environment variables
- [ ] **Provider Priority**: Icon providers follow correct priority order
- [ ] **Bundle Optimization**: Tree-shaking and lazy loading implemented
- [ ] **Fallback Handling**: Proper fallbacks for missing icons
- [ ] **Accessibility**: Icons have proper ARIA labels and semantic meaning
- [ ] **Performance**: Icon loading doesn't block initial render
- [ ] **Type Safety**: All icon components have proper TypeScript types
- [ ] **Error Handling**: Graceful error handling for failed icon loads

#### 5.5.4 Component Library Structure

**Component Organization**:
```typescript
// === Section 5.5: Component Library Structure ===
// Context: Organized component structure for shadcn/ui integration
// Prerequisites: Understanding of component architecture and TypeScript

// src/components/ui/index.ts - Barrel export
export * from './button';
export * from './input';
export * from './label';
export * from './card';
export * from './dialog';
export * from './dropdown-menu';
export * from './toast';
export * from './table';
export * from './form';
export * from './select';
export * from './checkbox';
export * from './radio-group';
export * from './switch';
export * from './slider';
export * from './tabs';
export * from './accordion';
export * from './alert';
export * from './avatar';
export * from './progress';
export * from './separator';
export * from './scroll-area';
export * from './tooltip';
export * from './popover';

// src/components/ui/button.tsx
import * as React from 'react';
import { Slot } from '@radix-ui/react-slot';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';

const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive:
          'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline:
          'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary:
          'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
);

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean;
  loading?: boolean;
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, loading = false, children, disabled, ...props }, ref) => {
    const Comp = asChild ? Slot : 'button';
    
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        disabled={disabled || loading}
        {...props}
      >
        {loading ? (
          <div className="flex items-center gap-2">
            <div className="h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" />
            {children}
          </div>
        ) : (
          children
        )}
      </Comp>
    );
  }
);

Button.displayName = 'Button';

export { Button, buttonVariants };

// src/components/ui/form.tsx
import * as React from 'react';
import * as LabelPrimitive from '@radix-ui/react-label';
import { Slot } from '@radix-ui/react-slot';
import {
  Controller,
  ControllerProps,
  FieldPath,
  FieldValues,
  FormProvider,
  useFormContext,
} from 'react-hook-form';
import { cn } from '@/lib/utils';
import { Label } from '@/components/ui/label';

const Form = FormProvider;

type FormFieldContextValue<
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
> = {
  name: TName;
};

const FormFieldContext = React.createContext<FormFieldContextValue>(
  {} as FormFieldContextValue
);

const FormField = <
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
>({
  ...props
}: ControllerProps<TFieldValues, TName>) => {
  return (
    <FormFieldContext.Provider value={{ name: props.name }}>
      <Controller {...props} />
    </FormFieldContext.Provider>
  );
};

const useFormField = () => {
  const fieldContext = React.useContext(FormFieldContext);
  const itemContext = React.useContext(FormItemContext);
  const { getFieldState, formState } = useFormContext();

  const fieldState = getFieldState(fieldContext.name, formState);

  if (!fieldContext) {
    throw new Error('useFormField should be used within <FormField>');
  }

  const { id } = itemContext;

  return {
    id,
    name: fieldContext.name,
    formItemId: `${id}-form-item`,
    formDescriptionId: `${id}-form-item-description`,
    formMessageId: `${id}-form-item-message`,
    ...fieldState,
  };
};

type FormItemContextValue = {
  id: string;
};

const FormItemContext = React.createContext<FormItemContextValue>(
  {} as FormItemContextValue
);

const FormItem = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  const id = React.useId();

  return (
    <FormItemContext.Provider value={{ id }}>
      <div ref={ref} className={cn('space-y-2', className)} {...props} />
    </FormItemContext.Provider>
  );
});

FormItem.displayName = 'FormItem';

const FormLabel = React.forwardRef<
  React.ElementRef<typeof LabelPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root>
>(({ className, ...props }, ref) => {
  const { error, formItemId } = useFormField();

  return (
    <Label
      ref={ref}
      className={cn(error && 'text-destructive', className)}
      htmlFor={formItemId}
      {...props}
    />
  );
});

FormLabel.displayName = 'FormLabel';

const FormControl = React.forwardRef<
  React.ElementRef<typeof Slot>,
  React.ComponentPropsWithoutRef<typeof Slot>
>(({ ...props }, ref) => {
  const { error, formItemId, formDescriptionId, formMessageId } = useFormField();

  return (
    <Slot
      ref={ref}
      id={formItemId}
      aria-describedby={
        !error
          ? `${formDescriptionId}`
          : `${formDescriptionId} ${formMessageId}`
      }
      aria-invalid={!!error}
      {...props}
    />
  );
});

FormControl.displayName = 'FormControl';

const FormDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => {
  const { formDescriptionId } = useFormField();

  return (
    <p
      ref={ref}
      id={formDescriptionId}
      className={cn('text-sm text-muted-foreground', className)}
      {...props}
    />
  );
});

FormDescription.displayName = 'FormDescription';

const FormMessage = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, children, ...props }, ref) => {
  const { error, formMessageId } = useFormField();
  const body = error ? String(error?.message) : children;

  if (!body) {
    return null;
  }

  return (
    <p
      ref={ref}
      id={formMessageId}
      className={cn('text-sm font-medium text-destructive', className)}
      {...props}
    >
      {body}
    </p>
  );
});

FormMessage.displayName = 'FormMessage';

export {
  useFormField,
  Form,
  FormItem,
  FormLabel,
  FormControl,
  FormDescription,
  FormMessage,
  FormField,
};
```

#### 5.5.4 Advanced Component Patterns

**Custom Component Extensions**:
```typescript
// === Section 5.5: Advanced Component Patterns ===
// Context: Extending shadcn/ui components for droid-specific use cases
// Prerequisites: Understanding of React patterns and component composition

// src/components/ui/data-table.tsx
import * as React from 'react';
import {
  ColumnDef,
  ColumnFiltersState,
  SortingState,
  VisibilityState,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
  useReactTable,
} from '@tanstack/react-table';
import { ArrowUpDown, ChevronDown, MoreHorizontal } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import {
  DropdownMenu,
  DropdownMenuCheckboxItem,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { Input } from '@/components/ui/input';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';

interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[];
  data: TData[];
  searchKey?: string;
  onRowClick?: (row: TData) => void;
}

export function DataTable<TData, TValue>({
  columns,
  data,
  searchKey,
  onRowClick,
}: DataTableProps<TData, TValue>) {
  const [sorting, setSorting] = React.useState<SortingState>([]);
  const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>(
    []
  );
  const [columnVisibility, setColumnVisibility] =
    React.useState<VisibilityState>({});
  const [rowSelection, setRowSelection] = React.useState({});

  const table = useReactTable({
    data,
    columns,
    onSortingChange: setSorting,
    onColumnFiltersChange: setColumnFilters,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    onColumnVisibilityChange: setColumnVisibility,
    onRowSelectionChange: setRowSelection,
    state: {
      sorting,
      columnFilters,
      columnVisibility,
      rowSelection,
    },
  });

  return (
    <div className="w-full">
      <div className="flex items-center py-4">
        {searchKey && (
          <Input
            placeholder={`Filter ${searchKey}...`}
            value={(table.getColumn(searchKey)?.getFilterValue() as string) ?? ''}
            onChange={(event) =>
              table.getColumn(searchKey)?.setFilterValue(event.target.value)
            }
            className="max-w-sm"
          />
        )}
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="outline" className="ml-auto">
              Columns <ChevronDown className="ml-2 h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            {table
              .getAllColumns()
              .filter((column) => column.getCanHide())
              .map((column) => {
                return (
                  <DropdownMenuCheckboxItem
                    key={column.id}
                    className="capitalize"
                    checked={column.getIsVisible()}
                    onCheckedChange={(value) =>
                      column.toggleVisibility(!!value)
                    }
                  >
                    {column.id}
                  </DropdownMenuCheckboxItem>
                );
              })}
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
      <div className="rounded-md border">
        <Table>
          <TableHeader>
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id}>
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead key={header.id}>
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  );
                })}
              </TableRow>
            ))}
          </TableHeader>
          <TableBody>
            {table.getRowModel().rows?.length ? (
              table.getRowModel().rows.map((row) => (
                <TableRow
                  key={row.id}
                  data-state={row.getIsSelected() && 'selected'}
                  className={onRowClick ? 'cursor-pointer hover:bg-muted/50' : ''}
                  onClick={() => onRowClick?.(row.original)}
                >
                  {row.getVisibleCells().map((cell) => (
                    <TableCell key={cell.id}>
                      {flexRender(
                        cell.column.columnDef.cell,
                        cell.getContext()
                      )}
                    </TableCell>
                  ))}
                </TableRow>
              ))
            ) : (
              <TableRow>
                <TableCell
                  colSpan={columns.length}
                  className="h-24 text-center"
                >
                  No results.
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      <div className="flex items-center justify-end space-x-2 py-4">
        <div className="flex-1 text-sm text-muted-foreground">
          {table.getFilteredSelectedRowModel().rows.length} of{' '}
          {table.getFilteredRowModel().rows.length} row(s) selected.
        </div>
        <div className="space-x-2">
          <Button
            variant="outline"
            size="sm"
            onClick={() => table.previousPage()}
            disabled={!table.getCanPreviousPage()}
          >
            Previous
          </Button>
          <Button
            variant="outline"
            size="sm"
            onClick={() => table.nextPage()}
            disabled={!table.getCanNextPage()}
          >
            Next
          </Button>
        </div>
      </div>
    </div>
  );
}

// src/components/ui/page-header.tsx
import React from 'react';
import { cn } from '@/lib/utils';

interface PageHeaderProps extends React.HTMLAttributes<HTMLDivElement> {
  heading: string;
  description?: string;
  children?: React.ReactNode;
}

export function PageHeader({
  heading,
  description,
  children,
  className,
  ...props
}: PageHeaderProps) {
  return (
    <div
      className={cn(
        'flex flex-col gap-1 pb-4 mb-6 border-b',
        className
      )}
      {...props}
    >
      <div className="flex items-center justify-between">
        <div className="space-y-1">
          <h1 className="text-2xl font-semibold tracking-tight">{heading}</h1>
          {description && (
            <p className="text-sm text-muted-foreground">{description}</p>
          )}
        </div>
        {children && <div className="flex items-center gap-2">{children}</div>}
      </div>
    </div>
  );
}
```

#### 5.5.5 TypeScript Integration Patterns

**Type-Safe Component Development**:
```typescript
// === Section 5.5: TypeScript Integration Patterns ===
// Context: Full TypeScript integration for shadcn/ui components
// Prerequisites: Understanding of TypeScript generics and utility types

// src/types/components.ts
import { VariantProps } from 'class-variance-authority';
import { buttonVariants } from '@/components/ui/button';
import { ComponentProps } from 'react';

// Extract component prop types
export type ButtonProps = VariantProps<typeof buttonVariants> &
  Omit<ComponentProps<'button'>, 'variant'>;

// Generic component props
export interface BaseComponentProps {
  className?: string;
  children?: React.ReactNode;
  id?: string;
  'data-testid'?: string;
}

export interface FormFieldProps<T = unknown> extends BaseComponentProps {
  label?: string;
  description?: string;
  error?: string;
  required?: boolean;
  disabled?: boolean;
  value?: T;
  onChange?: (value: T) => void;
  onBlur?: () => void;
}

// Component variant types
export type ComponentSize = 'sm' | 'md' | 'lg' | 'xl';
export type ComponentVariant = 'default' | 'destructive' | 'outline' | 'secondary' | 'ghost' | 'link';
export type ComponentColor = 'primary' | 'secondary' | 'success' | 'warning' | 'error' | 'info';

// Enhanced component interfaces
export interface EnhancedButtonProps extends ButtonProps {
  loading?: boolean;
  icon?: React.ReactNode;
  iconPosition?: 'left' | 'right';
  fullWidth?: boolean;
  onClick?: (event: React.MouseEvent<HTMLButtonElement>) => void | Promise<void>;
}

export interface EnhancedInputProps extends ComponentProps<'input'> {
  label?: string;
  description?: string;
  error?: string;
  required?: boolean;
  leftIcon?: React.ReactNode;
  rightIcon?: React.ReactNode;
  containerClassName?: string;
}

// Form integration types
export interface FormFieldConfig<T = unknown> {
  name: string;
  label: string;
  description?: string;
  required?: boolean;
  validation?: Record<string, unknown>;
  component: React.ComponentType<FormFieldProps<T>>;
}

export interface FormConfig<T extends Record<string, unknown>> {
  fields: FormFieldConfig[];
  defaultValues?: T;
  onSubmit: (values: T) => void | Promise<void>;
  validation?: Record<keyof T, Record<string, unknown>>;
}

// Utility types for component development
export type ComponentWithRef<T extends React.ElementType> = React.ForwardRefExoticComponent<
  React.ComponentPropsWithoutRef<T> & React.RefAttributes<React.ElementRef<T>>
>;

export type AsChildProps<T extends React.ElementType> = {
  asChild?: boolean;
} & Omit<React.ComponentPropsWithoutRef<T>, 'asChild'>;

// Component theme types
export interface ComponentThemeConfig {
  colors: {
    primary: string;
    secondary: string;
    accent: string;
    destructive: string;
    muted: string;
    background: string;
    foreground: string;
    border: string;
    input: string;
    ring: string;
  };
  borderRadius: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
  };
  spacing: {
    xs: string;
    sm: string;
    md: string;
    lg: string;
    xl: string;
  };
  typography: {
    fontFamily: string;
    fontSize: Record<string, string>;
    fontWeight: Record<string, string>;
    lineHeight: Record<string, string>;
  };
}

// src/components/ui/typed-button.tsx
import React from 'react';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';
import type { EnhancedButtonProps } from '@/types/components';

const TypedButton = React.forwardRef<HTMLButtonElement, EnhancedButtonProps>(
  (
    {
      className,
      variant,
      size,
      loading = false,
      icon,
      iconPosition = 'left',
      fullWidth = false,
      children,
      disabled,
      onClick,
      ...props
    },
    ref
  ) => {
    const handleClick = async (event: React.MouseEvent<HTMLButtonElement>) => {
      if (loading || disabled) return;
      
      try {
        await onClick?.(event);
      } catch (error) {
        console.error('Button click error:', error);
      }
    };

    const renderIcon = () => {
      if (!icon) return null;
      
      return React.cloneElement(icon as React.ReactElement, {
        className: cn('h-4 w-4', icon === children ? 'mr-2' : '')
      });
    };

    return (
      <Button
        ref={ref}
        className={cn(
          fullWidth && 'w-full',
          loading && 'cursor-not-allowed',
          className
        )}
        variant={variant}
        size={size}
        disabled={disabled || loading}
        onClick={handleClick}
        {...props}
      >
        {loading && (
          <div className="mr-2 h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" />
        )}
        
        {iconPosition === 'left' && renderIcon()}
        {children}
        {iconPosition === 'right' && renderIcon()}
      </Button>
    );
  }
);

TypedButton.displayName = 'TypedButton';

export { TypedButton };
```

#### 5.5.6 shadcn/ui Validation Checklist

**Before deploying UI components, verify**:
- [ ] **Component Structure**: All components follow the established structure and patterns
- [ ] **Type Safety**: Full TypeScript coverage for all component props
- [ ] **Accessibility**: WCAG compliance and proper ARIA attributes
- [ ] **Responsive Design**: Components work across all screen sizes
- [ ] **Theme Integration**: Components respect the design system theme
- [ ] **Performance**: Components are optimized for minimal re-renders
- [ ] **Testing**: Components have comprehensive test coverage
- [ ] **Documentation**: Components are properly documented with examples
- [ ] **Browser Compatibility**: Components work across target browsers
- [ ] **Bundle Size**: Components don't significantly impact bundle size

#### 5.5.7 Common Issues & Solutions

- **Issue**: Component styles not applying correctly
  - **Solution**: Ensure Tailwind CSS is properly configured and CSS variables are set
- **Issue**: TypeScript errors with component props
  - **Solution**: Use proper type definitions and utility types for component props
- **Issue**: Accessibility issues with custom components
  - **Solution**: Implement proper ARIA attributes and keyboard navigation
- **Issue**: Performance issues with large component trees
  - **Solution**: Use React.memo and proper memoization strategies
- **Issue**: Theme not applying to components
  - **Solution**: Ensure CSS variables are properly defined and theme provider is implemented

#### 5.5.8 Related Sections
- Section 5.1: TypeScript patterns for component development
- Section 5.2: Code organization for component libraries
- Section 6.1: Testing patterns for UI components
- Section 5.6: Component customization approaches

#### 5.5.9 Droid Delegation Notes
- **Recommended Droid**: frontend-engineer-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 4-5 hours for comprehensive UI implementation
- **Prerequisites**: Understanding of React, TypeScript, and design systems

### 5.6 shadcn/ui CLI Usage Guidelines

#### 5.6.1 CLI Installation and Setup

**Context**: Establish shadcn/ui CLI usage patterns for Factory.ai droids to ensure efficient component management and development workflows.

**Installation and Configuration**:
```bash
# === Section 5.6: shadcn/ui CLI Setup ===
# Context: Complete CLI setup for shadcn/ui management
# Prerequisites: Node.js 18+ and existing Next.js 15 project

# Install shadcn/ui CLI globally
npm install -g shadcn-ui@latest

# Or install locally in project
npm install -D shadcn-ui@latest

# Initialize shadcn/ui in project
npx shadcn-ui@latest init

# CLI configuration (components.json)
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "src/app/globals.css",
    "baseColor": "slate",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils"
  },
  "iconLibrary": "lucide"
}
```

#### 5.6.2 Component Installation and Management

**CLI Commands and Workflows**:
```typescript
// === Section 5.6: Component Management Patterns ===
// Context: Automated component installation and management
// Prerequisites: shadcn/ui CLI and proper project setup

// CLI command automation
export class ShadcnCLIManager {
  private projectPath: string;

  constructor(projectPath: string) {
    this.projectPath = projectPath;
  }

  // Install a single component
  async installComponent(componentName: string, options?: InstallOptions): Promise<void> {
    const command = `npx shadcn-ui@latest add ${componentName}`;
    const flags = this.buildCommandFlags(options);
    
    await this.executeCommand(`${command} ${flags}`);
    
    // Post-installation validation
    await this.validateComponentInstallation(componentName);
  }

  // Install multiple components
  async installComponents(components: string[], options?: InstallOptions): Promise<void> {
    for (const component of components) {
      try {
        await this.installComponent(component, options);
        console.log(`✅ Installed ${component}`);
      } catch (error) {
        console.error(`❌ Failed to install ${component}:`, error);
      }
    }
  }

  // Install component with custom configuration
  async installComponentWithConfig(
    componentName: string,
    config: ComponentConfig
  ): Promise<void> {
    // Update components.json with custom config
    await this.updateComponentConfig(componentName, config);
    
    // Install component
    await this.installComponent(componentName);
    
    // Apply customizations
    await this.applyComponentCustomizations(componentName, config);
  }

  // Update existing component
  async updateComponent(componentName: string): Promise<void> {
    const command = `npx shadcn-ui@latest add ${componentName} --force`;
    await this.executeCommand(command);
    await this.validateComponentInstallation(componentName);
  }

  // Remove component
  async removeComponent(componentName: string): Promise<void> {
    const componentPath = `src/components/ui/${componentName}.tsx`;
    const indexPath = `src/components/ui/index.ts`;
    
    // Remove component file
    await this.removeFile(componentPath);
    
    // Remove from index exports
    await this.removeFromIndex(indexPath, componentName);
    
    // Clean up dependencies
    await this.cleanupDependencies(componentName);
  }

  // List available components
  async listAvailableComponents(): Promise<string[]> {
    const result = await this.executeCommand('npx shadcn-ui@latest list --available');
    return this.parseComponentList(result.stdout);
  }

  // Check for updates
  async checkUpdates(): Promise<ComponentUpdate[]> {
    const result = await this.executeCommand('npx shadcn-ui@latest check-updates');
    return this.parseUpdateInfo(result.stdout);
  }

  // Apply updates
  async applyUpdates(components: string[]): Promise<void> {
    for (const component of components) {
      await this.updateComponent(component);
    }
  }

  private buildCommandFlags(options?: InstallOptions): string {
    if (!options) return '';
    
    const flags = [];
    if (options.force) flags.push('--force');
    if (options.yes) flags.push('--yes');
    if (options.cwd) flags.push(`--cwd ${options.cwd}`);
    if (options.style) flags.push(`--style ${options.style}`);
    
    return flags.join(' ');
  }

  private async executeCommand(command: string): Promise<{ stdout: string; stderr: string }> {
    return new Promise((resolve, reject) => {
      const { exec } = require('child_process');
      
      exec(command, { cwd: this.projectPath }, (error: any, stdout: string, stderr: string) => {
        if (error) {
          reject(error);
        } else {
          resolve({ stdout, stderr });
        }
      });
    });
  }

  private async validateComponentInstallation(componentName: string): Promise<void> {
    const componentPath = `src/components/ui/${componentName}.tsx`;
    const indexPath = `src/components/ui/index.ts`;
    
    // Check if component file exists
    const componentExists = await this.fileExists(componentPath);
    if (!componentExists) {
      throw new Error(`Component file not found: ${componentPath}`);
    }
    
    // Check if component is exported from index
    const indexContent = await this.readFile(indexPath);
    if (!indexContent.includes(componentName)) {
      throw new Error(`Component not exported from index: ${componentName}`);
    }
    
    // Check TypeScript compilation
    const compileResult = await this.checkTypeScriptCompilation();
    if (!compileResult.success) {
      throw new Error(`TypeScript compilation failed after installing ${componentName}`);
    }
  }

  private async fileExists(filePath: string): Promise<boolean> {
    try {
      await fs.access(path.join(this.projectPath, filePath));
      return true;
    } catch {
      return false;
    }
  }

  private async readFile(filePath: string): Promise<string> {
    return fs.readFile(path.join(this.projectPath, filePath), 'utf-8');
  }

  private async checkTypeScriptCompilation(): Promise<{ success: boolean; errors?: string[] }> {
    try {
      const result = await this.executeCommand('npx tsc --noEmit');
      return { success: true };
    } catch (error: any) {
      return { success: false, errors: error.stderr.split('\n').filter(Boolean) };
    }
  }
}

// Component configuration types
interface InstallOptions {
  force?: boolean;
  yes?: boolean;
  cwd?: string;
  style?: 'default' | 'new-york';
}

interface ComponentConfig {
  style?: 'default' | 'new-york';
  color?: 'slate' | 'zinc' | 'stone' | 'neutral' | 'gray';
  radius?: '0' | '0.25' | '0.375' | '0.5' | '0.75' | '1';
  cssVariables?: boolean;
  prefix?: string;
  customizations?: Record<string, unknown>;
}

interface ComponentUpdate {
  name: string;
  currentVersion: string;
  latestVersion: string;
  updateType: 'patch' | 'minor' | 'major';
}
```

#### 5.6.3 Block Installation and Management

**Predefined Component Blocks**:
```typescript
// === Section 5.6: Component Block Management ===
// Context: Predefined component blocks for common UI patterns
// Prerequisites: Understanding of component composition and design patterns

export class ComponentBlockManager {
  private cliManager: ShadcnCLIManager;

  constructor(projectPath: string) {
    this.cliManager = new ShadcnCLIManager(projectPath);
  }

  // Install authentication block
  async installAuthBlock(): Promise<void> {
    const authComponents = [
      'button',
      'input',
      'label',
      'card',
      'form',
      'checkbox',
      'separator',
      'alert',
      'toast'
    ];

    await this.cliManager.installComponents(authComponents);
    
    // Create auth-specific components
    await this.createAuthComponents();
    await this.createAuthPages();
  }

  // Install dashboard block
  async installDashboardBlock(): Promise<void> {
    const dashboardComponents = [
      'button',
      'card',
      'table',
      'dropdown-menu',
      'select',
      'input',
      'label',
      'avatar',
      'badge',
      'separator',
      'tabs',
      'progress',
      'dialog',
      'tooltip',
      'popover'
    ];

    await this.cliManager.installComponents(dashboardComponents);
    
    // Create dashboard-specific components
    await this.createDashboardComponents();
    await this.createDashboardLayout();
  }

  // Install forms block
  async installFormsBlock(): Promise<void> {
    const formComponents = [
      'button',
      'input',
      'label',
      'form',
      'checkbox',
      'radio-group',
      'switch',
      'slider',
      'select',
      'textarea',
      'card',
      'alert',
      'separator'
    ];

    await this.cliManager.installComponents(formComponents);
    
    // Create form-specific components
    await this.createFormComponents();
    await this.createFormValidationSchema();
  }

  // Install data visualization block
  async installDataVisualizationBlock(): Promise<void> {
    const vizComponents = [
      'card',
      'table',
      'progress',
      'badge',
      'button',
      'dropdown-menu',
      'select',
      'input',
      'label',
      'tabs',
      'separator'
    ];

    await this.cliManager.installComponents(vizComponents);
    
    // Install additional visualization dependencies
    await this.installVisualizationDependencies();
    
    // Create visualization components
    await this.createVisualizationComponents();
  }

  // Install settings block
  async installSettingsBlock(): Promise<void> {
    const settingsComponents = [
      'button',
      'card',
      'form',
      'input',
      'label',
      'checkbox',
      'switch',
      'select',
      'slider',
      'tabs',
      'separator',
      'alert',
      'dialog',
      'tooltip'
    ];

    await this.cliManager.installComponents(settingsComponents);
    
    // Create settings components
    await this.createSettingsComponents();
    await this.createSettingsPages();
  }

  // Install complete block (all components)
  async installCompleteBlock(): Promise<void> {
    await this.installAuthBlock();
    await this.installDashboardBlock();
    await this.installFormsBlock();
    await this.installDataVisualizationBlock();
    await this.installSettingsBlock();
    
    // Create additional utilities and configurations
    await this.createThemeConfiguration();
    await this.createComponentLibrary();
    await this.createDocumentation();
  }

  private async createAuthComponents(): Promise<void> {
    // Create login form component
    const loginForm = `
import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';
import { Checkbox } from '@/components/ui/checkbox';
import { Separator } from '@/components/ui/separator';
import { Alert, AlertDescription } from '@/components/ui/alert';

interface LoginFormProps {
  onSubmit: (email: string, password: string, remember: boolean) => void;
  loading?: boolean;
  error?: string;
}

export function LoginForm({ onSubmit, loading, error }: LoginFormProps) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [remember, setRemember] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSubmit(email, password, remember);
  };

  return (
    <Card className="w-full max-w-md mx-auto">
      <CardHeader>
        <CardTitle>Sign In</CardTitle>
        <CardDescription>
          Enter your credentials to access your account
        </CardDescription>
      </CardHeader>
      <form onSubmit={handleSubmit}>
        <CardContent className="space-y-4">
          {error && (
            <Alert variant="destructive">
              <AlertDescription>{error}</AlertDescription>
            </Alert>
          )}
          
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input
              id="email"
              type="email"
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
          
          <div className="space-y-2">
            <Label htmlFor="password">Password</Label>
            <Input
              id="password"
              type="password"
              placeholder="Enter your password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          
          <div className="flex items-center space-x-2">
            <Checkbox
              id="remember"
              checked={remember}
              onCheckedChange={(checked) => setRemember(checked as boolean)}
            />
            <Label htmlFor="remember" className="text-sm">
              Remember me
            </Label>
          </div>
        </CardContent>
        
        <Separator />
        
        <CardFooter className="flex flex-col space-y-2">
          <Button type="submit" className="w-full" disabled={loading}>
            {loading ? 'Signing in...' : 'Sign In'}
          </Button>
          
          <div className="text-sm text-center space-x-2">
            <span className="text-muted-foreground">Don't have an account?</span>
            <Button variant="link" className="p-0 h-auto">
              Sign up
            </Button>
          </div>
        </CardFooter>
      </form>
    </Card>
  );
}
`;

    await this.writeFile('src/components/auth/login-form.tsx', loginForm);
  }

  private async createDashboardComponents(): Promise<void> {
    // Create stats card component
    const statsCard = `
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { TrendingUp, TrendingDown, Minus } from 'lucide-react';

interface StatsCardProps {
  title: string;
  value: string | number;
  change?: {
    value: number;
    trend: 'up' | 'down' | 'neutral';
  };
  description?: string;
  icon?: React.ReactNode;
}

export function StatsCard({ title, value, change, description, icon }: StatsCardProps) {
  const getTrendIcon = () => {
    switch (change?.trend) {
      case 'up':
        return <TrendingUp className="h-4 w-4 text-green-600" />;
      case 'down':
        return <TrendingDown className="h-4 w-4 text-red-600" />;
      default:
        return <Minus className="h-4 w-4 text-gray-600" />;
    }
  };

  const getTrendColor = () => {
    switch (change?.trend) {
      case 'up':
        return 'text-green-600';
      case 'down':
        return 'text-red-600';
      default:
        return 'text-gray-600';
    }
  };

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
        <CardTitle className="text-sm font-medium">{title}</CardTitle>
        {icon}
      </CardHeader>
      <CardContent>
        <div className="text-2xl font-bold">{value}</div>
        {change && (
          <div className="flex items-center space-x-2 text-xs">
            {getTrendIcon()}
            <span className={getTrendColor()}>
              {Math.abs(change.value)}% from last month
            </span>
          </div>
        )}
        {description && (
          <p className="text-xs text-muted-foreground mt-1">{description}</p>
        )}
      </CardContent>
    </Card>
  );
}
`;

    await this.writeFile('src/components/dashboard/stats-card.tsx', statsCard);
  }

  private async installVisualizationDependencies(): Promise<void> {
    const dependencies = [
      'recharts',
      '@types/recharts'
    ];

    for (const dep of dependencies) {
      await this.cliManager.executeCommand(`npm install ${dep}`);
    }
  }

  private async writeFile(filePath: string, content: string): Promise<void> {
    const fs = require('fs').promises;
    const path = require('path');
    
    const fullPath = path.join(this.cliManager['projectPath'], filePath);
    const dir = path.dirname(fullPath);
    
    await fs.mkdir(dir, { recursive: true });
    await fs.writeFile(fullPath, content);
  }
}
```

#### 5.6.4 CLI Error Handling and Troubleshooting

**Error Management and Recovery**:
```typescript
// === Section 5.6: CLI Error Handling Patterns ===
// Context: Comprehensive error handling for shadcn/ui CLI operations
// Prerequisites: Understanding of CLI operations and error handling

export class CLIErrorHandler {
  private commonErrors = new Map([
    ['EPERM: operation not permitted', 'Permission denied. Try running with elevated permissions or check file permissions.'],
    ['ENOENT: no such file or directory', 'File or directory not found. Check your project structure and file paths.'],
    ['EACCES: permission denied', 'Permission denied. Check file permissions and user access rights.'],
    ['ENOTEMPTY: directory not empty', 'Directory not empty. Clean up the directory or use --force flag.'],
    ['EEXIST: file already exists', 'File already exists. Use --force flag to overwrite.'],
    ['Command failed: npm', 'NPM command failed. Check your npm installation and network connection.'],
    ['Command failed: yarn', 'Yarn command failed. Check your yarn installation and network connection.'],
    ['Cannot find module', 'Module not found. Install required dependencies.'],
    ['TypeScript compilation failed', 'TypeScript errors found. Check your code for type errors.'],
    ['Tailwind CSS configuration error', 'Tailwind CSS configuration issue. Check your tailwind.config.js file.']
  ]);

  async handleError(error: Error, context: string): Promise<void> {
    const errorType = this.classifyError(error);
    const solution = this.getSolution(error);
    
    console.error(`\n❌ Error in ${context}:`);
    console.error(`   ${error.message}`);
    
    if (solution) {
      console.error(`\n💡 Solution:`);
      console.error(`   ${solution}`);
    }
    
    // Log error for debugging
    await this.logError(error, context, errorType);
    
    // Suggest recovery actions
    await this.suggestRecovery(errorType, context);
  }

  private classifyError(error: Error): string {
    const message = error.message;
    
    if (message.includes('EPERM') || message.includes('EACCES')) {
      return 'permission_error';
    }
    
    if (message.includes('ENOENT')) {
      return 'file_not_found';
    }
    
    if (message.includes('EEXIST')) {
      return 'file_exists';
    }
    
    if (message.includes('npm') || message.includes('yarn')) {
      return 'package_manager_error';
    }
    
    if (message.includes('TypeScript')) {
      return 'typescript_error';
    }
    
    if (message.includes('Tailwind')) {
      return 'tailwind_error';
    }
    
    return 'unknown_error';
  }

  private getSolution(error: Error): string | null {
    for (const [pattern, solution] of this.commonErrors) {
      if (error.message.includes(pattern)) {
        return solution;
      }
    }
    return null;
  }

  private async logError(error: Error, context: string, errorType: string): Promise<void> {
    const logEntry = {
      timestamp: new Date().toISOString(),
      context,
      errorType,
      message: error.message,
      stack: error.stack,
      platform: process.platform,
      nodeVersion: process.version,
      npmVersion: await this.getNpmVersion()
    };

    // Write to error log file
    try {
      const fs = require('fs').promises;
      const logPath = './logs/shadcn-cli-errors.log';
      
      await fs.mkdir('./logs', { recursive: true });
      await fs.appendFile(logPath, JSON.stringify(logEntry) + '\n');
    } catch (logError) {
      console.error('Failed to write error log:', logError);
    }
  }

  private async suggestRecovery(errorType: string, context: string): Promise<void> {
    console.error(`\n🔧 Recovery suggestions for ${errorType}:`);
    
    switch (errorType) {
      case 'permission_error':
        console.error('   1. Try running the command with sudo (Linux/macOS)');
        console.error('   2. Run as administrator (Windows)');
        console.error('   3. Check file permissions in your project directory');
        break;
        
      case 'file_not_found':
        console.error('   1. Verify you\'re in the correct project directory');
        console.error('   2. Check if the file path is correct');
        console.error('   3. Ensure the project structure is intact');
        break;
        
      case 'package_manager_error':
        console.error('   1. Clear package manager cache: npm cache clean --force');
        console.error('   2. Delete node_modules and package-lock.json');
        console.error('   3. Run npm install');
        console.error('   4. Check your internet connection');
        break;
        
      case 'typescript_error':
        console.error('   1. Check TypeScript configuration in tsconfig.json');
        console.error('   2. Verify all imported components exist');
        console.error('   3. Run npx tsc --noEmit to check for type errors');
        break;
        
      case 'tailwind_error':
        console.error('   1. Check tailwind.config.js configuration');
        console.error('   2. Verify CSS file paths in the configuration');
        console.error('   3. Ensure PostCSS is properly configured');
        break;
        
      default:
        console.error('   1. Check the official shadcn/ui documentation');
        console.error('   2. Create an issue on the shadcn/ui GitHub repository');
        console.error('   3. Seek help in the shadcn/ui Discord community');
    }
  }

  private async getNpmVersion(): Promise<string> {
    try {
      const { exec } = require('child_process');
      return new Promise((resolve) => {
        exec('npm --version', (error: any, stdout: string) => {
          resolve(stdout.trim());
        });
      });
    } catch {
      return 'unknown';
    }
  }
}

// CLI health checker
export class CLIHealthChecker {
  private errorHandler = new CLIErrorHandler();

  async performHealthCheck(): Promise<HealthCheckResult> {
    const checks = [
      this.checkNodeVersion(),
      this.checkNpmVersion(),
      this.checkProjectStructure(),
      this.checkDependencies(),
      this.checkConfiguration(),
      this.checkTypeScript(),
      this.checkTailwind()
    ];

    const results = await Promise.allSettled(checks);
    const issues = results.filter(result => result.status === 'rejected') as PromiseRejectedResult[];
    
    return {
      healthy: issues.length === 0,
      issues: issues.map(issue => ({
        check: 'unknown',
        error: issue.reason.message,
        severity: 'medium'
      })),
      recommendations: this.generateRecommendations(issues)
    };
  }

  private async checkNodeVersion(): Promise<void> {
    const nodeVersion = process.version;
    const majorVersion = parseInt(nodeVersion.slice(1).split('.')[0]);
    
    if (majorVersion < 18) {
      throw new Error(`Node.js version ${nodeVersion} is not supported. Please upgrade to Node.js 18 or higher.`);
    }
  }

  private async checkNpmVersion(): Promise<void> {
    const { exec } = require('child_process');
    
    return new Promise((resolve, reject) => {
      exec('npm --version', (error: any, stdout: string) => {
        if (error) {
          reject(new Error('npm is not installed or not accessible'));
        } else {
          resolve();
        }
      });
    });
  }

  private async checkProjectStructure(): Promise<void> {
    const fs = require('fs').promises;
    
    const requiredFiles = [
      'package.json',
      'tailwind.config.ts',
      'src/app/globals.css',
      'components.json'
    ];

    for (const file of requiredFiles) {
      try {
        await fs.access(file);
      } catch {
        throw new Error(`Required file not found: ${file}`);
      }
    }
  }

  private async checkDependencies(): Promise<void> {
    const packageJson = require('./package.json');
    const requiredDeps = ['react', 'react-dom', 'next', 'tailwindcss', 'class-variance-authority'];
    
    for (const dep of requiredDeps) {
      if (!packageJson.dependencies?.[dep] && !packageJson.devDependencies?.[dep]) {
        throw new Error(`Required dependency not found: ${dep}`);
      }
    }
  }

  private async checkConfiguration(): Promise<void> {
    try {
      const componentsConfig = require('./components.json');
      const requiredFields = ['$schema', 'style', 'tailwind', 'aliases'];
      
      for (const field of requiredFields) {
        if (!componentsConfig[field]) {
          throw new Error(`Missing required field in components.json: ${field}`);
        }
      }
    } catch (error) {
      throw new Error('Invalid or missing components.json configuration');
    }
  }

  private async checkTypeScript(): Promise<void> {
    const { exec } = require('child_process');
    
    return new Promise((resolve, reject) => {
      exec('npx tsc --noEmit', (error: any) => {
        if (error) {
          reject(new Error('TypeScript compilation failed. Run npx tsc --noEmit to see the errors.'));
        } else {
          resolve();
        }
      });
    });
  }

  private async checkTailwind(): Promise<void> {
    const fs = require('fs').promises;
    
    try {
      const cssContent = await fs.readFile('src/app/globals.css', 'utf-8');
      
      if (!cssContent.includes('@tailwind')) {
        throw new Error('Tailwind CSS directives not found in globals.css');
      }
    } catch (error) {
      throw new Error('Tailwind CSS configuration issue');
    }
  }

  private generateRecommendations(issues: PromiseRejectedResult[]): string[] {
    const recommendations: string[] = [];
    
    if (issues.some(issue => issue.reason.message.includes('Node.js'))) {
      recommendations.push('Upgrade Node.js to version 18 or higher');
    }
    
    if (issues.some(issue => issue.reason.message.includes('npm'))) {
      recommendations.push('Ensure npm is properly installed and accessible');
    }
    
    if (issues.some(issue => issue.reason.message.includes('TypeScript'))) {
      recommendations.push('Fix TypeScript compilation errors before proceeding');
    }
    
    if (issues.some(issue => issue.reason.message.includes('Tailwind'))) {
      recommendations.push('Verify Tailwind CSS configuration and setup');
    }
    
    return recommendations;
  }
}

interface HealthCheckResult {
  healthy: boolean;
  issues: Array<{
    check: string;
    error: string;
    severity: 'low' | 'medium' | 'high';
  }>;
  recommendations: string[];
}
```

#### 5.6.5 shadcn/ui CLI Validation Checklist

**Before using CLI commands, verify**:
- [ ] **Node.js Version**: Node.js 18+ is installed and accessible
- [ ] **Package Manager**: npm or yarn is properly configured
- [ ] **Project Structure**: Required files and directories exist
- [ ] **Dependencies**: All required dependencies are installed
- [ ] **Configuration**: components.json is properly configured
- [ ] **Permissions**: Sufficient file system permissions for project directory
- [ ] **Network**: Internet connection for downloading components
- [ ] **Disk Space**: Sufficient disk space for new components
- [ ] **TypeScript**: TypeScript configuration is valid
- [ ] **Tailwind CSS**: Tailwind CSS is properly configured

#### 5.6.6 Common CLI Issues & Solutions

- **Issue**: Permission denied errors
  - **Solution**: Run with elevated permissions or check file permissions
- **Issue**: Component installation fails
  - **Solution**: Check network connection and package manager configuration
- **Issue**: TypeScript errors after installation
  - **Solution**: Verify component exports and TypeScript configuration
- **Issue**: Styles not applying correctly
  - **Solution**: Check Tailwind CSS configuration and CSS imports
- **Issue**: Component not found after installation
  - **Solution**: Verify component installation path and index exports

#### 5.6.7 Related Sections
- Section 5.5: shadcn/ui integration patterns
- Section 5.7: Component customization approaches
- Section 6.1: Testing patterns for CLI operations
- Section 5.1: TypeScript patterns for component development

#### 5.6.8 Droid Delegation Notes
- **Recommended Droid**: frontend-engineer-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 2-3 hours for comprehensive CLI setup and automation
- **Prerequisites**: Understanding of CLI operations and package management

### 5.7 shadcn/ui Component Customization Approaches

#### 5.7.1 Theme Customization Patterns

**Context**: Establish comprehensive theme customization patterns for shadcn/ui components to ensure consistent branding and design system integration for Factory.ai droids.

**Theme System Implementation**:
```typescript
// === Section 5.7: Theme Customization System ===
// Context: Complete theme customization framework for shadcn/ui
// Prerequisites: Understanding of CSS variables and theme systems

// src/theme/theme-provider.tsx
import React, { createContext, useContext, useEffect, useState } from 'react';

type Theme = 'dark' | 'light' | 'system';

interface ThemeProviderProps {
  children: React.ReactNode;
  defaultTheme?: Theme;
  storageKey?: string;
  enableSystem?: boolean;
  attribute?: 'class' | 'data-theme';
}

type ThemeProviderState = {
  theme: Theme;
  setTheme: (theme: Theme) => void;
  resolvedTheme: 'dark' | 'light';
};

const initialState: ThemeProviderState = {
  theme: 'system',
  setTheme: () => null,
  resolvedTheme: 'light',
};

const ThemeProviderContext = createContext<ThemeProviderState>(initialState);

export function ThemeProvider({
  children,
  defaultTheme = 'system',
  storageKey = 'vite-ui-theme',
  enableSystem = true,
  attribute = 'class',
  ...props
}: ThemeProviderProps) {
  const [theme, setTheme] = useState<Theme>(
    () => (localStorage.getItem(storageKey) as Theme) || defaultTheme
  );

  const [resolvedTheme, setResolvedTheme] = useState<'dark' | 'light'>('light');

  useEffect(() => {
    const root = window.document.documentElement;

    root.classList.remove('light', 'dark');

    if (theme === 'system' && enableSystem) {
      const systemTheme = window.matchMedia('(prefers-color-scheme: dark)')
        .matches
        ? 'dark'
        : 'light';

      root.classList.add(systemTheme);
      setResolvedTheme(systemTheme);
      return;
    }

    root.classList.add(theme);
    setResolvedTheme(theme as 'dark' | 'light');
  }, [theme, enableSystem]);

  const value = {
    theme,
    setTheme: (theme: Theme) => {
      localStorage.setItem(storageKey, theme);
      setTheme(theme);
    },
    resolvedTheme,
  };

  return (
    <ThemeProviderContext.Provider {...props} value={value}>
      {children}
    </ThemeProviderContext.Provider>
  );
}

export const useTheme = () => {
  const context = useContext(ThemeProviderContext);

  if (context === undefined)
    throw new Error('useTheme must be used within a ThemeProvider');

  return context;
};

// src/theme/theme.ts
export interface DesignSystemThemeConfig {
  colors: {
    primary: string;
    secondary: string;
    accent: string;
    destructive: string;
    muted: string;
    background: string;
    foreground: string;
    border: string;
    input: string;
    ring: string;
    card: string;
    cardForeground: string;
    popover: string;
    popoverForeground: string;
    mutedForeground: string;
    destructiveForeground: string;
  };
  borderRadius: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
  };
  fontFamily: {
    sans: string[];
    mono: string[];
  };
  fontSize: {
    xs: string;
    sm: string;
    base: string;
    lg: string;
    xl: string;
    '2xl': string;
    '3xl': string;
    '4xl': string;
    '5xl': string;
    '6xl': string;
  };
  fontWeight: {
    thin: number;
    light: number;
    normal: number;
    medium: number;
    semibold: number;
    bold: number;
    extrabold: number;
    black: number;
  };
  lineHeight: {
    tight: number;
    snug: number;
    normal: number;
    relaxed: number;
    loose: number;
  };
  spacing: {
    xs: string;
    sm: string;
    md: string;
    lg: string;
    xl: string;
    '2xl': string;
    '3xl': string;
    '4xl': string;
    '5xl': string;
    '6xl': string;
  };
  shadows: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
    '2xl': string;
  };
  animation: {
    duration: {
      fast: string;
      normal: string;
      slow: string;
    };
    easing: {
      linear: string;
      ease: string;
      easeIn: string;
      easeOut: string;
      easeInOut: string;
    };
  };
}

export const defaultTheme: ThemeConfig = {
  colors: {
    primary: 'hsl(222.2 84% 4.9%)',
    secondary: 'hsl(210 40% 96%)',
    accent: 'hsl(210 40% 96%)',
    destructive: 'hsl(0 84.2% 60.2%)',
    muted: 'hsl(210 40% 96%)',
    background: 'hsl(0 0% 100%)',
    foreground: 'hsl(222.2 84% 4.9%)',
    border: 'hsl(214.3 31.8% 91.4%)',
    input: 'hsl(214.3 31.8% 91.4%)',
    ring: 'hsl(222.2 84% 4.9%)',
    card: 'hsl(0 0% 100%)',
    cardForeground: 'hsl(222.2 84% 4.9%)',
    popover: 'hsl(0 0% 100%)',
    popoverForeground: 'hsl(222.2 84% 4.9%)',
    mutedForeground: 'hsl(215.4 16.3% 46.9%)',
    destructiveForeground: 'hsl(210 40% 98%)',
  },
  borderRadius: {
    sm: '0.25rem',
    md: '0.375rem',
    lg: '0.5rem',
    xl: '0.75rem',
  },
  fontFamily: {
    sans: ['Inter', 'system-ui', 'sans-serif'],
    mono: ['JetBrains Mono', 'monospace'],
  },
  fontSize: {
    xs: '0.75rem',
    sm: '0.875rem',
    base: '1rem',
    lg: '1.125rem',
    xl: '1.25rem',
    '2xl': '1.5rem',
    '3xl': '1.875rem',
    '4xl': '2.25rem',
    '5xl': '3rem',
    '6xl': '3.75rem',
  },
  fontWeight: {
    thin: 100,
    light: 300,
    normal: 400,
    medium: 500,
    semibold: 600,
    bold: 700,
    extrabold: 800,
    black: 900,
  },
  lineHeight: {
    tight: 1.25,
    snug: 1.375,
    normal: 1.5,
    relaxed: 1.625,
    loose: 2,
  },
  spacing: {
    xs: '0.25rem',
    sm: '0.5rem',
    md: '1rem',
    lg: '1.5rem',
    xl: '2rem',
    '2xl': '3rem',
    '3xl': '4rem',
    '4xl': '6rem',
    '5xl': '8rem',
    '6xl': '10rem',
  },
  shadows: {
    sm: '0 1px 2px 0 rgb(0 0 0 / 0.05)',
    md: '0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)',
    lg: '0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)',
    xl: '0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)',
    '2xl': '0 25px 50px -12px rgb(0 0 0 / 0.25)',
  },
  animation: {
    duration: {
      fast: '150ms',
      normal: '250ms',
      slow: '350ms',
    },
    easing: {
      linear: 'linear',
      ease: 'ease',
      easeIn: 'ease-in',
      easeOut: 'ease-out',
      easeInOut: 'ease-in-out',
    },
  },
};

// src/theme/generate-theme.ts
export class ThemeGenerator {
  static generateCSS(theme: ThemeConfig): string {
    const { colors, borderRadius, fontFamily, fontSize, fontWeight, lineHeight, spacing, shadows, animation } = theme;
    
    return `
:root {
  /* Colors */
  --background: ${colors.background};
  --foreground: ${colors.foreground};
  --card: ${colors.card};
  --card-foreground: ${colors.cardForeground};
  --popover: ${colors.popover};
  --popover-foreground: ${colors.popoverForeground};
  --primary: ${colors.primary};
  --primary-foreground: ${colors.primary};
  --secondary: ${colors.secondary};
  --secondary-foreground: ${colors.secondary};
  --muted: ${colors.muted};
  --muted-foreground: ${colors.mutedForeground};
  --accent: ${colors.accent};
  --accent-foreground: ${colors.accent};
  --destructive: ${colors.destructive};
  --destructive-foreground: ${colors.destructiveForeground};
  --border: ${colors.border};
  --input: ${colors.input};
  --ring: ${colors.ring};
  
  /* Border Radius */
  --radius: ${borderRadius.md};
  --radius-sm: ${borderRadius.sm};
  --radius-md: ${borderRadius.md};
  --radius-lg: ${borderRadius.lg};
  --radius-xl: ${borderRadius.xl};
  
  /* Font Family */
  --font-sans: ${fontFamily.sans.join(', ')};
  --font-mono: ${fontFamily.mono.join(', ')};
  
  /* Font Size */
  --text-xs: ${fontSize.xs};
  --text-sm: ${fontSize.sm};
  --text-base: ${fontSize.base};
  --text-lg: ${fontSize.lg};
  --text-xl: ${fontSize.xl};
  --text-2xl: ${fontSize['2xl']};
  --text-3xl: ${fontSize['3xl']};
  --text-4xl: ${fontSize['4xl']};
  --text-5xl: ${fontSize['5xl']};
  --text-6xl: ${fontSize['6xl']};
  
  /* Font Weight */
  --font-thin: ${fontWeight.thin};
  --font-light: ${fontWeight.light};
  --font-normal: ${fontWeight.normal};
  --font-medium: ${fontWeight.medium};
  --font-semibold: ${fontWeight.semibold};
  --font-bold: ${fontWeight.bold};
  --font-extrabold: ${fontWeight.extrabold};
  --font-black: ${fontWeight.black};
  
  /* Line Height */
  --leading-tight: ${lineHeight.tight};
  --leading-snug: ${lineHeight.snug};
  --leading-normal: ${lineHeight.normal};
  --leading-relaxed: ${lineHeight.relaxed};
  --leading-loose: ${lineHeight.loose};
  
  /* Spacing */
  --space-xs: ${spacing.xs};
  --space-sm: ${spacing.sm};
  --space-md: ${spacing.md};
  --space-lg: ${spacing.lg};
  --space-xl: ${spacing.xl};
  --space-2xl: ${spacing['2xl']};
  --space-3xl: ${spacing['3xl']};
  --space-4xl: ${spacing['4xl']};
  --space-5xl: ${spacing['5xl']};
  --space-6xl: ${spacing['6xl']};
  
  /* Shadows */
  --shadow-sm: ${shadows.sm};
  --shadow-md: ${shadows.md};
  --shadow-lg: ${shadows.lg};
  --shadow-xl: ${shadows.xl};
  --shadow-2xl: ${shadows['2xl']};
  
  /* Animation */
  --duration-fast: ${animation.duration.fast};
  --duration-normal: ${animation.duration.normal};
  --duration-slow: ${animation.duration.slow};
  
  --ease-linear: ${animation.easing.linear};
  --ease-ease: ${animation.easing.ease};
  --ease-in: ${animation.easing.easeIn};
  --ease-out: ${animation.easing.easeOut};
  --ease-in-out: ${animation.easing.easeInOut};
}

.dark {
  --background: ${this.invertColor(colors.background)};
  --foreground: ${this.invertColor(colors.foreground)};
  --card: ${this.invertColor(colors.card)};
  --card-foreground: ${this.invertColor(colors.cardForeground)};
  --popover: ${this.invertColor(colors.popover)};
  --popover-foreground: ${this.invertColor(colors.popoverForeground)};
  --primary: ${this.lightenColor(colors.primary, 10)};
  --primary-foreground: ${this.invertColor(colors.primary)};
  --secondary: ${this.darkenColor(colors.secondary, 10)};
  --secondary-foreground: ${this.invertColor(colors.secondary)};
  --muted: ${this.darkenColor(colors.muted, 10)};
  --muted-foreground: ${this.lightenColor(colors.mutedForeground, 20)};
  --accent: ${this.darkenColor(colors.accent, 10)};
  --accent-foreground: ${this.invertColor(colors.accent)};
  --destructive: ${this.lightenColor(colors.destructive, 10)};
  --destructive-foreground: ${this.invertColor(colors.destructive)};
  --border: ${this.darkenColor(colors.border, 20)};
  --input: ${this.darkenColor(colors.input, 20)};
  --ring: ${colors.primary};
}
    `;
  }

  static generateTailwindConfig(theme: ThemeConfig) {
    return {
      content: [
        './pages/**/*.{js,ts,jsx,tsx,mdx}',
        './components/**/*.{js,ts,jsx,tsx,mdx}',
        './app/**/*.{js,ts,jsx,tsx,mdx}',
      ],
      darkMode: 'class',
      theme: {
        container: {
          center: true,
          padding: '2rem',
          screens: {
            '2xl': '1400px',
          },
        },
        extend: {
          colors: {
            border: 'hsl(var(--border))',
            input: 'hsl(var(--input))',
            ring: 'hsl(var(--ring))',
            background: 'hsl(var(--background))',
            foreground: 'hsl(var(--foreground))',
            primary: {
              DEFAULT: 'hsl(var(--primary))',
              foreground: 'hsl(var(--primary-foreground))',
            },
            secondary: {
              DEFAULT: 'hsl(var(--secondary))',
              foreground: 'hsl(var(--secondary-foreground))',
            },
            destructive: {
              DEFAULT: 'hsl(var(--destructive))',
              foreground: 'hsl(var(--destructive-foreground))',
            },
            muted: {
              DEFAULT: 'hsl(var(--muted))',
              foreground: 'hsl(var(--muted-foreground))',
            },
            accent: {
              DEFAULT: 'hsl(var(--accent))',
              foreground: 'hsl(var(--accent-foreground))',
            },
            popover: {
              DEFAULT: 'hsl(var(--popover))',
              foreground: 'hsl(var(--popover-foreground))',
            },
            card: {
              DEFAULT: 'hsl(var(--card))',
              foreground: 'hsl(var(--card-foreground))',
            },
          },
          borderRadius: {
            lg: 'var(--radius)',
            md: 'calc(var(--radius) - 2px)',
            sm: 'calc(var(--radius) - 4px)',
          },
          fontFamily: {
            sans: ['var(--font-sans)'],
            mono: ['var(--font-mono)'],
          },
          fontSize: {
            xs: ['var(--text-xs)', { lineHeight: 'var(--leading-tight)' }],
            sm: ['var(--text-sm)', { lineHeight: 'var(--leading-snug)' }],
            base: ['var(--text-base)', { lineHeight: 'var(--leading-normal)' }],
            lg: ['var(--text-lg)', { lineHeight: 'var(--leading-relaxed)' }],
            xl: ['var(--text-xl)', { lineHeight: 'var(--leading-relaxed)' }],
            '2xl': ['var(--text-2xl)', { lineHeight: 'var(--leading-relaxed)' }],
            '3xl': ['var(--text-3xl)', { lineHeight: 'var(--leading-relaxed)' }],
            '4xl': ['var(--text-4xl)', { lineHeight: 'var(--leading-tight)' }],
            '5xl': ['var(--text-5xl)', { lineHeight: 'var(--leading-tight)' }],
            '6xl': ['var(--text-6xl)', { lineHeight: 'var(--leading-tight)' }],
          },
          fontWeight: {
            thin: 'var(--font-thin)',
            light: 'var(--font-light)',
            normal: 'var(--font-normal)',
            medium: 'var(--font-medium)',
            semibold: 'var(--font-semibold)',
            bold: 'var(--font-bold)',
            extrabold: 'var(--font-extrabold)',
            black: 'var(--font-black)',
          },
          spacing: {
            xs: 'var(--space-xs)',
            sm: 'var(--space-sm)',
            md: 'var(--space-md)',
            lg: 'var(--space-lg)',
            xl: 'var(--space-xl)',
            '2xl': 'var(--space-2xl)',
            '3xl': 'var(--space-3xl)',
            '4xl': 'var(--space-4xl)',
            '5xl': 'var(--space-5xl)',
            '6xl': 'var(--space-6xl)',
          },
          boxShadow: {
            sm: 'var(--shadow-sm)',
            md: 'var(--shadow-md)',
            lg: 'var(--shadow-lg)',
            xl: 'var(--shadow-xl)',
            '2xl': 'var(--shadow-2xl)',
          },
          transitionDuration: {
            fast: 'var(--duration-fast)',
            normal: 'var(--duration-normal)',
            slow: 'var(--duration-slow)',
          },
          transitionTimingFunction: {
            linear: 'var(--ease-linear)',
            ease: 'var(--ease-ease)',
            'ease-in': 'var(--ease-in)',
            'ease-out': 'var(--ease-out)',
            'ease-in-out': 'var(--ease-in-out)',
          },
        },
      },
      plugins: [require('tailwindcss-animate')],
    };
  }

  private static invertColor(color: string): string {
    // Simple color inversion logic - would need more sophisticated implementation
    return color;
  }

  private static lightenColor(color: string, percent: number): string {
    // Color lightening logic
    return color;
  }

  private static darkenColor(color: string, percent: number): string {
    // Color darkening logic
    return color;
  }
}
```

#### 5.7.2 Component Variation Guidelines

**Component Variant System**:
```typescript
// === Section 5.7: Component Variation Guidelines ===
// Context: Comprehensive component variation system for shadcn/ui
// Prerequisites: Understanding of component composition and variant patterns

// src/components/variants/button-variants.ts
import { cva, type VariantProps } from 'class-variance-authority';

export const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
        // Custom variants
        success: 'bg-green-600 text-white hover:bg-green-700',
        warning: 'bg-yellow-600 text-white hover:bg-yellow-700',
        info: 'bg-blue-600 text-white hover:bg-blue-700',
        gradient: 'bg-gradient-to-r from-purple-600 to-blue-600 text-white hover:from-purple-700 hover:to-blue-700',
        glass: 'bg-white/10 backdrop-blur-sm border border-white/20 text-white hover:bg-white/20',
        neon: 'bg-black text-cyan-400 border border-cyan-400 hover:bg-cyan-400 hover:text-black',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'h-10 w-10',
        // Custom sizes
        xs: 'h-8 rounded px-2 text-xs',
        xl: 'h-12 rounded-lg px-10 text-lg',
        '2xl': 'h-14 rounded-lg px-12 text-xl',
      },
      fullWidth: {
        true: 'w-full',
        false: 'w-auto',
      },
      rounded: {
        none: 'rounded-none',
        sm: 'rounded-sm',
        md: 'rounded-md',
        lg: 'rounded-lg',
        xl: 'rounded-xl',
        full: 'rounded-full',
      },
      animation: {
        none: '',
        pulse: 'animate-pulse',
        bounce: 'animate-bounce',
        spin: 'animate-spin',
        ping: 'animate-ping',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
      fullWidth: false,
      rounded: 'md',
      animation: 'none',
    },
  }
);

export type ButtonVariants = VariantProps<typeof buttonVariants>;

// src/components/variants/card-variants.ts
export const cardVariants = cva(
  'rounded-lg border bg-card text-card-foreground shadow-sm',
  {
    variants: {
      variant: {
        default: 'border-border',
        elevated: 'border-border shadow-lg',
        outlined: 'border-2 border-border',
        ghost: 'border-transparent bg-transparent shadow-none',
        filled: 'bg-muted border-transparent',
        gradient: 'bg-gradient-to-br from-purple-600 to-blue-600 border-transparent text-white',
        glass: 'bg-white/10 backdrop-blur-sm border-white/20 text-white',
        neon: 'bg-black border-cyan-400 text-cyan-400 shadow-[0_0_20px_rgba(6,182,212,0.5)]',
      },
      size: {
        sm: 'p-3',
        default: 'p-6',
        lg: 'p-8',
        xl: 'p-10',
      },
      rounded: {
        none: 'rounded-none',
        sm: 'rounded-sm',
        md: 'rounded-lg',
        lg: 'rounded-xl',
        xl: 'rounded-2xl',
        full: 'rounded-full',
      },
      interactive: {
        true: 'cursor-pointer hover:shadow-md transition-shadow duration-200',
        false: '',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
      rounded: 'lg',
      interactive: false,
    },
  }
);

export type CardVariants = VariantProps<typeof cardVariants>;

// src/components/variants/input-variants.ts
export const inputVariants = cva(
  'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'border-input',
        error: 'border-destructive focus:border-destructive focus:ring-destructive',
        success: 'border-green-500 focus:border-green-500 focus:ring-green-500',
        warning: 'border-yellow-500 focus:border-yellow-500 focus:ring-yellow-500',
        ghost: 'border-transparent bg-transparent focus:border-input',
        filled: 'bg-muted border-transparent focus:bg-background focus:border-input',
        underline: 'border-b-2 border-x-0 border-t-0 rounded-none px-0 bg-transparent focus:border-ring',
        neon: 'border-cyan-400 bg-black text-cyan-400 focus:border-cyan-300 focus:ring-cyan-400',
      },
      size: {
        sm: 'h-8 px-2 text-xs',
        default: 'h-10 px-3 text-sm',
        lg: 'h-12 px-4 text-base',
        xl: 'h-14 px-5 text-lg',
      },
      rounded: {
        none: 'rounded-none',
        sm: 'rounded-sm',
        md: 'rounded-md',
        lg: 'rounded-lg',
        xl: 'rounded-xl',
        full: 'rounded-full',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
      rounded: 'md',
    },
  }
);

export type InputVariants = VariantProps<typeof inputVariants>;

// src/components/ui/variant-button.tsx
import React from 'react';
import { Slot } from '@radix-ui/react-slot';
import { cn } from '@/lib/utils';
import { buttonVariants, type ButtonVariants } from '@/components/variants/button-variants';

export interface VariantButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    ButtonVariants {
  asChild?: boolean;
  loading?: boolean;
  icon?: React.ReactNode;
  iconPosition?: 'left' | 'right';
}

const VariantButton = React.forwardRef<HTMLButtonElement, VariantButtonProps>(
  (
    {
      className,
      variant,
      size,
      fullWidth,
      rounded,
      animation,
      asChild = false,
      loading = false,
      icon,
      iconPosition = 'left',
      children,
      disabled,
      ...props
    },
    ref
  ) => {
    const Comp = asChild ? Slot : 'button';
    
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, fullWidth, rounded, animation, className }))}
        ref={ref}
        disabled={disabled || loading}
        {...props}
      >
        {loading && (
          <div className="mr-2 h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" />
        )}
        
        {icon && iconPosition === 'left' && (
          <span className="mr-2">{icon}</span>
        )}
        
        {children}
        
        {icon && iconPosition === 'right' && (
          <span className="ml-2">{icon}</span>
        )}
      </Comp>
    );
  }
);

VariantButton.displayName = 'VariantButton';

export { VariantButton };
```

#### 5.7.3 Styling Override Approaches

**Styling Override Patterns**:
```typescript
// === Section 5.7: Styling Override Approaches ===
// Context: Comprehensive styling override system for shadcn/ui components
// Prerequisites: Understanding of CSS specificity and styling patterns

// src/components/overrides/style-overrides.ts
export class StyleOverrideManager {
  private static overrides = new Map<string, string>();

  // Register a style override
  static registerOverride(componentName: string, styles: string): void {
    const existingStyles = this.overrides.get(componentName) || '';
    this.overrides.set(componentName, `${existingStyles}\n${styles}`);
  }

  // Get overrides for a component
  static getOverrides(componentName: string): string {
    return this.overrides.get(componentName) || '';
  }

  // Apply overrides to a component
  static applyOverrides(componentName: string, baseClasses: string): string {
    const overrides = this.getOverrides(componentName);
    return overrides ? `${baseClasses} ${overrides}` : baseClasses;
  }

  // Generate CSS for all overrides
  static generateOverrideCSS(): string {
    let css = '';
    
    for (const [component, styles] of this.overrides) {
      css += `/* ${component} overrides */\n`;
      css += styles;
      css += '\n\n';
    }
    
    return css;
  }

  // Clear all overrides
  static clearOverrides(): void {
    this.overrides.clear();
  }

  // Clear overrides for a specific component
  static clearComponentOverrides(componentName: string): void {
    this.overrides.delete(componentName);
  }
}

// Register component-specific overrides
StyleOverrideManager.registerOverride('Button', `
.btn-custom {
  /* Custom button styles */
  background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
  border: none;
  color: white;
  padding: 12px 24px;
  border-radius: 8px;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-custom:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

.btn-droid-primary {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  position: relative;
  overflow: hidden;
}

.btn-droid-primary::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
  transition: left 0.5s;
}

.btn-droid-primary:hover::before {
  left: 100%;
}
`);

StyleOverrideManager.registerOverride('Card', `
.card-droid {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  color: white;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  position: relative;
  overflow: hidden;
}

.card-droid::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
  animation: shimmer 3s infinite;
}

@keyframes shimmer {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.card-glass {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

.card-neon {
  background: #0a0a0a;
  border: 1px solid #00ffff;
  box-shadow: 0 0 20px rgba(0, 255, 255, 0.5),
              inset 0 0 20px rgba(0, 255, 255, 0.1);
  color: #00ffff;
}
`);

// src/components/ui/overridable-button.tsx
import React from 'react';
import { Slot } from '@radix-ui/react-slot';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';
import { StyleOverrideManager } from '@/components/overrides/style-overrides';

const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
);

export interface OverridableButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean;
  loading?: boolean;
  overrideStyle?: string;
  customClasses?: string;
}

const OverridableButton = React.forwardRef<HTMLButtonElement, OverridableButtonProps>(
  (
    {
      className,
      variant,
      size,
      asChild = false,
      loading = false,
      overrideStyle,
      customClasses,
      children,
      disabled,
      ...props
    },
    ref
  ) => {
    const Comp = asChild ? Slot : 'button';
    
    // Apply base variant classes
    let classes = buttonVariants({ variant, size, className });
    
    // Apply override styles
    if (overrideStyle) {
      classes = StyleOverrideManager.applyOverrides(overrideStyle, classes);
    }
    
    // Apply custom classes
    if (customClasses) {
      classes = cn(classes, customClasses);
    }
    
    return (
      <Comp
        className={classes}
        ref={ref}
        disabled={disabled || loading}
        {...props}
      >
        {loading && (
          <div className="mr-2 h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent" />
        )}
        {children}
      </Comp>
    );
  }
);

OverridableButton.displayName = 'OverridableButton';

export { OverridableButton, buttonVariants };

// src/hooks/use-style-override.ts
import { useMemo } from 'react';
import { StyleOverrideManager } from '@/components/overrides/style-overrides';

export interface UseStyleOverrideOptions {
  component: string;
  baseClasses?: string;
  overrides?: string;
  customClasses?: string;
}

export function useStyleOverride({
  component,
  baseClasses = '',
  overrides,
  customClasses
}: UseStyleOverrideOptions) {
  return useMemo(() => {
    let classes = baseClasses;
    
    // Apply registered overrides
    classes = StyleOverrideManager.applyOverrides(component, classes);
    
    // Apply custom overrides
    if (overrides) {
      classes = StyleOverrideManager.applyOverrides(component, classes);
    }
    
    // Apply custom classes
    if (customClasses) {
      classes = `${classes} ${customClasses}`;
    }
    
    return classes;
  }, [component, baseClasses, overrides, customClasses]);
}

// Usage example:
// const buttonClasses = useStyleOverride({
//   component: 'Button',
//   baseClasses: 'bg-primary text-primary-foreground',
//   customClasses: 'additional-custom-class'
// });
```

#### 5.7.4 Design System Integration

**Design System Integration**:
```typescript
// === Section 5.7: Design System Integration ===
// Context: Complete design system integration for shadcn/ui components
// Prerequisites: Understanding of design tokens and design systems

// src/design-system/tokens.ts
export interface DesignTokens {
  colors: {
    primary: {
      50: string;
      100: string;
      200: string;
      300: string;
      400: string;
      500: string;
      600: string;
      700: string;
      800: string;
      900: string;
      950: string;
    };
    secondary: ColorScale;
    accent: ColorScale;
    neutral: ColorScale;
    success: ColorScale;
    warning: ColorScale;
    error: ColorScale;
    info: ColorScale;
  };
  spacing: {
    0: string;
    1: string;
    2: string;
    3: string;
    4: string;
    5: string;
    6: string;
    8: string;
    10: string;
    12: string;
    16: string;
    20: string;
    24: string;
    32: string;
    40: string;
    48: string;
    56: string;
    64: string;
    80: string;
    96: string;
  };
  typography: {
    fontFamily: {
      sans: string[];
      serif: string[];
      mono: string[];
    };
    fontSize: {
      xs: [string, string];
      sm: [string, string];
      base: [string, string];
      lg: [string, string];
      xl: [string, string];
      '2xl': [string, string];
      '3xl': [string, string];
      '4xl': [string, string];
      '5xl': [string, string];
      '6xl': [string, string];
      '7xl': [string, string];
      '8xl': [string, string];
      '9xl': [string, string];
    };
    fontWeight: {
      thin: number;
      light: number;
      normal: number;
      medium: number;
      semibold: number;
      bold: number;
      extrabold: number;
      black: number;
    };
    lineHeight: {
      tight: number;
      snug: number;
      normal: number;
      relaxed: number;
      loose: number;
    };
    letterSpacing: {
      tighter: string;
      tight: string;
      normal: string;
      wide: string;
      wider: string;
      widest: string;
    };
  };
  borderRadius: {
    none: string;
    sm: string;
    md: string;
    lg: string;
    xl: string;
    '2xl': string;
    '3xl': string;
    full: string;
  };
  shadows: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
    '2xl': string;
    inner: string;
  };
  animation: {
    duration: {
      fast: string;
      normal: string;
      slow: string;
    };
    easing: {
      linear: string;
      ease: string;
      easeIn: string;
      easeOut: string;
      easeInOut: string;
    };
  };
  breakpoints: {
    sm: string;
    md: string;
    lg: string;
    xl: string;
    '2xl': string;
  };
  zIndex: {
    hide: number;
    auto: number;
    base: number;
    docked: number;
    dropdown: number;
    sticky: number;
    banner: number;
    overlay: number;
    modal: number;
    popover: number;
    skipLink: number;
    toast: number;
    tooltip: number;
  };
}

export interface ColorScale {
  50: string;
  100: string;
  200: string;
  300: string;
  400: string;
  500: string;
  600: string;
  700: string;
  800: string;
  900: string;
  950: string;
}

// src/design-system/factory-tokens.ts
export const factoryDesignTokens: DesignTokens = {
  colors: {
    primary: {
      50: '#f0f9ff',
      100: '#e0f2fe',
      200: '#bae6fd',
      300: '#7dd3fc',
      400: '#38bdf8',
      500: '#0ea5e9',
      600: '#0284c7',
      700: '#0369a1',
      800: '#075985',
      900: '#0c4a6e',
      950: '#082f49',
    },
    secondary: {
      50: '#f8fafc',
      100: '#f1f5f9',
      200: '#e2e8f0',
      300: '#cbd5e1',
      400: '#94a3b8',
      500: '#64748b',
      600: '#475569',
      700: '#334155',
      800: '#1e293b',
      900: '#0f172a',
      950: '#020617',
    },
    accent: {
      50: '#fdf4ff',
      100: '#fae8ff',
      200: '#f5d0fe',
      300: '#f0abfc',
      400: '#e879f9',
      500: '#d946ef',
      600: '#c026d3',
      700: '#a21caf',
      800: '#86198f',
      900: '#701a75',
      950: '#4a044e',
    },
    neutral: {
      50: '#fafafa',
      100: '#f4f4f5',
      200: '#e4e4e7',
      300: '#d4d4d8',
      400: '#a1a1aa',
      500: '#71717a',
      600: '#52525b',
      700: '#3f3f46',
      800: '#27272a',
      900: '#18181b',
      950: '#09090b',
    },
    success: {
      50: '#f0fdf4',
      100: '#dcfce7',
      200: '#bbf7d0',
      300: '#86efac',
      400: '#4ade80',
      500: '#22c55e',
      600: '#16a34a',
      700: '#15803d',
      800: '#166534',
      900: '#14532d',
      950: '#052e16',
    },
    warning: {
      50: '#fffbeb',
      100: '#fef3c7',
      200: '#fde68a',
      300: '#fcd34d',
      400: '#fbbf24',
      500: '#f59e0b',
      600: '#d97706',
      700: '#b45309',
      800: '#92400e',
      900: '#78350f',
      950: '#451a03',
    },
    error: {
      50: '#fef2f2',
      100: '#fee2e2',
      200: '#fecaca',
      300: '#fca5a5',
      400: '#f87171',
      500: '#ef4444',
      600: '#dc2626',
      700: '#b91c1c',
      800: '#991b1b',
      900: '#7f1d1d',
      950: '#450a0a',
    },
    info: {
      50: '#eff6ff',
      100: '#dbeafe',
      200: '#bfdbfe',
      300: '#93c5fd',
      400: '#60a5fa',
      500: '#3b82f6',
      600: '#2563eb',
      700: '#1d4ed8',
      800: '#1e40af',
      900: '#1e3a8a',
      950: '#172554',
    },
  },
  spacing: {
    0: '0px',
    1: '0.25rem',
    2: '0.5rem',
    3: '0.75rem',
    4: '1rem',
    5: '1.25rem',
    6: '1.5rem',
    8: '2rem',
    10: '2.5rem',
    12: '3rem',
    16: '4rem',
    20: '5rem',
    24: '6rem',
    32: '8rem',
    40: '10rem',
    48: '12rem',
    56: '14rem',
    64: '16rem',
    80: '20rem',
    96: '24rem',
  },
  typography: {
    fontFamily: {
      sans: ['Inter', 'system-ui', 'sans-serif'],
      serif: ['Georgia', 'serif'],
      mono: ['JetBrains Mono', 'monospace'],
    },
    fontSize: {
      xs: ['0.75rem', { lineHeight: '1rem' }],
      sm: ['0.875rem', { lineHeight: '1.25rem' }],
      base: ['1rem', { lineHeight: '1.5rem' }],
      lg: ['1.125rem', { lineHeight: '1.75rem' }],
      xl: ['1.25rem', { lineHeight: '1.75rem' }],
      '2xl': ['1.5rem', { lineHeight: '2rem' }],
      '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
      '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
      '5xl': ['3rem', { lineHeight: '1' }],
      '6xl': ['3.75rem', { lineHeight: '1' }],
      '7xl': ['4.5rem', { lineHeight: '1' }],
      '8xl': ['6rem', { lineHeight: '1' }],
      '9xl': ['8rem', { lineHeight: '1' }],
    },
    fontWeight: {
      thin: 100,
      light: 300,
      normal: 400,
      medium: 500,
      semibold: 600,
      bold: 700,
      extrabold: 800,
      black: 900,
    },
    lineHeight: {
      tight: 1.25,
      snug: 1.375,
      normal: 1.5,
      relaxed: 1.625,
      loose: 2,
    },
    letterSpacing: {
      tighter: '-0.05em',
      tight: '-0.025em',
      normal: '0em',
      wide: '0.025em',
      wider: '0.05em',
      widest: '0.1em',
    },
  },
  borderRadius: {
    none: '0',
    sm: '0.125rem',
    md: '0.375rem',
    lg: '0.5rem',
    xl: '0.75rem',
    '2xl': '1rem',
    '3xl': '1.5rem',
    full: '9999px',
  },
  shadows: {
    sm: '0 1px 2px 0 rgb(0 0 0 / 0.05)',
    md: '0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)',
    lg: '0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)',
    xl: '0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)',
    '2xl': '0 25px 50px -12px rgb(0 0 0 / 0.25)',
    inner: 'inset 0 2px 4px 0 rgb(0 0 0 / 0.05)',
  },
  animation: {
    duration: {
      fast: '150ms',
      normal: '250ms',
      slow: '350ms',
    },
    easing: {
      linear: 'linear',
      ease: 'ease',
      easeIn: 'ease-in',
      easeOut: 'ease-out',
      easeInOut: 'ease-in-out',
    },
  },
  breakpoints: {
    sm: '640px',
    md: '768px',
    lg: '1024px',
    xl: '1280px',
    '2xl': '1536px',
  },
  zIndex: {
    hide: -1,
    auto: 'auto',
    base: 0,
    docked: 10,
    dropdown: 1000,
    sticky: 1100,
    banner: 1200,
    overlay: 1300,
    modal: 1400,
    popover: 1500,
    skipLink: 1600,
    toast: 1700,
    tooltip: 1800,
  },
};

// src/design-system/generator.ts
export class DesignSystemGenerator {
  static generateTailwindConfig(tokens: DesignTokens) {
    return {
      content: [
        './pages/**/*.{js,ts,jsx,tsx,mdx}',
        './components/**/*.{js,ts,jsx,tsx,mdx}',
        './app/**/*.{js,ts,jsx,tsx,mdx}',
      ],
      darkMode: 'class',
      theme: {
        colors: this.generateColors(tokens.colors),
        spacing: tokens.spacing,
        fontFamily: tokens.typography.fontFamily,
        fontSize: tokens.typography.fontSize,
        fontWeight: tokens.typography.fontWeight,
        lineHeight: tokens.typography.lineHeight,
        letterSpacing: tokens.typography.letterSpacing,
        borderRadius: tokens.borderRadius,
        boxShadow: tokens.shadows,
        transitionDuration: tokens.animation.duration,
        transitionTimingFunction: tokens.animation.easing,
        screens: tokens.breakpoints,
        zIndex: tokens.zIndex,
        extend: {
          animation: {
            'fade-in': 'fadeIn 0.5s ease-in-out',
            'fade-out': 'fadeOut 0.5s ease-in-out',
            'slide-in': 'slideIn 0.3s ease-out',
            'slide-out': 'slideOut 0.3s ease-in',
            'bounce-in': 'bounceIn 0.6s ease-out',
            'scale-in': 'scaleIn 0.2s ease-out',
          },
          keyframes: {
            fadeIn: {
              '0%': { opacity: '0' },
              '100%': { opacity: '1' },
            },
            fadeOut: {
              '0%': { opacity: '1' },
              '100%': { opacity: '0' },
            },
            slideIn: {
              '0%': { transform: 'translateX(-100%)' },
              '100%': { transform: 'translateX(0)' },
            },
            slideOut: {
              '0%': { transform: 'translateX(0)' },
              '100%': { transform: 'translateX(100%)' },
            },
            bounceIn: {
              '0%': { transform: 'scale(0.3)', opacity: '0' },
              '50%': { transform: 'scale(1.05)' },
              '70%': { transform: 'scale(0.9)' },
              '100%': { transform: 'scale(1)', opacity: '1' },
            },
            scaleIn: {
              '0%': { transform: 'scale(0.9)', opacity: '0' },
              '100%': { transform: 'scale(1)', opacity: '1' },
            },
          },
        },
      },
      plugins: [require('tailwindcss-animate')],
    };
  }

  static generateCSSVariables(tokens: DesignTokens): string {
    let css = ':root {\n';
    
    // Generate color variables
    Object.entries(tokens.colors).forEach(([colorName, colorScale]) => {
      Object.entries(colorScale).forEach(([shade, value]) => {
        css += `  --color-${colorName}-${shade}: ${value};\n`;
      });
    });
    
    // Generate spacing variables
    Object.entries(tokens.spacing).forEach(([key, value]) => {
      css += `  --spacing-${key}: ${value};\n`;
    });
    
    // Generate typography variables
    css += `  --font-sans: ${tokens.typography.fontFamily.sans.join(', ')};\n`;
    css += `  --font-serif: ${tokens.typography.fontFamily.serif.join(', ')};\n`;
    css += `  --font-mono: ${tokens.typography.fontFamily.mono.join(', ')};\n`;
    
    // Generate border radius variables
    Object.entries(tokens.borderRadius).forEach(([key, value]) => {
      css += `  --radius-${key}: ${value};\n`;
    });
    
    // Generate shadow variables
    Object.entries(tokens.shadows).forEach(([key, value]) => {
      css += `  --shadow-${key}: ${value};\n`;
    });
    
    // Generate animation variables
    Object.entries(tokens.animation.duration).forEach(([key, value]) => {
      css += `  --duration-${key}: ${value};\n`;
    });
    
    Object.entries(tokens.animation.easing).forEach(([key, value]) => {
      css += `  --ease-${key}: ${value};\n`;
    });
    
    css += '}\n\n';
    
    // Generate dark mode variables
    css += '.dark {\n';
    css += '  color-scheme: dark;\n';
    
    // Override colors for dark mode
    Object.entries(tokens.colors).forEach(([colorName, colorScale]) => {
      if (colorName === 'neutral') {
        css += `  --color-neutral-50: ${colorScale[950]};\n`;
        css += `  --color-neutral-100: ${colorScale[900]};\n`;
        css += `  --color-neutral-200: ${colorScale[800]};\n`;
        css += `  --color-neutral-300: ${colorScale[700]};\n`;
        css += `  --color-neutral-400: ${colorScale[600]};\n`;
        css += `  --color-neutral-500: ${colorScale[500]};\n`;
        css += `  --color-neutral-600: ${colorScale[400]};\n`;
        css += `  --color-neutral-700: ${colorScale[300]};\n`;
        css += `  --color-neutral-800: ${colorScale[200]};\n`;
        css += `  --color-neutral-900: ${colorScale[100]};\n`;
        css += `  --color-neutral-950: ${colorScale[50]};\n`;
      }
    });
    
    css += '}\n';
    
    return css;
  }

  private static generateColors(colors: DesignTokens['colors']) {
    const tailwindColors: any = {};
    
    Object.entries(colors).forEach(([colorName, colorScale]) => {
      tailwindColors[colorName] = {};
      Object.entries(colorScale).forEach(([shade, value]) => {
        tailwindColors[colorName][shade] = value;
      });
    });
    
    return tailwindColors;
  }
}
```

#### 5.7.5 shadcn/ui Component Customization Validation Checklist

**Before deploying custom components, verify**:
- [ ] **Theme Consistency**: All components follow the established theme system
- [ ] **Design Tokens**: Design tokens are properly implemented and used
- [ ] **Responsive Design**: Components work across all breakpoints
- [ ] **Accessibility**: Customizations maintain WCAG compliance
- [ ] **Performance**: Customizations don't significantly impact performance
- [ ] **Browser Compatibility**: Components work across target browsers
- [ ] **Testing**: Custom components have comprehensive test coverage
- [ ] **Documentation**: Custom components are properly documented
- [ ] **Version Control**: Custom styles are tracked and versioned
- [ ] **Design System**: Customizations align with the overall design system

#### 5.7.6 Common Customization Issues & Solutions

- **Issue**: Custom styles not applying to components
  - **Solution**: Check CSS specificity and ensure proper class names are used
- **Issue**: Theme switching not working with custom styles
  - **Solution**: Ensure CSS variables are properly defined for both light and dark themes
- **Issue**: Component variations breaking functionality
  - **Solution**: Test all variant combinations and ensure proper component composition
- **Issue**: Performance issues with complex customizations
  - **Solution**: Optimize CSS and minimize unnecessary re-renders
- **Issue**: Design inconsistency across components
  - **Solution**: Use a centralized design system and ensure consistent token usage

#### 5.7.7 Related Sections
- Section 5.5: shadcn/ui integration patterns
- Section 5.6: shadcn/ui CLI usage guidelines
- Section 6.1: Testing patterns for custom components
- Section 5.1: TypeScript patterns for component customization

#### 5.7.8 Droid Delegation Notes
- **Recommended Droid**: frontend-engineer-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 5-6 hours for comprehensive customization system
- **Prerequisites**: Understanding of design systems, CSS variables, and component architecture

### 5.8 File Structure Guidelines

*This section will be expanded to include specific patterns*

---

## 6. Testing Methodology

### 6.1 Test-Driven Development (TDD)

#### 6.1.1 Core TDD Principles

**Context**: Establish Test-Driven Development methodology for Factory.ai droids to ensure 90-100% test coverage while maintaining cognitive simplicity and development efficiency.

**Key Concepts**:
- **Red-Green-Refactor**: Write failing test, make it pass, then improve code quality
- **Test First**: Always write tests before implementing functionality
- **Small Steps**: Write the smallest possible test that fails, then implement minimal code
- **Deterministic Tests**: Tests must be repeatable and independent
- **Fast Feedback**: Tests should run quickly to enable continuous development

#### 6.1.2 TDD Workflow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│     RED     │───▶│    GREEN    │───▶│  REFACTOR   │───▶│   REPEAT    │
│             │    │             │    │             │    │             │
│ • Write     │    │ • Make      │    │ • Improve   │    │ • Next      │
│   failing   │    │   test      │    │   design    │    │   test      │
│ • test      │    │ • pass      │    │ • Remove    │    │ • cycle     │
│ • Confirm   │    │ • Minimal   │    │   duplication│    │ • Continue  │
│   failure   │    │   code      │    │ • Optimize  │    │ • Iterate  │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

#### 6.1.3 Implementation Guidelines

1. **Test Structure**: Follow Arrange-Act-Assert (AAA) pattern
2. **Test Naming**: Use descriptive names that explain the scenario and expected outcome
3. **Test Isolation**: Each test should be independent and not rely on other tests
4. **Mocking**: Use mocks for external dependencies to ensure deterministic behavior
5. **Coverage**: Maintain 90-100% coverage across unit, integration, and E2E tests

#### 6.1.4 Code Example

```typescript
// === Section 6.1: TDD Implementation Example ===
// Context: Testing a user authentication function
// Prerequisites: Understanding of Jest/Vitest and TypeScript

// 1. RED: Write failing test first
describe('User Authentication', () => {
  it('should authenticate user with valid credentials', async () => {
    // Arrange: Setup test data and mocks
    const mockUser = { id: '123', email: 'test@example.com', password: 'hashedPassword' };
    const userRepository = {
      findByEmail: jest.fn().mockResolvedValue(mockUser),
    };
    const authService = new AuthService(userRepository);
    
    // Act: Call the function being tested
    const result = await authService.authenticate('test@example.com', 'password');
    
    // Assert: Verify the expected outcome
    expect(result.success).toBe(true);
    expect(result.user.id).toBe('123');
    expect(userRepository.findByEmail).toHaveBeenCalledWith('test@example.com');
  });

  it('should reject authentication with invalid credentials', async () => {
    // Test case for failure scenario
    const userRepository = {
      findByEmail: jest.fn().mockResolvedValue(null),
    };
    const authService = new AuthService(userRepository);
    
    const result = await authService.authenticate('test@example.com', 'wrongpassword');
    
    expect(result.success).toBe(false);
    expect(result.error).toBe('Invalid credentials');
  });
});

// 2. GREEN: Implement minimal code to make tests pass
export class AuthService {
  constructor(private userRepository: UserRepository) {}
  
  async authenticate(email: string, password: string): Promise<AuthResult> {
    const user = await this.userRepository.findByEmail(email);
    
    if (!user) {
      return { success: false, error: 'Invalid credentials' };
    }
    
    // Simplified password check for demonstration
    if (user.password === this.hashPassword(password)) {
      return { success: true, user: { id: user.id, email: user.email } };
    }
    
    return { success: false, error: 'Invalid credentials' };
  }
  
  private hashPassword(password: string): string {
    // Implementation would use proper password hashing
    return 'hashedPassword';
  }
}

// 3. REFACTOR: Improve code quality while keeping tests green
export interface AuthUserRepository {
  findByEmail(email: string): Promise<AuthUser | null>;
}

export interface AuthUser {
  id: string;
  email: string;
  password: string;
}

export interface AuthResult {
  success: boolean;
  user?: { id: string; email: string };
  error?: string;
}
```

#### 6.1.5 Validation Checklist

- [ ] Tests are written before implementation code
- [ ] Each test follows Arrange-Act-Assert pattern
- [ ] Test names clearly describe the scenario and expected outcome
- [ ] Tests are independent and don't rely on shared state
- [ ] External dependencies are properly mocked
- [ ] Tests cover both happy path and error scenarios
- [ ] Coverage reports show 90-100% coverage
- [ ] Tests run quickly and reliably

#### 6.1.6 Common Issues & Solutions

- **Issue**: Tests are brittle and break with implementation changes
  - **Solution**: Focus on testing behavior and outcomes, not implementation details
- **Issue**: Tests are slow due to real database/network calls
  - **Solution**: Use comprehensive mocking and test doubles
- **Issue**: Test coverage is misleading (high coverage, low quality)
  - **Solution**: Focus on meaningful test scenarios and edge cases

#### 6.1.7 Related Sections
- Section 6.2: Coverage requirements and measurement
- Section 6.3: Testing patterns for different test types
- Section 5.1: TypeScript patterns for test code

#### 6.1.8 Droid Delegation Notes
- **Recommended Droid**: unit-test-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 3-4 hours for comprehensive TDD methodology
- **Prerequisites**: Understanding of testing frameworks and TDD concepts

### 6.2 Coverage Requirements

- **Target**: 90-100% test coverage
- **Types**: Unit, Integration, E2E, Performance, Security
- **Tools**: Jest/Vitest, Testing Library, Playwright

### 6.3 Testing Patterns

*This section will be expanded with specific patterns and examples*

---

## 7. Project Management Workflow

### 7.1 AI Dev Tasks Integration

#### 7.1.1 Repository Integration Overview

**Context**: Establish comprehensive integration patterns for the AI Dev Tasks GitHub repository (https://github.com/snarktank/ai-dev-tasks) to ensure Factory.ai droids can leverage the latest workflow improvements and maintain consistency with industry standards.

**Key Concepts**:
- **Direct GitHub Integration**: Always download and execute files directly from the repository
- **Latest Workflow Files**: Use the most recent versions of create-prd.md, generate-tasks.md, and process-task-list.md
- **No Local Copies**: Avoid using local copies to prevent workflow drift
- **Continuous Updates**: Regularly check for and integrate workflow improvements

#### 7.1.2 Repository Structure and Core Files

**AI Dev Tasks Repository Overview**:
- **Repository**: https://github.com/snarktank/ai-dev-tasks
- **Stars**: 6,330+ (indicating strong community adoption)
- **Forks**: 1,495+ (showing active use and customization)
- **Purpose**: Standardized AI development workflow management

**Core Workflow Files**:
1. **create-prd.md**: PRD generation with clarifying questions
2. **generate-tasks.md**: Task list generation with validation
3. **process-task-list.md**: Task completion with progress tracking

#### 7.1.3 Download and Setup Commands

**Primary Download Commands**:
```bash
# === Section 7.1: AI Dev Tasks Setup Commands ===
# Context: Download and setup commands for AI Dev Tasks workflow
# Prerequisites: curl command and appropriate directory permissions

# Create AI Dev Tasks directory
mkdir -p /ai-dev-tasks
cd /ai-dev-tasks

# Download core workflow files directly from GitHub
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md -o create-prd.md
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md -o generate-tasks.md
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md -o process-task-list.md

# Verify downloads
ls -la *.md

# Make files executable (if needed)
chmod +x *.md
```

**Alternative Setup for Different Environments**:
```bash
# For Windows environments (using PowerShell)
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md" -OutFile "create-prd.md"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md" -OutFile "generate-tasks.md"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md" -OutFile "process-task-list.md"

# For environments with wget instead of curl
wget https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md -O create-prd.md
wget https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md -O generate-tasks.md
wget https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md -O process-task-list.md
```

#### 7.1.4 Workflow Integration Patterns

**Pattern 1: Direct GitHub Execution**
```bash
# Execute directly from GitHub without local storage
curl -s https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md | bash -s -- [project-idea]

# Benefits:
# - Always uses latest workflow
# - No local file management
# - Consistent across environments
```

**Pattern 2: Local Cache with Auto-Update**
```bash
# Setup with automatic update checking
#!/bin/bash
# ai-dev-tasks-setup.sh

AI_DEV_TASKS_DIR="/ai-dev-tasks"
REPO_URL="https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main"

# Create directory
mkdir -p "$AI_DEV_TASKS_DIR"

# Download or update files
for file in create-prd.md generate-tasks.md process-task-list.md; do
    echo "Downloading/Updating $file..."
    curl -L "$REPO_URL/$file" -o "$AI_DEV_TASKS_DIR/$file"
done

echo "AI Dev Tasks setup complete. Files in $AI_DEV_TASKS_DIR"
```

**Pattern 3: Containerized Integration**
```dockerfile
# Dockerfile for AI Dev Tasks environment
FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache curl bash

# Create AI Dev Tasks directory
RUN mkdir -p /ai-dev-tasks

# Download workflow files
RUN curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md -o /ai-dev-tasks/create-prd.md && \
    curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md -o /ai-dev-tasks/generate-tasks.md && \
    curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md -o /ai-dev-tasks/process-task-list.md

# Set working directory
WORKDIR /ai-dev-tasks

# Make scripts executable
RUN chmod +x *.md

# Default command
CMD ["/bin/bash"]
```

#### 7.1.5 AI Environment Integration

**Cursor Integration**:
```typescript
// === Section 7.1: Cursor AI Integration ===
// Context: Cursor AI environment setup for AI Dev Tasks workflow
// Prerequisites: Cursor AI editor and terminal access

// .cursor/rules for AI Dev Tasks
{
  "name": "AI Dev Tasks Workflow",
  "description": "Integrate AI Dev Tasks repository workflow",
  "rules": [
    "Always download latest files from https://github.com/snarktank/ai-dev-tasks",
    "Use create-prd.md for project requirement definition",
    "Use generate-tasks.md for task list creation",
    "Use process-task-list.md for task completion tracking",
    "Never use local copies of workflow files"
  ]
}

// Cursor workspace configuration
{
  "aiDevTasks": {
    "repository": "https://github.com/snarktank/ai-dev-tasks",
    "files": [
      "create-prd.md",
      "generate-tasks.md", 
      "process-task-list.md"
    ],
    "autoUpdate": true,
    "localPath": "/ai-dev-tasks"
  }
}
```

**Claude Code Integration**:
```typescript
// Claude Code configuration for AI Dev Tasks
// .claude/config.json
{
  "workflows": {
    "aiDevTasks": {
      "enabled": true,
      "repository": "https://github.com/snarktank/ai-dev-tasks",
      "commands": {
        "createPRD": "curl -s https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md | bash",
        "generateTasks": "curl -s https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md | bash",
        "processTaskList": "curl -s https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md | bash"
      }
    }
  }
}
```

#### 7.1.6 File Organization Best Practices

**Recommended Directory Structure**:
```
project-root/
├── ai-dev-tasks/              # AI Dev Tasks workflow files
│   ├── create-prd.md         # PRD generation workflow
│   ├── generate-tasks.md     # Task list generation
│   ├── process-task-list.md  # Task completion workflow
│   └── config.json           # AI Dev Tasks configuration
├── prd/                       # Generated PRDs
│   ├── project-1-prd.md
│   ├── project-2-prd.md
│   └── template-prd.md
├── tasks/                     # Generated task lists
│   ├── project-1/
│   │   ├── tasks.md
│   │   ├── progress.md
│   │   └── completed.md
│   └── project-2/
├── docs/                      # Documentation
│   ├── workflows/
│   └── guides/
└── scripts/                   # Automation scripts
    ├── setup-ai-dev-tasks.sh
    ├── update-workflows.sh
    └── validate-tasks.sh
```

**Configuration Management**:
```json
// ai-dev-tasks/config.json
{
  "repository": {
    "url": "https://github.com/snarktank/ai-dev-tasks",
    "branch": "main",
    "lastUpdate": "2025-06-17T00:00:00Z"
  },
  "files": {
    "createPRD": {
      "url": "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md",
      "localPath": "create-prd.md",
      "checksum": "sha256:...",
      "lastVerified": "2025-06-17T00:00:00Z"
    },
    "generateTasks": {
      "url": "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md",
      "localPath": "generate-tasks.md",
      "checksum": "sha256:...",
      "lastVerified": "2025-06-17T00:00:00Z"
    },
    "processTaskList": {
      "url": "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md",
      "localPath": "process-task-list.md",
      "checksum": "sha256:...",
      "lastVerified": "2025-06-17T00:00:00Z"
    }
  },
  "autoUpdate": {
    "enabled": true,
    "schedule": "0 9 * * 1",  # Weekly on Monday at 9 AM
    "verifyChecksum": true
  }
}
```

#### 7.1.7 Troubleshooting and Error Handling

**Common Issues and Solutions**:

**Issue 1: Network Connectivity Problems**
```bash
# Diagnosis
curl -I https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md

# Solution: Use retry logic
#!/bin/bash
# download-with-retry.sh
URL="$1"
OUTPUT="$2"
MAX_RETRIES=3
RETRY_DELAY=5

for i in $(seq 1 $MAX_RETRIES); do
    if curl -L "$URL" -o "$OUTPUT"; then
        echo "Download successful"
        exit 0
    else
        echo "Download failed, attempt $i/$MAX_RETRIES"
        sleep $RETRY_DELAY
    fi
done

echo "Download failed after $MAX_RETRIES attempts"
exit 1
```

**Issue 2: File Permission Errors**
```bash
# Diagnosis
ls -la /ai-dev-tasks/
whoami

# Solution: Set proper permissions
sudo chown -R $USER:$USER /ai-dev-tasks/
chmod +x /ai-dev-tasks/*.md
```

**Issue 3: Outdated Workflow Files**
```bash
# Solution: Update script
#!/bin/bash
# update-ai-dev-tasks.sh

AI_DEV_TASKS_DIR="/ai-dev-tasks"
REPO_API="https://api.github.com/repos/snarktank/ai-dev-tasks"

# Get latest commit hash
LATEST_COMMIT=$(curl -s "$REPO_API/commits/main" | grep -o '"sha": "[^"]*"' | cut -d'"' -f4)

# Check if files need updating
for file in create-prd.md generate-tasks.md process-task-list.md; do
    REMOTE_HASH=$(curl -s "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/$file" | sha256sum | cut -d' ' -f1)
    
    if [ -f "$AI_DEV_TASKS_DIR/$file" ]; then
        LOCAL_HASH=$(sha256sum "$AI_DEV_TASKS_DIR/$file" | cut -d' ' -f1)
        
        if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
            echo "Updating $file (hash mismatch)"
            curl -L "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/$file" -o "$AI_DEV_TASKS_DIR/$file"
        fi
    else
        echo "Downloading $file (missing)"
        curl -L "https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/$file" -o "$AI_DEV_TASKS_DIR/$file"
    fi
done

echo "AI Dev Tasks files updated"
```

#### 7.1.8 Validation and Quality Assurance

**File Integrity Validation**:
```bash
#!/bin/bash
# validate-ai-dev-tasks.sh

AI_DEV_TASKS_DIR="/ai-dev-tasks"
REQUIRED_FILES=("create-prd.md" "generate-tasks.md" "process-task-list.md")

echo "Validating AI Dev Tasks setup..."

# Check directory exists
if [ ! -d "$AI_DEV_TASKS_DIR" ]; then
    echo "ERROR: AI Dev Tasks directory not found: $AI_DEV_TASKS_DIR"
    exit 1
fi

# Check required files exist
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$AI_DEV_TASKS_DIR/$file" ]; then
        echo "ERROR: Required file missing: $file"
        exit 1
    fi
done

# Validate file permissions
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -x "$AI_DEV_TASKS_DIR/$file" ]; then
        echo "WARNING: File not executable: $file"
    fi
done

# Test workflow execution (dry run)
echo "Testing workflow files..."
for file in "${REQUIRED_FILES[@]}"; do
    echo "Testing $file..."
    bash -n "$AI_DEV_TASKS_DIR/$file"
    if [ $? -eq 0 ]; then
        echo "✓ $file syntax valid"
    else
        echo "✗ $file syntax error"
        exit 1
    fi
done

echo "AI Dev Tasks validation complete"
```

**Workflow Integration Test**:
```typescript
// === Section 7.1: Workflow Integration Test ===
// Context: Test suite for AI Dev Tasks integration
// Prerequisites: Node.js and test framework

import { execSync } from 'child_process';
import { existsSync, readFileSync } from 'fs';
import { join } from 'path';

export class AIDevTasksValidator {
  private readonly aiDevTasksDir: string;
  private readonly requiredFiles = [
    'create-prd.md',
    'generate-tasks.md', 
    'process-task-list.md'
  ];

  constructor(aiDevTasksDir = '/ai-dev-tasks') {
    this.aiDevTasksDir = aiDevTasksDir;
  }

  async validateSetup(): Promise<ValidationResult> {
    const results: ValidationResult = {
      success: true,
      checks: [],
      errors: []
    };

    // Check directory exists
    if (!existsSync(this.aiDevTasksDir)) {
      results.errors.push('AI Dev Tasks directory not found');
      results.success = false;
      return results;
    }

    // Check required files
    for (const file of this.requiredFiles) {
      const filePath = join(this.aiDevTasksDir, file);
      
      if (!existsSync(filePath)) {
        results.errors.push(`Required file missing: ${file}`);
        results.success = false;
        continue;
      }

      // Validate file syntax
      try {
        execSync(`bash -n "${filePath}"`, { stdio: 'ignore' });
        results.checks.push(`✓ ${file} syntax valid`);
      } catch (error) {
        results.errors.push(`✗ ${file} syntax error`);
        results.success = false;
      }
    }

    return results;
  }

  async validateLatestFiles(): Promise<ValidationResult> {
    const results: ValidationResult = {
      success: true,
      checks: [],
      errors: []
    };

    for (const file of this.requiredFiles) {
      try {
        const remoteContent = await this.fetchRemoteFile(file);
        const localContent = readFileSync(join(this.aiDevTasksDir, file), 'utf8');
        
        if (remoteContent === localContent) {
          results.checks.push(`✓ ${file} is up to date`);
        } else {
          results.errors.push(`✗ ${file} is outdated`);
          results.success = false;
        }
      } catch (error) {
        results.errors.push(`Failed to validate ${file}: ${error}`);
        results.success = false;
      }
    }

    return results;
  }

  private async fetchRemoteFile(filename: string): Promise<string> {
    const response = await fetch(
      `https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/${filename}`
    );
    return response.text();
  }
}

interface ValidationResult {
  success: boolean;
  checks: string[];
  errors: string[];
}
```

#### 7.1.9 Integration Checklist

**Before deploying AI Dev Tasks integration, verify**:
- [ ] **Repository Access**: Can access https://github.com/snarktank/ai-dev-tasks
- [ ] **File Downloads**: All three core files download successfully
- [ ] **Directory Structure**: Proper directory structure is in place
- [ ] **File Permissions**: Files have appropriate execute permissions
- [ ] **Syntax Validation**: All workflow files pass syntax checks
- [ ] **Integration Tests**: Workflow integration tests pass
- [ ] **Update Mechanism**: Auto-update functionality is configured
- [ ] **Error Handling**: Comprehensive error handling is implemented
- [ ] **Documentation**: Integration documentation is complete and up to date
- [ ] **Backup Strategy**: Backup and recovery procedures are defined

#### 7.1.10 Best Practices and Guidelines

**Development Workflow Integration**:
1. **Always use latest files**: Download workflow files directly from GitHub for each new project
2. **Validate before use**: Run validation checks before executing workflows
3. **Monitor for updates**: Regularly check for repository updates and improvements
4. **Customize cautiously**: If customizing workflows, maintain compatibility with upstream
5. **Document changes**: Keep clear documentation of any customizations or local modifications

**Operational Guidelines**:
1. **Consistent Environment**: Use the same AI Dev Tasks setup across all development environments
2. **Version Control**: Track workflow versions and updates in your project documentation
3. **Team Training**: Ensure all team members understand the AI Dev Tasks workflow
4. **Quality Assurance**: Implement automated testing for workflow integration
5. **Continuous Improvement**: Regularly evaluate and improve integration patterns

#### 7.1.11 Related Sections
- Section 7.2: Feature Branch Management for coordinating workflow changes
- Section 7.3: Task List Management for integrating with task tracking
- Section 9.4: Workflow Synchronization for coordinating across droids
- Section 5.4: API Design Patterns for workflow automation

#### 7.1.12 Droid Delegation Notes
- **Recommended Droid**: manager-orchestrator-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 3-4 hours for comprehensive integration setup
- **Prerequisites**: Understanding of GitHub workflows, shell scripting, and development environment configuration

### 7.2 Feature Branch Management

#### 7.2.1 Branching Strategy Overview

**Context**: Establish comprehensive branching strategies for Factory.ai droids to ensure systematic feature development, code quality, and seamless integration with the AI Dev Tasks workflow.

**Key Concepts**:
- **Feature Branch Workflow**: Isolated development for each feature or task
- **PRD-per-Branch**: Each PRD corresponds to a dedicated feature branch
- **Quality Gates**: Automated checks before branch merging
- **Continuous Integration**: Regular integration testing and validation
- **Branch Protection**: Prevents direct pushes to main branches

#### 7.2.2 Branch Types and Conventions

**Branch Type Hierarchy**:
```
┌─────────────────┐
│     main        │  ← Production-ready code
└─────────────────┘
       │
┌─────────────────┐
│   develop      │  ← Integration branch for completed features
└─────────────────┘
       │
┌─────────────────┐
│  feature/*     │  ← Feature development branches
│  hotfix/*      │  ← Critical bug fixes
│  release/*     │  ← Release preparation
│  refactor/*    │  ← Code refactoring
└─────────────────┘
```

**Branch Naming Conventions**:
```bash
# Feature branches (most common)
feature/user-authentication-system
feature/dashboard-analytics
feature/payment-integration-v2
feature/ui-component-library

# Hotfix branches (critical fixes)
hotfix/security-vulnerability-cve-2025-1234
hotfix/database-connection-pool
hotfix/api-rate-limiting

# Release branches
release/v1.2.0
release/v1.3.0-beta

# Refactor branches
refactor/user-service-architecture
refactor/database-schema-optimization

# Documentation branches
docs/api-documentation-update
docs/developer-onboarding-guide
```

**Branch Naming Pattern Rules**:
- **Lowercase**: All branch names use lowercase
- **Hyphen-separated**: Use hyphens instead of underscores or spaces
- **Descriptive**: Include enough context to understand the purpose
- **Version Numbers**: Include version when applicable (v1.2.0, v2.1.1)
- **Issue Numbers**: Reference related issues when applicable (fix-123, feature-456)
- **JIRA/Ticket Numbers**: Include ticket numbers from project management

#### 7.2.3 Feature Branch Lifecycle

**Complete Feature Branch Workflow**:
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Create    │───▶│   Develop   │───▶│   Test      │───▶│  Review     │───▶│   Merge     │
│   Branch    │    │   Feature   │    │   Feature   │    │   Pull      │    │   to Main   │
│             │    │             │    │   Branch    │    │   Request   │    │   Branch    │
│ • Create    │    │ • Implement │    │ • Unit     │    │ • Code      │    │ • Merge     │
│   from main │    │   changes   │    │ • Tests     │    │   Review    │    │   Pull      │
│ • Setup     │    │ • AI Dev    │    │ • Integration│    │ • Automated │    │   Request   │
│   PRD      │    │   Tasks     │    │ • Tests     │    │   Checks    │    │ • Delete    │
│ • Configure │    │ • Commit    │    │ • E2E Tests  │    │ • Manual    │    │   Branch    │
│             │    │ • Progress  │    │ • Validate  │    │ • Review    │    │             │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**Detailed Implementation Steps**:

**1. Branch Creation**:
```bash
# === Section 7.2: Feature Branch Creation ===
# Context: Standard procedure for creating feature branches
# Prerequisites: Git setup and main branch up to date

# Ensure main branch is up to date
git checkout main
git pull origin main

# Create and switch to new feature branch
git checkout -b feature/user-authentication-system

# Verify branch creation
git branch
git status

# Output should show:
# * feature/user-authentication-system
#   main
```

**2. PRD Setup and Configuration**:
```bash
# Create PRD directory structure
mkdir -p prd/user-authentication-system
cd prd/user-authentication-system

# Download and setup AI Dev Tasks workflow
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md -o create-prd.md
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md -o generate-tasks.md
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md -o process-task-list.md

# Execute PRD creation workflow
bash create-prd.md "User Authentication System with OAuth2 support"

# Generate task list from PRD
bash generate-tasks.md prd/user-authentication-system.md

# Initialize task tracking
bash process-task-list.md tasks/user-authentication-system.md
```

**3. Development Workflow**:
```bash
# === Section 7.2: Development Workflow ===
# Context: Standard development process for feature branches

# Initial commit with PRD and task setup
git add prd/ tasks/
git commit -m "feat: Initialize user authentication system

- Create PRD with comprehensive requirements
- Generate initial task list from PRD
- Setup task tracking and progress monitoring

Related: AI-DEV-TASKS-001

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>"

# Development commits (example pattern)
git add src/components/auth/
git commit -m "feat: implement OAuth2 authentication component

- Add OAuth2 provider integration
- Implement token management
- Add user session handling

Progress: 3/12 tasks completed
Testing: Unit tests passing, integration tests pending

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>"

# Progress tracking commits
git commit -m "feat: update task progress - 5/12 tasks completed

- Complete user service integration
- Add database schema for users
- Implement password reset functionality

Remaining tasks: 7
Next: API endpoint implementation

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>"
```

#### 7.2.4 Branch Protection and Quality Gates

**Git Branch Protection Configuration**:
```yaml
# .github/branch-protection.yml
# === Section 7.2: Branch Protection Rules ===
# Context: GitHub branch protection for main and develop branches

# Main branch protection
main:
  # Required status checks
  required_status_checks:
    strict: true
    contexts:
      - "build-and-test"
      - "security-scan"
      - "code-quality"
      - "ai-dev-tasks-validation"
  
  # Require pull request reviews
  required_pull_request_reviews:
    required_approving_review_count: 2
    dismiss_stale_reviews: true
    require_code_owner_reviews: false
    
  # Restrict force pushes
  enforce_admins: true
  force_push_restrictions:
    enabled: true
    
  # Require up-to-date branches
  required_up_to_date_branches:
    strict: true
    
  # Require conversation resolution
  required_conversation_resolution: true

# Develop branch protection
develop:
  required_status_checks:
    strict: false
    contexts:
      - "build-and-test"
      - "security-scan"
      
  required_pull_request_reviews:
    required_approving_review_count: 1
    
  enforce_admins: false
  force_push_restrictions:
    enabled: false
```

**Automated Quality Gates**:
```typescript
// === Section 7.2: Automated Quality Gates ===
// Context: GitHub Actions workflow for branch protection
// Prerequisites: GitHub Actions and repository setup

// .github/workflows/quality-gates.yml
name: Quality Gates

on:
  pull_request:
    branches: [main, develop]
    types: [opened, synchronize, reopened]

jobs:
  quality-checks:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Run linting
        run: npm run lint
        
      - name: Run type checking
        run: npm run type-check
        
      - name: Run unit tests
        run: npm run test:unit
        
      - name: Run integration tests
        run: npm run test:integration
        
      - name: Run security scan
        run: npm audit --audit-level high
        
      - name: Check AI Dev Tasks integration
        run: |
          # Validate AI Dev Tasks workflow files exist
          if [ ! -f "ai-dev-tasks/config.json" ]; then
            echo "ERROR: AI Dev Tasks not configured"
            exit 1
          fi
          
          # Validate task completion
          node scripts/validate-tasks.js
          
      - name: Check code coverage
        run: npm run test:coverage
        
      - name: Build application
        run: npm run build
        
      - name: Run E2E tests
        run: npm run test:e2e
```

#### 7.2.5 Integration with AI Dev Tasks Workflow

**Branch-AI Dev Tasks Integration Pattern**:
```bash
# === Section 7.2: AI Dev Tasks Integration ===
# Context: How feature branches integrate with AI Dev Tasks workflow
# Prerequisites: AI Dev Tasks setup and branch creation

# Script: setup-feature-branch.sh
#!/bin/bash
FEATURE_NAME="$1"
BRANCH_NAME="feature/$FEATURE_NAME"

echo "Setting up feature branch: $BRANCH_NAME"

# Create feature branch
git checkout -b "$BRANCH_NAME"

# Create directory structure
mkdir -p "prd/$FEATURE_NAME"
mkdir -p "tasks/$FEATURE_NAME"

# Download AI Dev Tasks workflow files
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/create-prd.md -o "prd/$FEATURE_NAME/create-prd.md"
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/generate-tasks.md -o "prd/$FEATURE_NAME/generate-tasks.md"
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/process-task-list.md -o "prd/$FEATURE_NAME/process-task-list.md"

# Create feature-specific configuration
cat > "prd/$FEATURE_NAME/config.json" << EOF
{
  "featureName": "$FEATURE_NAME",
  "branchName": "$BRANCH_NAME",
  "createdAt": "$(date -Iseconds)",
  "aiDevTasks": {
    "prdFile": "prd/$FEATURE_NAME/prd.md",
    "tasksFile": "tasks/$FEATURE_NAME/tasks.md",
    "progressFile": "tasks/$FEATURE_NAME/progress.md"
  },
  "qualityGates": {
    "unitTests": true,
    "integrationTests": true,
    "codeCoverage": 80,
    "securityScan": true
  }
}
EOF

# Initialize PRD
cd "prd/$FEATURE_NAME"
bash create-prd.md "$FEATURE_NAME"

echo "Feature branch $BRANCH_NAME initialized with AI Dev Tasks workflow"
echo "Next steps:"
echo "1. Review generated PRD: prd/$FEATURE_NAME/prd.md"
echo "2. Generate tasks: bash generate-tasks.md prd/$FEATURE_NAME/prd.md"
echo "3. Start task tracking: bash process-task-list.md tasks/$FEATURE_NAME/tasks.md"
```

**Task Progress Tracking in Commits**:
```bash
# === Section 7.2: Task Progress Tracking ===
# Context: Track AI Dev Tasks progress in git commits

# Script: update-progress.sh
#!/bin/bash
FEATURE_NAME="$1"
COMPLETED_TASKS="$2"
TOTAL_TASKS="$3"
PROGRESS_FILE="tasks/$FEATURE_NAME/progress.md"

# Update progress file
cat > "$PROGRESS_FILE" << EOF
# AI Dev Tasks Progress: $FEATURE_NAME
# Generated: $(date)

## Progress Overview
- **Completed Tasks**: $COMPLETED_TASKS/$TOTAL_TASKS
- **Progress Percentage**: $(echo "scale=2; $COMPLETED_TASKS * 100 / $TOTAL_TASKS" | bc)%
- **Last Updated**: $(date)

## Task Status
EOF

# Get current task status from process-task-list.md
bash "prd/$FEATURE_NAME/process-task-list.md" >> "$PROGRESS_FILE"

echo "Progress updated: $COMPLETED_TASKS/$TOTAL_TASKS tasks completed"

# Commit progress update
git add "$PROGRESS_FILE"
git commit -m "feat: update task progress - $COMPLETED_TASKS/$TOTAL_TASKS tasks completed

Progress: $(echo "scale=2; $COMPLETED_TASKS * 100 / $TOTAL_TASKS" | bc)%
Updated: $(date)

Remaining tasks: $((TOTAL_TASKS - COMPLETED_TASKS))

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>"
```

#### 7.2.6 Conflict Resolution Strategies

**Common Conflict Scenarios and Solutions**:

**Scenario 1: Main Branch Drift**
```bash
# === Section 7.2: Main Branch Drift Resolution ===
# Context: Resolve conflicts when main branch has advanced

# Rebase feature branch onto latest main
git checkout feature/user-authentication-system
git fetch origin main
git rebase origin/main

# If conflicts occur:
git status
# Shows conflicting files

# Resolve conflicts manually
# Edit conflicting files, remove conflict markers
# git add resolved files
git rebase --continue

# If rebase is complex, use merge instead
git merge origin/main --no-ff
```

**Scenario 2: Feature Branch Conflicts**
```bash
# === Section 7.2: Feature Branch Conflicts ===
# Context: Resolve conflicts between feature branches

# Identify conflicting branches
git branch --merged main
git log --oneline --graph main..feature/user-authentication-system

# Merge main into feature branch
git checkout feature/user-authentication-system
git merge main --no-ff

# Resolve conflicts and commit
git add .
git commit -m "feat: merge main into feature/user-authentication-system

# Continue development
```

**Conflict Resolution Best Practices**:
```typescript
// === Section 7.2: Conflict Resolution Best Practices ===
// Context: Guidelines for handling merge conflicts

// 1. Communication
// - Notify team members about conflicts
// - Discuss complex conflicts before resolution
// - Document resolution decisions

// 2. Technical Approach
// - Use rebase for linear history (feature -> main)
// - Use merge for complex integrations
// - Preserve original intent when resolving

// 3. Quality Assurance
// - Run full test suite after resolution
// - Verify both branches still function correctly
// - Update documentation if interfaces changed

// 4. Automation
// - Use automated conflict detection
// - Implement pre-merge validation
// - Set up automated testing after conflict resolution
```

#### 7.2.7 Branch Cleanup and Maintenance

**Branch Cleanup Workflow**:
```bash
# === Section 7.2: Branch Cleanup ===
# Context: Clean up branches after feature completion

# After successful merge to main
git checkout main
git pull origin main

# Delete local feature branch
git branch -d feature/user-authentication-system

# Delete remote feature branch
git push origin --delete feature/user-authentication-system

# Update local branch list
git remote prune origin
git fetch --prune
```

**Branch Maintenance Script**:
```bash
#!/bin/bash
# cleanup-branches.sh

echo "Cleaning up merged branches..."

# Get list of merged branches (excluding main and develop)
MERGED_BRANCHES=$(git branch --merged | grep -v "main" | grep -v "develop" | sed 's/^[* ]*//')

# Delete local merged branches
for branch in $MERGED_BRANCHES; do
    echo "Deleting local branch: $branch"
    git branch -d "$branch"
done

# Get list of remote branches that no longer exist locally
STALE_REMOTE_BRANCHES=$(git remote show origin | grep "gone (no branch)" | cut -d: -f3 | cut -d: -f1)

# Delete stale remote tracking branches
for branch in $STALE_REMOTE_BRANCHES; do
    echo "Deleting stale remote tracking: $branch"
    git branch -r -d "origin/$branch"
done

echo "Branch cleanup completed"
```

#### 7.2.8 Branch Validation and Monitoring

**Branch Health Monitoring**:
```typescript
// === Section 7.2: Branch Health Monitoring ===
// Context: Monitor branch health and development progress

interface BranchHealth {
  name: string;
  type: 'feature' | 'hotfix' | 'release' | 'refactor';
  age: number; // days since creation
  commits: number;
  lastActivity: Date;
  conflicts: number;
  testsPassing: boolean;
  coverage: number;
  prStatus: 'open' | 'merged' | 'closed' | 'none';
  aiDevTasks: {
    prdExists: boolean;
    tasksGenerated: boolean;
    progress: number; // percentage
  };
}

export class BranchMonitor {
  async analyzeBranch(branchName: string): Promise<BranchHealth> {
    // Get branch information
    const branchInfo = await this.getBranchInfo(branchName);
    
    // Check AI Dev Tasks integration
    const aiDevTasksStatus = await this.checkAIDevTasks(branchName);
    
    // Check test status
    const testStatus = await this.checkTestStatus(branchName);
    
    // Check for open PRs
    const prStatus = await this.checkPRStatus(branchName);
    
    return {
      name: branchName,
      type: this.determineBranchType(branchName),
      age: this.calculateBranchAge(branchInfo.creationDate),
      commits: branchInfo.commitCount,
      lastActivity: branchInfo.lastActivity,
      conflicts: await this.checkConflicts(branchName),
      testsPassing: testStatus.allPassing,
      coverage: testStatus.coverage,
      prStatus: prStatus.status,
      aiDevTasks: aiDevTasksStatus
    };
  }
  
  async checkAIDevTasks(branchName: string): Promise<BranchHealth['aiDevTasks']> {
    const featureName = this.extractFeatureName(branchName);
    
    return {
      prdExists: await this.fileExists(`prd/${featureName}/prd.md`),
      tasksGenerated: await this.fileExists(`tasks/${featureName}/tasks.md`),
      progress: await this.calculateProgress(featureName)
    };
  }
  
  private extractFeatureName(branchName: string): string {
    return branchName.replace(/^feature\//, '').replace(/[-_]/g, ' ');
  }
}
```

#### 7.2.9 Integration Checklist

**Before creating a feature branch, verify**:
- [ ] **Main Branch Status**: Main branch is up to date and stable
- [ ] **AI Dev Tasks Setup**: AI Dev Tasks workflow files are available
- [ ] **Development Environment**: Local development environment is properly configured
- [ ] **Branch Naming**: Follow established naming conventions
- [ ] **PRD Preparation**: Have a clear understanding of feature requirements
- [ ] **Team Coordination**: Notify team members of new feature branch

**During development, verify**:
- [ ] **Regular Commits**: Commit frequently with descriptive messages
- [ ] **Task Progress**: Update AI Dev Tasks progress regularly
- [ ] **Code Quality**: Follow coding standards and best practices
- [ ] **Testing**: Write and run tests for all changes
- [ ] **Documentation**: Update relevant documentation
- [ ] **Branch Health**: Monitor branch for conflicts or issues

**Before merging, verify**:
- [ ] **Task Completion**: All AI Dev Tasks are marked as completed
- [ ] **Test Coverage**: Achieve required code coverage (typically 80%+)
- [ ] **Code Review**: Peer review completed and approved
- [ ] **Quality Gates**: All automated checks pass
- [ ] **Integration Testing**: Tests pass in integration environment
- [ ] **Documentation**: Documentation is up to date
- [ ] **Conflict Resolution**: No merge conflicts remain

#### 7.2.10 Common Issues and Solutions

**Issue 1: Branch Naming Conflicts**
```bash
# Problem: Branch name already exists
git checkout -b feature/user-authentication
# Error: fatal: A branch named 'feature/user-authentication' already exists.

# Solution: Use more specific naming
git checkout -b feature/user-authentication-oauth2-upgrade
# or
git checkout -b feature/auth-system-user-oauth2
```

**Issue 2: Detached HEAD State**
```bash
# Problem: Detached HEAD after rebase
git rebase origin/main
# Error: Current branch feature/user-authentication is behind

# Solution: Reset to branch
git checkout feature/user-authentication
git reset --hard origin/feature/user-authentication
```

**Issue 3: Lost Commits**
```bash
# Problem: Commits lost during rebase or merge
git log --oneline
# Missing recent commits

# Solution: Use reflog to recover
git reflog
git reset --hard HEAD@{1}  # Go back one commit
# or
git reset --hard ORIG_HEAD
```

#### 7.2.11 Related Sections
- Section 7.1: AI Dev Tasks Integration for workflow coordination
- Section 7.3: Task List Management for PRD-per-branch approach
- Section 9.4: Workflow Synchronization for droid coordination
- Section 5.3: Error handling for branch operations

#### 7.2.12 Droid Delegation Notes
- **Recommended Droid**: manager-orchestrator-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 2-3 hours for comprehensive branching strategy
- **Prerequisites**: Understanding of Git workflows, AI Dev Tasks integration, and development coordination

### 7.3 Task List Management

#### 7.3.1 PRD-per-Branch Approach Overview

**Context**: Establish comprehensive task list management patterns that align with the PRD-per-branch methodology, ensuring Factory.ai droids can systematically track progress and maintain visibility across feature development.

**Key Concepts**:
- **One PRD, One Branch**: Each PRD corresponds to a dedicated feature branch
- **Task-Driven Development**: All work is tracked through structured task lists
- **Progress Monitoring**: Real-time progress tracking with automated updates
- **Task Completion Validation**: Automated validation of task completion
- **Historical Tracking**: Complete audit trail of task work and decisions

#### 7.3.2 Task List Structure and Organization

**Task List Hierarchy**:
```
PRD/user-authentication-system/
├── tasks.md              # Master task list
├── progress.md           # Progress tracking
├── completed.md         # Completed tasks archive
├── blocked.md           # Currently blocked tasks
├── deferred.md          # Deferred tasks
└── subtasks/           # Subtask breakdown
    ├── ui-components/
    ├── backend-services/
    └── integration/
├── reviews/             # Review documentation
├── decisions/             # Architecture Decision Records
└── resources/             # Links and references
```

**Task Status Categories**:
```typescript
// === Section 7.3: Task Status Categories ===
// Context: Standard task status classifications for droid task management
// Prerequisites: Understanding of task management and progress tracking

export enum TaskStatus {
  NOT_STARTED = 'not-started',
  IN_PROGRESS = 'in-progress',
  IN_REVIEW = 'in-review',
  BLOCKED = 'blocked',
  DEFERRED = 'deferred',
  COMPLETED = 'completed',
  CANCELLED = 'cancelled',
  ON_HOLD = 'on-hold',
  TESTING = 'testing',
  DOCUMENTATION = 'documentation'
}

export interface Task {
  id: string;
  title: string;
  description: string;
  status: TaskStatus;
  priority: 'low' | 'medium' | 'high' | 'critical';
  assignee?: string;
  estimatedHours?: number;
  actualHours?: number;
  dependencies: string[];
  labels: string[];
  createdAt: Date;
  updatedAt: Date;
  completedAt?: Date;
  parentTask?: string;
  subtasks: string[];
  evidence: TaskEvidence[];
}
```

**Task Priority Classification**:
```typescript
// Task priority assignment matrix
export const TASK_PRIORITY_MATRIX = {
  CRITICAL: {
    score: 100,
    color: 'red',
    responseTime: 'immediate'
  },
  HIGH: {
    score: 75,
    color: 'orange',
    responseTime: '1-2 hours'
  },
  MEDIUM: {
    score: 50,
    color: 'yellow',
    responseTime: '1 day'
  },
  LOW: {
    score: 25,
    color: 'green',
    responseTime: '2-3 days'
  }
};

// Priority decision matrix
const PRIORITY_FACTORS = {
  CRITICAL: ['security', 'production-down', 'client-blocking'],
  HIGH: ['user-facing', 'core-feature', 'deadline-driven'],
  MEDIUM: ['enhancement', 'optimization', 'documentation'],
  LOW: ['bug-fix', 'refactoring', 'cleanup']
};
```

#### 7.3.3 Task Generation from PRD

**AI Dev Tasks Task Generation Workflow**:
```bash
# === Section 7.3: Task Generation from PRD ===
# Context: Generate comprehensive task lists from PRDs using AI Dev Tasks
# Prerequisites: PRD creation completed and AI Dev Tasks setup

# Execute task generation workflow
cd prd/user-authentication-system
bash generate-tasks.md prd/user-authentication-system.md

# Output structure
# tasks.md - Main task list
tasks.md - Master task list with all tasks
│   ├── 1.0 Authentication Foundation (Priority: High)
│   │   ├── Design OAuth2 provider integration
│   │   ├── Implement user authentication service
│   │   ├── Create session management system
│   │   └── Add password reset functionality
│   ├── 2.0 User Interface (Priority: High)
│   │   ├── Create login form component
│   │   Design dashboard user profile section
│   │   Implement user settings page
│   │   └── Add user navigation integration
│   ├── 3.0 Database Integration (Priority: High)
│   │   ├── Design user database schema
│   │   Create user repository layer
│   ├── Implement user service API endpoints
│   └── Add database migration scripts
│   ├── 4.0 Security Implementation (Priority: Critical)
│   │   ├── Implement password hashing
│   ├── Add session encryption
│   ├── Create authorization middleware
│   └── Add rate limiting
│   └── 5.0 Testing & Documentation (Priority: Medium)
│       ├── Write unit tests for all components
│       ├── Create integration test suite
│       ├── Write API documentation
│       └── Update user guide
│   └── 6.0 Deployment (Priority: High)
│       ├── Create deployment scripts
│       └── Set up CI/CD pipeline
│       └── Configure production monitoring
```

**Generated Task File Structure**:
```markdown
# tasks.md
# User Authentication System - Task List
# Generated: 2025-06-17T12:00:00Z
# PRD: prd/user-authentication-system/prd.md

## Task Overview
- **Total Tasks**: 24
- **Estimated Timeline**: 3-4 weeks
- **Team Size**: 2-3 droids

## Phase 1: Foundation (Week 1)
### 1.1 Authentication Foundation (Priority: High) [ASSIGNED: droid-auth-expert]
- **Description**: Design and implement OAuth2 provider integration
- **Estimated Hours**: 40
- **Dependencies**: None
- **Acceptance Criteria**: All authentication providers work, tests pass

### 1.2 User Service (Priority: High) [ASSIGNED: droid-backend-expert]
- **Description**: Create user authentication service and token management
- **Estimated Hours**: 32
- **Dependencies**: Task 1.1
- **Acceptance Criteria**: Service integrates with OAuth2, token management works

### 1.3 Session Management (Priority: High) [ASSIGNED: droid-security-expert]
- **Description**: Implement secure session management system
- **Estimated Hours**: 24
- **Dependencies**: Task 1.1, Task 1.2
- **Acceptance Criteria**: Sessions created/destroyed correctly, security tests pass

### 1.4 Password Reset (Priority: Medium) [ASSIGNED: droid-backend-expert]
- **Description: Implement secure password reset functionality
- **Estimated Hours**: 16
- **Dependencies**: Task 1.3
- **Acceptance Criteria**: Password reset emails sent and processed

## Phase 2: User Interface (Week 2)
### 2.1 Login Form Component (Priority: High) [ASSIGNED: droid-frontend-expert]
- **Description**: Create responsive login form with validation
- **Estimated Hours**: 24
- **Dependencies**: Task 1.1, Task 1.2
- **Acceptance Criteria**: Form validates input, integrates with auth service

### 2.2 User Dashboard (Priority: High) [ASSIGNED: droid-frontend-expert]
- **Display name**: User Dashboard
- **Description**: Design dashboard with user profile section
- **Estimated Hours**: 32
- **Dependencies**: Task 2.1
- **Acceptance Criteria**: Dashboard displays user data, responsive design

### 2.3 Settings Page (Priority: Medium) [ASSIGNED: droid-frontend-expert]
- **Description**: Create user settings and preferences page
- **Estimated Hours**: 20
- **Dependencies**: Task 2.1
- **Acceptance Criteria**: Settings save/load correctly, integration works

### 2.4 User Navigation (Priority: Medium) [ASSIGNED: droid-frontend-expert]
- **Description**: Integrate user navigation into main layout
- **Estimated Hours**: 16
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3
- **Acceptance Criteria: Navigation works across all pages

## Phase 3: Backend Integration (Week 2-3)
### 3.1 Database Schema (Priority: High) [ASSIGNED: droid-database-expert]
- **Description**: Design user database schema with proper relationships
- **Estimated Hours**: 24
- **Dependencies**: PRD analysis
- **Acceptance**: Schema supports all user scenarios, migrations included

### 3.2 Repository Layer (Priority: High) [ASSIGNED: droid-backend-expert]
- **Description**: Create user repository layer with TypeScript types
- **Estimated Hours**: 20
- **Dependencies**: Task 3.1
- **Acceptance**: Repository layer integrates with schema, types defined

### 3.3 API Endpoints (Priority: High) [ASSIGNED: droid-api-expert]
- **Description**: Create user API endpoints for authentication and user data
- **Estimated Hours**: 32
- **Dependencies**: Task 3.1, Task 3.2
- **Acceptance**: All endpoints work with authentication, proper error handling

### 3.4 Migration Scripts (Priority: Medium) [ASSIGNED: droid-database-expert]
- **Description: Create database migration scripts
- **Estimated Hours**: 16
- **Dependencies**: Task 3.1
- **Acceptance**: Migration scripts tested, rollback procedures defined

## Phase 4: Security (Week 3)
### 4.1 Password Security (Priority: Critical) [ASSIGNED: droid-security-expert]
- **Description**: Implement secure password hashing and policies
- **Estimated Hours**: 20
- **Dependencies**: Task 3.1
- **Acceptance**: Passwords properly hashed, policies enforced

### 4.2 Session Security (Priority: Critical) [ASSIGNED: droid-security-expert]
- **Description**: Implement secure session management and token handling
- **Estimated Hours**: 16
- **Dependencies**: Task 4.1
- **Acceptance**: Sessions properly secured, tokens properly managed

### 4.3 Authorization (Priority: Critical) [ASSIGNED: droid-security-expert]
- **Description**: Implement role-based access control
- **Estimated Hours**: 24
- **Dependencies**: Task 4.1, Task 4.2
- **Acceptance**: Authorization works, roles properly enforced

### 4.4 Rate Limiting (Priority: High) [ASSIGNED: droid-api-expert]
- **Description**: Implement API rate limiting for security
- **Estimated Hours**: 12
- **Dependencies**: Task 4.3
- **Acceptance**: Rate limiting works, thresholds appropriate

## Phase 5: Testing & Documentation (Week 4)
### 5.1 Unit Tests (Priority: High) [ASSIGNED: droid-testing-expert]
- **Description**: Write comprehensive unit tests for all components
- **Estimated Hours**: 40
- **Dependencies**: All development tasks
- **Acceptance**: 95% code coverage, all tests pass

### 5.2 Integration Tests (Priority: High) [ASSIGNED: droid-testing-expert]
- **Description: Create integration test suite for user workflows
- **Estimated Hours**: 32
- **Dependencies**: All development tasks
- **Acceptance**: All integration tests pass

### 5.3 E2E Tests (Priority: High) [droid-testing-expert]
- **Description: Create end-to-end test scenarios
- **Estimated Hours**: 24
- **Dependencies**: All development tasks
- **Acceptance**: All E2E tests pass

### 5.4 Documentation (Priority: Medium) [ASSIGNED: droid-docs-expert]
- **Description**: Create comprehensive documentation
- **Estimated Hours**: 24
- **Dependencies**: All development tasks
- **Acceptance**: Documentation complete and up to date

## Task Dependencies
- **Sequential Dependencies**: Each phase builds on the previous
- **Parallel Opportunities**: Within phases where safe and efficient
- **Cross-Functional Integration**: Integration testing between phases

## Risk Assessment
- **Technical Complexity**: High (OAuth2, multiple integrations)
- **Timeline Risk**: Medium (3-4 weeks, buffer time included)
- **Resource Requirements**: 2-3 droids per phase
- **Security Considerations**: Critical (authentication, session management)
- **Integration Complexity**: Medium (AI Dev Tasks + GitHub + Git workflows)
```

#### 7.3.4 Task Progress Tracking and Updates

**Progress Tracking System**:
```typescript
// === Section 7.3: Task Progress Tracking ===
// Context: Comprehensive progress tracking for AI Dev Tasks task management
// Prerequisites: Node.js, AI Dev Tasks setup, branch creation

export interface TaskProgress {
  taskId: string;
  status: TaskStatus;
  title: string;
  assignee?: string;
  startedAt?: Date;
  completedAt?: Date;
  estimatedHours: number;
  actualHours?: number;
  progressPercentage: number;
  blockers: string[];
  evidence: TaskEvidence[];
  lastUpdate: Date;
}

export interface TaskEvidence {
  type: 'screenshot' | 'log' | 'test-result' | 'code-review';
  content: string;
  timestamp: Date;
  url?: string;
  filePath?: string;
  testResults?: TestResults;
}

export class TaskTracker {
  private branchName: string;
  private featureName: string;
  private tasks: Map<string, Task> = new Map();
  private progressFile: string;

  constructor(branchName: string) {
    this.branchName = branchName;
    this.featureName = this.extractFeatureName(branchName);
    this.progressFile = `tasks/${this.featureName}/progress.md`;
  }

  async initializeTask(taskData: Task): Promise<void> {
    this.tasks.set(task.id, task);
    await this.updateProgress();
    await this.commitProgressUpdate(task.id);
  }

  async updateTaskStatus(taskId: string, status: TaskStatus, evidence?: TaskEvidence[]): Promise<void> {
    const task = this.tasks.get(taskId);
    if (!task) {
      throw new Error(`Task ${taskId} not found`);
    }

    const oldStatus = task.status;
    task.status = status;
    task.updatedAt = new Date();
    
    if (evidence && evidence.length > 0) {
      task.evidence.push(...evidence);
    }

    if (oldStatus !== status) {
      task.statusChangedAt = new Date();
    }

    await this.updateProgress();
    await this.commitProgressUpdate(taskId);
  }

  async addTaskEvidence(taskId: string, evidence: TaskEvidence): Promise<void> {
    const task = this.tasks.get(taskId);
    if (!task) {
      throw new Error(`Task ${taskId} not found`);
    }
    
    task.evidence.push(evidence);
    task.updatedAt = new Date();
    await this.commitProgressUpdate(taskId);
  }

  private async updateProgress(): Promise<void> {
    const allTasks = Array.from(this.tasks.values());
    const completedTasks = allTasks.filter(task => 
      task.status === 'completed'
    );
    
    const totalTasks = allTasks.length;
    const progressPercentage = totalTasks > 0 ? 
      Math.round((completedTasks.length / totalTasks) * 100) : 0;
    
    // Update progress file
    await this.writeProgressFile(allTasks, progressPercentage);
  }

  private async writeProgressFile(tasks: Task[], progressPercentage: number): Promise<void> {
    const content = this.generateProgressReport(tasks, progressPercentage);
    await this.writeFile(this.progressFile, content);
  }

  private generateProgressReport(tasks: Task[], progressPercentage: number): string {
    const now = new Date();
    return `# Task Progress Report: ${this.featureName}
# Generated: ${now.toISOString()}
# Progress: ${progressPercentage}%

## Current Status
### Overview
- **Total Tasks**: ${tasks.length}
- **Completed**: ${tasks.filter(t => t.status === 'completed').length}
- **In Progress**: ${tasks.filter(t => t.status === 'in-progress').length}
- **Blocked**: ${tasks.filter(t => t.status === 'blocked').length}

### Task Status Summary
${tasks.map(task => 
  `- **${task.id}:** ${task.title} (${task.status})`
).join('\n')}

### Progress by Priority
${this.getProgressByPriority()}

### Recent Activity
${tasks
  .sort((a, b) => b.updatedAt.getTime() - a.updatedAt.getTime())
  .slice(-5)
  .map(task => 
    `• ${task.id}: ${task.title} - ${task.status} (${task.updatedAt.toISOString()})`
  ).join('\n')}

### Blocked Tasks
${tasks
  .filter(task => task.status === 'blocked')
  .map(task => 
    `• **${task.id}:** ${task.title} - ${task.blockers?.join(', ')}`
  ).join('\n')}

### Next Steps
${this.getNextSteps()}
  `;
  }

  private extractFeatureName(branchName: string): string {
    return branchName.replace(/^feature\//, '').replace(/[-_]/g, ' ');
  }

  private getProgressByPriority(): string {
    const priorityOrder = ['critical', 'high', 'medium', 'low'];
    return priorityOrder.map(priority => {
      const tasks = Array.from(this.tasks.values()).filter(task => 
        task.priority === priority
      );
      const completed = tasks.filter(task => task.status === 'completed');
      return `${priority.toUpperCase()}: ${completed.length}/${tasks.length} tasks`;
    }).join('\n');
  }

  private getNextSteps(): string {
    const nextTasks = Array.from(this.tasks.values())
      .filter(task => 
        task.status === 'not-started' || 
        task.status === 'in-progress'
      )
      .sort((a, b) => {
        // Sort by priority first, then by dependencies
        const aPriority = this.getTaskPriority(a.priority);
        const bPriority = this.getTaskPriority(b.priority);
        if (aPriority !== bPriority) {
          return aPriority > bPriority ? -1 : 1;
        }
        
        const aHasUnresolvedDeps = task.dependencies.some(dep => 
          this.tasks.get(dep)?.status !== 'completed'
        );
        const bHasUnresolvedDeps = task.dependencies.some(dep => 
          this.tasks.get(dep)?.status !== 'completed'
        );
        
        if (aHasUnresolvedDeps !== bHasUnresolvedDeps) {
          return aHasUnresolvedDeps ? -1 : 1;
        }
        
        return 0;
      });
      
      return nextTasks.slice(0, 5).map(task => 
        `• **${task.id}:** ${task.title}`
      ).join('\n');
  }

  private getTaskPriority(priority: 'low' | 'medium' | 'high' | 'critical'): number {
    const priorityMap = {
      'critical': 100,
      'high': 75,
      'medium': 50,
      'low': 25
    };
    return priorityMap[priority] || 0;
  }

  private async commitProgressUpdate(taskId: string): Promise<void> {
    const task = this.tasks.get(taskId);
    if (!task) return;

    const commitMessage = this.generateCommitMessage(task);
    const commitHash = await this.executeGitCommand(
      `git add "tasks/${this.featureName}/progress.md" && git commit -m "${commitMessage}"`,
      { captureOutput: true }
    );
    
    console.log(`Progress updated and committed: ${task.id}`);
  }

  private generateCommitMessage(task: Task): string {
    const statusEmoji = this.getStatusEmoji(task.status);
    const priority = task.priority?.toUpperCase() || 'MEDIUM';
    const completed = task.completedAt ? ` (✓) ${task.completedAt.toISOString()}` : '';
    const hours = task.actualHours ? ` (${task.actualHours}/${task.estimatedHours}h)` : '';
    
    return `${statusEmoji} [${priority}] ${task.id}: ${task.title} ${completed}${hours}`;
  }

  private async executeGitCommand(command: string): Promise<string> {
    const { execSync } = require('child_process');
    return execSync(command, { 
      encoding: 'utf8',
      stdio: 'pipe'
    });
  }

  private async writeFile(filePath: string, content: string): Promise<void> {
    const fs = require('fs').promises;
    await fs.mkdir(require('path').dirname(filePath), { recursive: true });
    await fs.writeFile(filePath, content);
  }
}
```

**Progress Update Script**:
```bash
#!/bin/bash
# === Section 7.3: Progress Update Script ===
# Context: Automated progress updates for AI Dev Tasks workflow
# Prerequisites: Feature branch created with AI Dev Tasks setup

# Script: update-task-progress.sh
#!/bin/bash
FEATURE_NAME="$1"
TASK_ID="$2"
NEW_STATUS="$3"
EVIDENCE_FILE="$4"

# Update task status
cd "prd/$FEATURE_NAME"
node scripts/update-task-status.js "$TASK_ID" "$NEW_STATUS" "$EVIDENCE_FILE"

# Commit progress update
git add "tasks/$FEATURE_NAME/progress.md"
git commit -m "feat: update task $TASK_ID to $NEW_STATUS

Task: $TASK_ID
Status: $NEW_STATUS
Updated: $(date -Iseconds)

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>"
```

**Task Evidence Collection**:
```typescript
// === Section 7.3: Task Evidence Collection ===
// Context: Collect evidence for task completion validation
// Prerequisites: Task progress tracking system

export class EvidenceCollector {
  async collectEvidence(
    taskId: string,
    evidenceType: 'screenshot' | 'log' | 'test-result' | 'code-review'
  ): Promise<TaskEvidence> {
    
    switch (evidenceType) {
      case 'screenshot':
        return this.collectScreenshotEvidence(taskId);
      case 'test-result':
        return this.collectTestEvidence(taskId);
      case 'code-review':
        return this.collectCodeReviewEvidence(taskId);
      case 'log':
        return this.collectLogEvidence(taskId);
      default:
        throw new Error(`Unsupported evidence type: ${evidenceType}`);
    }
  }

  private async collectScreenshotEvidence(taskId: string): Promise<TaskEvidence> {
    const screenshotPath = `tasks/${this.featureName}/evidence/${taskId}.png`;
    await this.takeScreenshot(screenshotPath, taskId);
    
    return {
      type: 'screenshot',
      content: screenshotPath,
      timestamp: new Date(),
      filePath: screenshotPath
    };
  }

  private async collectTestEvidence(taskId: string): Promise<TaskEvidence> {
    const testResultsPath = `tasks/${this.featureName}/test-results/${taskId}.json`;
    const testResults = JSON.parse(await this.readFile(testResultsPath));
    
    return {
      type: 'test-result',
      content: testResults,
      timestamp: new Date(),
      filePath: testResultsPath
    };
  }

  private async collectCodeReviewEvidence(taskId: string): Promise<TaskEvidence> {
    const reviewCommentsPath = `tasks/${this.featureName}/reviews/${taskId}.md`;
    const reviewComments = await this.readFile(reviewCommentsPath);
    
    return {
      type: 'code-review',
      content: reviewComments,
      timestamp: new Date(),
      filePath: reviewCommentsPath
    };
  }

  private async collectLogEvidence(taskId: string): Promise<TaskEvidence> {
    const logFile = `tasks/${this.featureName}/logs/${taskId}.log`;
    const logContent = await this.readFile(logFile);
    
    return {
      type: 'log',
      content: logContent,
      timestamp: new Date(),
      filePath: logFile
    };
  }

  private async takeScreenshot(filePath: string, taskId: string): Promise<void> {
    // Implementation would use Playwright or similar tool
    console.log(`Taking screenshot for task ${taskId} at ${filePath}`);
    // Screenshot implementation would go here
  }

  private async readFile(filePath: string): Promise<string> {
    const fs = require('fs').promises;
    return fs.readFile(filePath, 'utf8');
  }
}
```

#### 7.3.5 Task Completion Validation

**Task Completion Checklist**:
```bash
# === Section 7.3: Task Completion Validation ===
# Context: Automated validation for task completion
# Prerequisites: AI Dev Tasks setup and task execution

# Script: validate-task-completion.sh
#!/bin/bash
TASK_ID="$1"
FEATURE_NAME="$2"

cd "prd/$FEATURE_NAME"

# Validate task exists
if [ ! -f "tasks/$FEATURE_NAME/tasks.md" ]; then
    echo "ERROR: Task file not found: tasks/$FEATURE_NAME/tasks.md"
    exit 1
fi

# Check if task is marked as completed
if ! grep -q "^## ${TASK_ID}" "tasks/$FEATURE_NAME/tasks.md"; then
    echo "WARNING: Task $TASK_ID not marked as completed"
    exit 1
fi

# Validate evidence collection
EVIDENCE_DIR="tasks/$FEATURE_NAME/evidence"
if [ ! -d "$EVIDENCE_DIR" ]; then
    echo "WARNING: No evidence directory found for task $TASK_ID"
    exit 1
fi

# Check test results
TEST_RESULTS_FILE="tasks/$FEATURE_NAME/test-results/$TASK_ID.json"
if [ ! -f "$TEST_RESULTS_FILE" ]; then
    echo "WARNING: No test results found for task $TASK_ID"
    exit 1
fi

# Check code reviews
REVIEW_FILE="tasks/$FEATURE_NAME/reviews/$TASK_ID.md"
if [ ! -f "$REVIEW_FILE" ]; then
    echo "WARNING: No code review found for task $TASK_ID"
    exit 1
fi

echo "✅ Task $TASK_ID validation passed"
```

**Quality Gates Implementation**:
```yaml
# .github/workflows/task-validation.yml
# === Section 7.3: Task Quality Gates ===
# Context: Automated validation for task completion
# Prerequisites: GitHub Actions and repository setup

name: Task Validation

on:
  push:
    branches: [feature/*]
    types: [synchronize]

jobs:
  validate-task-completion:
    runs-on: ubuntu-latest
    
    steps:
      - name: Check task completion status
        run: |
          cd "prd/${{ github.ref_name }}"
          node scripts/validate-task-status.js
          
      - name: Validate evidence collection
        run: |
          cd "prd/${{ github.ref_name }}"
          node scripts/validate-evidence.js
          
      - name: Run task-specific tests
        run: |
          cd "prd/${{ github.ref_name }}"
          npm run test:"${ github.ref_name }"
          
      - name: Validate code coverage
        run: |
          cd "prd/${{ github.ref_name }}"
          npm run test:coverage --coverage
        
      - name: Check documentation
        run: |
          cd "prd/${{ github.ref_name }}"
          node scripts/validate-documentation.js

    outputs:
      - task-validation-report: |
        name: task-validation
        path: task-validation-${{ github.sha }}.md
      - coverage-report: |
        name: coverage-report
        path: coverage-${{ github.sha }}.md
```

**Validation Results Summary**:
```typescript
// === Section 7.3: Validation Results ===
// Context: Summary of validation checks
// Prerequisites: Task validation execution

interface ValidationResult {
  taskId: string;
  overall: 'pass' | 'fail' | 'partial';
  checks: ValidationCheck[];
  evidenceCollected: boolean;
  testsPassed: boolean;
  coverageMet: boolean;
  documentationComplete: boolean;
  reviewApproved: boolean;
}

interface ValidationCheck {
  name: string;
  status: 'pass' | 'fail' | 'warning';
  message: string;
  details?: Record<string, unknown>;
  timestamp: Date;
}
```

#### 7.3.6 Task Delegation Patterns

**Droid Assignment Strategy**:
```typescript
// === Section 7.3: Task Delegation Patterns ===
// Context: Optimal task assignment for Factory.ai droids
// Prerequisites: Task list generation and droid capabilities

export class TaskDelegator {
  private droidCapabilities = new Map([
    ['security-expert', ['security', 'authentication', 'authorization']],
    ['frontend-expert', ['ui', 'components', 'styling']],
    ['backend-expert', ['api', 'database', 'services']],
    ['database-expert', ['schema', 'migrations', 'optimization']],
    ['testing-expert', ['unit', 'integration', 'e2e', 'performance']],
    ['docs-expert', ['documentation', 'api-docs', 'guides']]
  ]);

  assignTasks(tasks: Task[]): TaskAssignment {
    const assignment: Record<string, string[]> = {};
    
    for (const task of tasks) {
      // Get qualified droids for this task
      const qualifiedDroids = this.getQualifiedDroids(task);
      
      if (qualifiedDroids.length === 0) {
        // No qualified droids available
        assignment.unassigned.push(task.id);
        continue;
      }
      
      // Select best droid based on priority and availability
      const selectedDroid = this.selectBestDroid(qualifiedDroids, task);
      
      // Assign to droid
      if (!assignment[selectedDroid]) {
        continue;
      }
      
      if (!assignment[selectedDroid]) {
        assignment.unassigned.push(task.id);
        continue;
      }
      
      assignment[selectedDroid].push(task.id);
      
      // Track assignment
      assignment.taskId = task.id;
      assignment.droidName = selectedDroid;
    }
    
    return assignment;
  }

  private getQualifiedDroids(task: Task): string[] {
    const requiredSkills = this.getRequiredSkills(task);
    const availableDroids = Array.from(this.droidCapabilities.keys());
    
    return availableDroids.filter(droid => 
      requiredSkills.every(skill => 
        droidCapabilities.get(droid)?.includes(skill)
      )
    );
  }

  private selectBestDroid(qualifiedDroids: string[], task: Task): string {
    // Prioritize by droid availability and task priority
    const droidScores = qualifiedDroids.map(droid => ({
      droid,
      score: this.calculateDroidScore(droid, task)
    }));
    
    // Sort by score (descending) and availability
    droidScores.sort((a, b) => b.score - a.score);
    
    return droidScores[0]?.droid;
  }

  private calculateDroidScore(droidName: string, task: Task): number {
    const droid = this.droidCapabilities.get(droidName);
    const taskPriority = task.priority || 'medium';
    
    let score = 0;
    
    // Base score for available droid
    score += 50;
    
    // Priority weighting
    const priorityScore = this.getTaskPriority(taskPriority);
    score += priorityScore;
    
    // Skills matching score
    requiredSkills = this.getRequiredSkills(task);
    const skillsMatch = requiredSkills.filter(skill => 
      droid?.includes(skill)
    ).length / requiredSkills.length;
    score += skillsMatch * 30;
    
    // Availability factor (lower is better)
    const droidWorkload = this.getDroidWorkload(droidName);
    score += (10 - droidWorkload) * 5);
    
    return score;
  }

  private getTaskPriority(priority: string): number {
    const priorityMap = {
      'critical': 100,
      'high': 75,
      'medium': 50,
      'low': 25
    };
    return priorityMap[priority] || 50;
  }

  private getRequiredSkills(task: Task): string[] {
    const skills = [];
    
    // Based on task description and priority
    if (task.title.toLowerCase().includes('security')) {
      skills.push('security', 'authentication', 'authorization');
    }
    
    if (task.title.toLowerCase().includes('oauth2')) {
      skills.push('oauth2', 'authentication', 'api');
    }
    
    if (task.title.toLowerCase().includes('database')) {
      skills.push('database', 'sql', 'schema', 'migration');
    }
    
    if (task.title.toLowerCase().includes('test')) {
      skills.push('testing', 'unit', 'integration', 'e2e');
    }
    
    if (task.title.toLowerCase().includes('ui')) {
      skills.push('frontend', 'components', 'styling', 'accessibility');
    }
    
    if (task.title.toLowerCase().includes('api')) {
      skills.push('api', 'rest', 'typescript', 'validation');
    }
    
    return skills;
  }

  private getDroidWorkload(droidName: string): number {
    // Simulated workload assessment
    const workloadMap: Record<string, number> = {
      'security-expert': 8,
      'frontend-expert': 7,
      'backend-expert': 8,
      'database-expert': 6,
      'testing-expert': 6,
      'docs-expert': 4
    };
    
    return workloadMap[droidName] || 5;
  }
}
```

#### 7.3.7 Task List Template Structure

**PRD Task List Template**:
```markdown
# [Feature Name] - Task List
# Generated: [Date]
# PRD: prd/[feature-name]/prd.md

## Task Overview
- **Total Tasks**: [Total Count]
- **Estimated Timeline**: [Timeline]
- **Priority Overview**: Critical: [Count], High: [Count], Medium: [Count], Low: [Count]

## Progress Summary
- **Completed**: [Completed Count]/[Total Count] tasks completed
- **In Progress**: [In Progress Count]/[Total Count] tasks in progress
- **Blocked**: [Blocked Count]/[Total Count] tasks blocked

## Task Status Breakdown

### High Priority Tasks
[High Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

### Medium Priority Tasks
[Medium Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

### Low Priority Tasks
[Low Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

## Dependencies
### Blockers
- [Blocker Task 1]: [Dependency Chain]
- [Blocker Task 2]: [Dependency Chain]

## Risk Assessment
- **Technical Risks**: [Risk List]
- **Timeline Risks**: [Risk List]
- **Resource Risks**: [Risk List]

## Acceptance Criteria
- [ ] All critical tasks completed successfully
- [ ] All security implementations pass security audits
- [ ] Integration tests pass
- [ ] Code review approved
- [ ] Documentation is complete
- [ ] Stakeholder approval received
- [ ] Deployment ready

## Next Steps
1. [Next Priority Task 1]: [Description]
2. [Next Priority 2]: [Description]
3. [Next Priority 3]: [Description]
```

## Review Notes
- [Review Note 1]: [Details]
- [Review Note 2]: [Details]
- [Review Note 3]: [Details]

## Evidence Archive
### Completed Tasks
[Task 1]: [Evidence]
- **Status**: Completed
- **Timestamp**: [Timestamp]
- **Path**: [File Path]
- **Review**: [Review Status]

### Blocked Tasks
[Task 1]: [Evidence]
- **Status**: Blocked
- **Blocker**: [Dependency]
- **Timestamp**: [Timestamp]
```

#### 7.3.8 Related Sections
- Section 7.1: AI Dev Tasks Integration for workflow coordination
- Section 7.4: Workflow Synchronization for droid coordination
- Section 9.1: Task Delegation Protocols for task assignment patterns
- Section 9.2: Inter-Droid Communication for task coordination
- Section 9.5: Manager Droid Coordination for orchestration

#### 7.3.9 Droid Delegation Notes
- **Recommended Droid**: manager-orchestrator-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 2-3 hours for comprehensive task management setup
- **Prerequisites**: Understanding of Git workflows, AI Dev Tasks integration, and development coordination

#### 7.3.10 Integration Checklist

**Before creating task lists, verify**:
- [ ] **PRD Exists**: PRD is properly formatted and complete
- **Branch Created**: Feature branch is created and checked out
- **AI Dev Tasks Ready**: Workflow files are available and executable
- **Team Coordination**: Team is notified of new feature branch
- **Requirements Clear**: Feature requirements are well-defined and approved

**During development, verify**:
- [ ] **Task Updates**: Task progress is updated regularly
- [ ] **Evidence Collection**: Evidence is collected for completed tasks
- [ ] **Quality Checks**: Code reviews and automated checks pass
- [ ] **Testing**: Tests pass for completed tasks
- [ ] **Dependencies**: Task dependencies are resolved

**Before merging, verify**:
- [ ] **Task Completion**: All tasks marked as completed
- [ ] **Test Coverage**: Required test coverage achieved
- [ ] **Code Review**: Peer reviews completed
- [ ] **Documentation**: Documentation is up to date
- [ ] **Integration**: Integration tests pass
- [ ] **Validation**: All quality gates pass
- [ ] **Conflicts**: No merge conflicts remain

**After merging, verify**:
- [ ] **Branch Cleanup**: Feature branch is deleted
- [ ] **Archive Creation**: Tasks and evidence are archived
- [ ] **Team Notification**: Team is notified of completion
- [ ] **Update Documentation**: Project documentation reflects completion
- [ ] **Metrics**: Progress metrics are updated

#### 7.3.11 Common Issues and Solutions

**Issue 1: Task Tracking Synchronization**
```bash
# Problem: Task progress updates not synchronized
# Solution: Force task list refresh
cd "tasks/$FEATURE_NAME"
bash process-task-list.md tasks/$FEATURE_NAME/tasks.md
git add tasks/$FEATURE_NAME/progress.md
git commit -m "feat: synchronize task progress - $TASK_ID status update"
```

**Issue 2: Evidence Collection Gaps**
```bash
# Problem: Missing evidence for completed tasks
# Solution: Collect missing evidence
bash scripts/collect-missing-evidence.sh "$FEATURE_NAME" "$TASK_ID"
```

**Issue 3: Task Status Inconsistency**
```bash
# Problem: Task status differs across systems
# Solution: Re-sync all task status
bash scripts/validate-task-status.sh "$FEATURE_NAME"
```

#### 7.3.12 Best Practices and Guidelines

**Development Best Practices**:
1. **Regular Progress Updates**: Update progress at least daily
2. **Evidence Collection**: Collect evidence for all completed tasks
3. **Quality Assurance**: Maintain high code review and testing standards
4. **Clear Communication**: Document progress blockers and dependencies
5. **Risk Management**: Proactively identify and address blockers

**Documentation Best Practices**:
1. **Task Descriptions**: Clear, specific, and actionable
2. **Acceptance Criteria**: Define and validate completion criteria
3. **Historical Tracking**: Maintain complete audit trail
4. **Stakeholder Visibility**: Keep stakeholders informed of progress
5. **Continuous Improvement**: Learn from patterns for future optimization

**Coordination Best Practices**:
1. **Regular Sync**: Daily team progress reviews
2. **Conflict Resolution**: Address conflicts proactively
3. **Resource Management**: Balance workload across droids
4. **Priority Management**: Reassess priorities based on new information
5. **Documentation Updates**: Keep progress synchronized with documentation

**Security Considerations**:
1. **Access Control**: Ensure proper permissions for task files
2. **Data Protection**: Sensitive data should be excluded from evidence
3. **Audit Trail**: Maintain complete historical records
4. **Compliance**: Follow organizational security policies
5. **Retention**: Archive completed work appropriately

#### 7.3.13 Template Files and Automation

**Task Management Templates**:
```json
{
  "task-management": {
    "task-templates": {
      "feature-branch": {
        "prd-template": "prd-template.md",
        "tasks-template": "tasks-template.md",
        "progress-template": "progress-template.md"
      },
      "hotfix-branch": {
        "prd-template": "hotfix-template.md",
        "tasks-template": "tasks-template.md",
        "progress-template": "progress-template.md"
      }
    },
    "automation-scripts": {
      "progress-tracker": "scripts/progress-tracker.js",
      "task-validator": "scripts/validate-task-status.js",
      "evidence-collector": "scripts/collect-missing-evidence.sh"
    }
  }
}
```

**Progress Template Structure**:
```markdown
# [Feature Name] - Progress Report
# Generated: [Timestamp]
# PRD: prd/[feature-name]/prd.md

## Task Overview
- **Total Tasks**: [Count]
- **Estimated Timeline**: [Timeline]
- **Priority Overview**: Critical: [Count], High: [Count], Medium: [Count], Low: [Count]

## Progress Summary
- **Completed**: [Count]/[Count] tasks completed
- **In Progress**: [Count]/[Count] tasks in progress
- **Blocked**: [Count]/[Count] tasks blocked

## Task Status Breakdown
[Priority Level Tasks]
[High Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

[Medium Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

[Low Priority Task 1: [Description]
- **Status**: [Status]
- **Assignee**: [Droid Name]
- **Evidence**: [Evidence Available]
- **Timeline**: [Estimated Hours]

## Dependencies
### Blockers
[Blocker Task 1]: [Dependency Chain]
- [Blocker Task 2]: [Dependency Chain]

## Risk Assessment
- **Technical Risks**: [Risk List]
- **Timeline Risks**: [Risk List]
- **Resource Risks**: [Risk List]

## Acceptance Criteria
- [ ] All critical tasks completed successfully
- [ ] Security implementations pass security audits
- [ ] Integration tests pass
- [ ] Code review completed
- [ ] Documentation is up to date
- [ ] Stakeholder approval received
- [ ] Deployment ready

## Next Steps
1. [Next Priority Task 1]: [Description]
2. [Next Priority 2]: [Description]
3. [Next Priority 3]: [Description]

## Review Notes
- [Review Note 1]: [Details]
- [Review Note 2]: [Details]
- [Review Note 3]: [Details]

## Evidence Archive
### Completed Tasks
[Task 1]: [Evidence]
- **Status**: Completed
- **Timestamp**: [Timestamp]
- **Path**: [File Path]
- **Review**: [Review Status]

### Blocked Tasks
[Task 1]: [Evidence]
- **Status**: Blocked
- **Blocker**: [Dependency]
- **Timestamp**: [Timestamp]
```

### Quality Gates
- **Task Completion**: All tasks marked as completed
- **Test Coverage**: Required test coverage achieved
- **Code Review**: Peer reviews completed
- **Documentation**: Documentation is up to date
- **Integration Tests**: Integration tests pass
- **Validation**: All quality gates pass
```

#### 7.3.14 Droid Delegation Notes
- **Recommended Droid**: manager-orchestrator-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 2-3 hours for comprehensive task management setup
- **Prerequisites**: Understanding of Git workflows, AI Dev Tasks integration, and development coordination
- **Related Sections**: Section 7.1 (workflow coordination), Section 9.4 (workflow synchronization), Section 9.1 (delegation protocols)

---

## 8. Modular Code Patterns

### 8.1 Architecture Patterns

**Context**: Establish comprehensive modular architecture patterns for Factory.ai droids to ensure scalable, maintainable, and extensible codebase structures that support modular development and deployment.

**Key Concepts**:
- **Modular Monolith**: Single deployable unit with clear module boundaries
- **Domain-Driven Design**: Organize code around business domains and requirements
- **Hexagonal Architecture**: Isolate business logic from external concerns
- **Micro-Frontends**: Independent frontend modules for complex applications
- **Event-Driven Architecture**: Loose coupling through events and messages

**Implementation Guidelines**:
1. **Identify Domains**: Analyze business requirements to identify natural domain boundaries
2. **Define Module Boundaries**: Create clear interfaces and contracts between modules
3. **Implement Dependency Inversion**: Use interfaces to decouple high-level modules from low-level details
4. **Apply Hexagonal Architecture**: Place business logic at the core, surround with ports and adapters
5. **Use Events for Communication**: Implement event-driven patterns for inter-module communication

**Code Example**:
```typescript
// === Section 8.1: Modular Architecture Example ===
// Context: User management module using hexagonal architecture
// Prerequisites: Understanding of dependency inversion and domain-driven design

// Domain layer - Core business logic
export interface DomainUserRepository {
  findById(id: string): Promise<DomainUser | null>;
  save(user: DomainUser): Promise<DomainUser>;
}

export interface DomainUser {
  id: string;
  email: string;
  name: string;
}

export class UserService {
  constructor(private userRepository: DomainUserRepository) {}

  async createUser(email: string, name: string): Promise<DomainUser> {
    // Business logic validation
    if (!email || !name) {
      throw new Error('Invalid user data');
    }

    const user: User = {
      id: crypto.randomUUID(),
      email,
      name
    };

    return await this.userRepository.save(user);
  }

  async getUser(id: string): Promise<User> {
    const user = await this.userRepository.findById(id);
    if (!user) {
      throw new Error('User not found');
    }
    return user;
  }
}

// Infrastructure layer - Database adapter
export class DatabaseUserRepository implements UserRepository {
  async findById(id: string): Promise<User | null> {
    // Database implementation
    const result = await db.query('SELECT * FROM users WHERE id = ?', [id]);
    return result.length > 0 ? result[0] : null;
  }

  async save(user: User): Promise<User> {
    // Database save implementation
    await db.query('INSERT INTO users (id, email, name) VALUES (?, ?, ?)', [user.id, user.email, user.name]);
    return user;
  }
}

// Application layer - Use case orchestration
export class CreateUserUseCase {
  constructor(private userService: UserService) {}

  async execute(email: string, name: string): Promise<User> {
    try {
      return await this.userService.createUser(email, name);
    } catch (error) {
      // Handle domain errors
      throw new ValidationError('Failed to create user', { cause: error });
    }
  }
}

// Composition root - Wire dependencies
export function createUserApplication() {
  const userRepo = new DatabaseUserRepository();
  const userService = new UserService(userRepo);
  const useCase = new CreateUserUseCase(userService);
  return { useCase };
}

// Usage:
// const app = createUserApplication();
// const user = await app.useCase.execute('user@example.com', 'John Doe');
```

**ASCII Diagram**:
```
[External Actors]
       ↓
[Adapters/Presenters]
       ↓ Ports & Adapters
[Application Layer]
       ↓ Use Cases
[Domain Layer] ← Core Business Logic
       ↓ Entities & Services
[Infrastructure Layer]
```

**Validation Checklist**:
- [ ] Domain boundaries are clearly defined and documented
- [ ] High-level modules do not depend on low-level modules
- [ ] All external dependencies use interfaces (ports)
- [ ] Business logic is isolated from framework and database concerns
- [ ] Event-driven communication is implemented where appropriate
- [ ] Module interfaces are well-documented with TypeScript types
- [ ] Dependency injection is used for module composition

**Common Issues & Solutions**:
- **Issue**: Tight coupling between modules
  - **Solution**: Implement proper ports and adapters pattern, use dependency inversion
- **Issue**: Business logic leaking into infrastructure layer
  - **Solution**: Refactor to keep business rules in domain layer, use simple data transfer objects
- **Issue**: Circular dependencies between modules
  - **Solution**: Use events for communication or refactor shared concerns into separate modules

**Related Sections**:
- Section 8.2: Component reusability within modular architecture
- Section 8.5: Configuration management for modular systems
- Section 9.1: Task delegation in modular architectures

**Droid Delegation Notes**:
- **Recommended Droid**: backend-engineer-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 4-5 hours for modular architecture implementation
- **Prerequisites**: Understanding of domain-driven design and dependency inversion principles

### 8.2 Component Reusability Guidelines

**Context**: Define standardized patterns for creating reusable components that maintain consistency, promote maintainability, and reduce code duplication across Factory.ai droid applications.

**Key Concepts**:
- **Composition over Inheritance**: Build components using composition rather than inheritance
- **Single Responsibility**: Each component should have one clear purpose
- **Props-Driven Design**: Components should be configurable through props
- **Accessibility First**: Reusable components must be accessible by default
- **Type-Safe Props**: Full TypeScript support for component interfaces

**Implementation Guidelines**:
1. **Design for Composition**: Create small, focused components that can be composed
2. **Define Clear Interfaces**: Use TypeScript interfaces for all props with good defaults
3. **Implement Accessibility**: Include ARIA labels, keyboard navigation, and screen reader support
4. **Use Variant Patterns**: Implement cva for consistent styling variations
5. **Document Usage**: Provide clear examples and TypeScript definitions

**Code Example**:
```typescript
// === Section 8.2: Reusable Button Component ===
// Context: Type-safe, accessible, composable button component
// Prerequisites: shadcn/ui setup and TypeScript configuration

import React from 'react';
import { Slot } from '@radix-ui/react-slot';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';

// Define button variants using cva for consistent styling
const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 px-3 rounded-md',
        lg: 'h-11 px-8 rounded-md',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
);

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> &
  VariantProps<typeof buttonVariants> & {
    asChild?: boolean;
    loading?: boolean;
    icon?: React.ReactNode;
    iconPosition?: 'left' | 'right';
  };

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, loading = false, icon, iconPosition = 'left', asChild = false, children, ...props }, ref) => {
    const Comp = asChild ? Slot : 'button';
    const ComponentIcon = icon;

    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      >
        {loading && (
          <svg className="mr-2 h-4 w-4 animate-spin" viewBox="0 0 24 24">
            <circle
              className="opacity-25"
              cx="12"
              cy="12"
              r="10"
              stroke="currentColor"
              strokeWidth="4"
            />
            <path
              className="opacity-75"
              fill="currentColor"
              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
            />
          </svg>
        )}
        {ComponentIcon && iconPosition === 'left' && React.cloneElement(ComponentIcon as React.ReactElement, { className: 'mr-2 h-4 w-4' })}
        {children}
        {ComponentIcon && iconPosition === 'right' && React.cloneElement(ComponentIcon as React.ReactElement, { className: 'ml-2 h-4 w-4' })}
      </Comp>
    );
  }
);

Button.displayName = 'Button';

export { Button, buttonVariants };

// Usage Examples:
// <Button variant="outline" size="sm" loading>Submit</Button>
// <Button variant="destructive" icon={<DeleteIcon />} iconPosition="left">Delete</Button>
// <div className="flex gap-2">
//   <Button asChild>
//     <a href="/dashboard">Dashboard</a>
//   </Button>
// </div>
```

**Validation Checklist**:
- [ ] Components have clear, single responsibilities
- [ ] All props are typed with TypeScript interfaces
- [ ] Default props are provided where appropriate
- [ ] Components support composition through children and asChild
- [ ] Accessibility features are implemented (ARIA, keyboard navigation)
- [ ] Storybook stories are created for documentation
- [ ] Components are tested with both unit and integration tests

**Common Issues & Solutions**:
- **Issue**: Components are too specific to one use case
  - **Solution**: Refactor to extract common patterns into smaller, reusable pieces
- **Issue**: Props are not type-safe or have poor documentation
  - **Solution**: Define comprehensive TypeScript interfaces with JSDoc comments
- **Issue**: Components don't handle edge cases (empty states, loading)
  - **Solution**: Implement loading states, error boundaries, and default fallbacks

**Related Sections**:
- Section 5.5: shadcn/ui integration patterns
- Section 8.1: Architecture patterns for component organization
- Section 8.4: State management in reusable components

**Droid Delegation Notes**:
- **Recommended Droid**: frontend-engineer-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 3-4 hours for comprehensive reusability implementation
- **Prerequisites**: Understanding of React component composition and TypeScript interfaces

### 8.3 Plugin and Extension Framework

**Context**: Define secure, extensible plugin architecture for Factory.ai droids to enable modular extensions, third-party integrations, and customizable functionality without compromising core system stability.

**Key Concepts**:
- **Plugin Interface Contract**: Well-defined interfaces for plugin registration and lifecycle
- **Sandboxing**: Isolate plugins to prevent adverse effects on core system
- **Security Boundaries**: Strict permission models and validation
- **Version Compatibility**: Backward compatibility and migration strategies
- **Hot Reloading**: Enable dynamic plugin loading without system restart

**Implementation Guidelines**:
1. **Define Plugin Contracts**: Create TypeScript interfaces for plugin entry points
2. **Implement Sandbox Environment**: Use isolated execution contexts (Web Workers, iframes)
3. **Establish Security Model**: Define permission scopes and validation rules
4. **Create Plugin Registry**: Centralized registration and management system
5. **Support Lifecycle Management**: Handle plugin initialization, execution, and cleanup

**Code Example**:
```typescript
// === Section 8.3: Secure Plugin Framework ===
// Context: Type-safe plugin system with security boundaries
// Prerequisites: Understanding of TypeScript interfaces and dependency injection

// Plugin contract interface
export interface PluginContract {
  name: string;
  version: string;
  author: string;
  permissions: PermissionScope[];
  init(context: PluginContext): Promise<void>;
  execute(input: unknown): Promise<PluginResult>;
  destroy(): Promise<void>;
}

export type PermissionScope = 'read-users' | 'write-users' | 'read-settings' | 'admin';

export interface PluginContext {
  services: PluginServices;
  config: Record<string, unknown>;
  logger: Logger;
  eventBus: EventBus;
}

export interface PluginServices {
  userService: UserService;
  notificationService: NotificationService;
}

export interface PluginResult {
  success: boolean;
  data?: unknown;
  error?: PluginError;
}

export interface PluginError {
  code: string;
  message: string;
  severity: 'low' | 'medium' | 'high';
}

// Plugin manager class
export class PluginManager {
  private plugins: Map<string, PluginContract> = new Map();
  private activeInstances: Map<string, PluginInstance> = new Map();
  private securityValidator: SecurityValidator;

  constructor(private pluginLoader: PluginLoader) {
    this.securityValidator = new SecurityValidator();
  }

  async registerPlugin(pluginPath: string): Promise<void> {
    const pluginModule = await this.pluginLoader.load(pluginPath);
    const plugin = pluginModule.default;

    if (!this.isValidPlugin(plugin)) {
      throw new Error(`Invalid plugin: ${plugin.name}`);
    }

    // Validate permissions
    if (!this.securityValidator.validatePermissions(plugin.permissions)) {
      throw new Error(`Insufficient permissions for plugin: ${plugin.name}`);
    }

    this.plugins.set(plugin.name, plugin);
    logger.info('Plugin registered', { pluginName: plugin.name, version: plugin.version });
  }

  async activatePlugin(pluginName: string, config?: Record<string, unknown>): Promise<void> {
    const plugin = this.plugins.get(pluginName);
    if (!plugin) {
      throw new Error(`Plugin not found: ${pluginName}`);
    }

    // Create isolated execution context
    const context = this.createPluginContext(plugin, config);
    const instance = new PluginInstance(plugin, context);

    await instance.initialize();
    this.activeInstances.set(pluginName, instance);

    logger.info('Plugin activated', { pluginName, instanceId: instance.id });
  }

  async deactivatePlugin(pluginName: string): Promise<void> {
    const instance = this.activeInstances.get(pluginName);
    if (!instance) {
      return;
    }

    await instance.destroy();
    this.activeInstances.delete(pluginName);

    logger.info('Plugin deactivated', { pluginName });
  }

  async executePlugin(pluginName: string, input: unknown): Promise<PluginResult> {
    const instance = this.activeInstances.get(pluginName);
    if (!instance) {
      return {
        success: false,
        error: { code: 'PLUGIN_NOT_ACTIVE', message: 'Plugin is not active', severity: 'medium' }
      };
    }

    try {
      // Validate input against plugin contract
      const validatedInput = instance.plugin.validateInput(input);
      return await instance.plugin.execute(validatedInput);
    } catch (error) {
      logger.error('Plugin execution failed', { pluginName, error });
      return {
        success: false,
        error: { code: 'EXECUTION_ERROR', message: error.message, severity: 'high' }
      };
    }
  }

  private isValidPlugin(plugin: any): boolean {
    return typeof plugin === 'object' &&
           typeof plugin.name === 'string' &&
           typeof plugin.version === 'string' &&
           typeof plugin.init === 'function' &&
           typeof plugin.execute === 'function' &&
           typeof plugin.destroy === 'function';
  }

  private createPluginContext(plugin: PluginContract, config?: Record<string, unknown>): PluginContext {
    return {
      services: {
        userService: new SandboxedUserService(plugin.permissions),
        notificationService: new SandboxedNotificationService(plugin.permissions)
      },
      config: config || {},
      logger: new PluginLogger(plugin.name),
      eventBus: new SecureEventBus(plugin.permissions)
    };
  }
}

// Plugin instance class
class PluginInstance {
  readonly id: string;

  constructor(
    public plugin: PluginContract,
    public context: PluginContext
  ) {
    this.id = crypto.randomUUID();
  }

  async initialize(): Promise<void> {
    await this.plugin.init(this.context);
  }

  async destroy(): Promise<void> {
    await this.plugin.destroy();
  }

  validateInput(input: unknown): unknown {
    // Implement plugin-specific input validation
    return input;
  }
}

// Usage example:
// const pluginManager = new PluginManager(new FilePluginLoader());
// await pluginManager.registerPlugin('./plugins/user-analytics.js');
// await pluginManager.activatePlugin('user-analytics', { batchSize: 100 });
// const result = await pluginManager.executePlugin('user-analytics', { users: userData });
```

**ASCII Diagram**:
```
[Plugin Manager]
       ↓
[Plugin Registry] ← Register Plugins
       ↓
[Security Validator]
       ↓
[Active Instances]
       ↓
[Sandbox Contexts]
       ↓
[Plugin Execution]
       ↓
[Event Bus / Logging]
```

**Validation Checklist**:
- [ ] Plugin contracts are well-defined with TypeScript interfaces
- [ ] All plugins are validated before registration
- [ ] Security permissions are validated and scoped
- [ ] Plugins run in isolated execution contexts
- [ ] Error handling doesn't expose core system details
- [ ] Plugin lifecycle is properly managed
- [ ] Version compatibility is maintained

**Common Issues & Solutions**:
- **Issue**: Plugin code affects core system stability
  - **Solution**: Implement strict sandboxing with isolated execution contexts
- **Issue**: Security vulnerabilities from untrusted plugins
  - **Solution**: Strict permission model and input/output validation
- **Issue**: Plugin conflicts or version incompatibilities
  - **Solution**: Implement namespace isolation and version pinning

**Related Sections**:
- Section 8.1: Architecture patterns for plugin integration
- Section 11.3: Security considerations for extensions
- Section 9.3: Specialized droid integration patterns

**Droid Delegation Notes**:
- **Recommended Droid**: backend-engineer-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 5-6 hours for secure plugin framework implementation
- **Prerequisites**: Understanding of plugin architectures and security isolation principles

### 8.4 State Management Patterns

**Context**: Document standardized state management approaches for Factory.ai droids to ensure predictable, testable, and maintainable state handling across complex applications with multiple data sources.

**Key Concepts**:
- **Single Source of Truth**: Centralized state with derived data
- **Unidirectional Data Flow**: State changes through explicit actions
- **Local State First**: Component-local state before global management
- **Type-Safe State**: Full TypeScript integration for state definitions
- **Server State Management**: Separate handling for remote data

**Implementation Guidelines**:
1. **Use Local State for UI**: Prefer React local state for component-specific concerns
2. **Global State for Shared Data**: Use context or libraries for application-wide state
3. **Server State with tRPC**: Leverage tRPC for type-safe server state management
4. **Optimistic Updates**: Implement optimistic UI updates with rollback capability
5. **Loading and Error States**: Consistent handling across all state types

**Code Example**:
```typescript
// === Section 8.4: Hybrid State Management ===
// Context: Combining local, global, and server state for complex applications
// Prerequisites: tRPC setup and React Context understanding

import React, { createContext, useContext, useReducer } from 'react';
import { useMutation, useQuery } from '@tanstack/react-query';
import { api } from '@/trpc/client';
import type { AppRouter } from '@/trpc/server';

// Type definitions for global state
type AppState = {
  user: User | null;
  theme: 'light' | 'dark';
  notifications: Notification[];
};

type User = {
  id: string;
  email: string;
  name: string;
};

type Notification = {
  id: string;
  message: string;
  type: 'info' | 'warning' | 'error';
};

// Global state context
const AppStateContext = createContext<AppState | null>(null);
const AppDispatchContext = createContext<React.Dispatch<AppAction> | null>(null);

// State actions
type AppAction = 
  | { type: 'SET_USER'; payload: User }
  | { type: 'CLEAR_USER' }
  | { type: 'SET_THEME'; payload: 'light' | 'dark' }
  | { type: 'ADD_NOTIFICATION'; payload: Notification }
  | { type: 'REMOVE_NOTIFICATION'; payload: string };

// Reducer for global state
function appReducer(state: AppState, action: AppAction): AppState {
  switch (action.type) {
    case 'SET_USER':
      return { ...state, user: action.payload };
    case 'CLEAR_USER':
      return { ...state, user: null };
    case 'SET_THEME':
      return { ...state, theme: action.payload };
    case 'ADD_NOTIFICATION':
      return {
        ...state,
        notifications: [...state.notifications, action.payload]
      };
    case 'REMOVE_NOTIFICATION':
      return {
        ...state,
        notifications: state.notifications.filter(n => n.id !== action.payload)
      };
    default:
      return state;
  }
}

// Provider component
export function AppStateProvider({ children }: { children: React.ReactNode }) {
  const [state, dispatch] = useReducer(appReducer, {
    user: null,
    theme: 'light',
    notifications: []
  });

  return (
    <AppStateContext.Provider value={state}>
      <AppDispatchContext.Provider value={dispatch}>
        {children}
      </AppDispatchContext.Provider>
    </AppStateContext.Provider>
  );
}

// Custom hooks for state access
export function useAppState() {
  const context = useContext(AppStateContext);
  if (!context) {
    throw new Error('useAppState must be used within AppStateProvider');
  }
  return context;
}

export function useAppDispatch() {
  const context = useContext(AppDispatchContext);
  if (!context) {
    throw new Error('useAppDispatch must be used within AppStateProvider');
  }
  return context;
}

// Server state management with tRPC and TanStack Query
export function useUserProfile(userId: string) {
  // Server state query
  const { data: serverData, isLoading, error } = useQuery({
    queryKey: ['user', userId],
    queryFn: () => api.user.getById.query({ id: userId }),
  });

  // Local state for UI interactions
  const [localEdits, setLocalEdits] = React.useState<Partial<User>>({});
  const { dispatch } = useAppState();

  // Optimistic update mutation
  const updateMutation = useMutation({
    mutationFn: (updates: Partial<User>) =>
      api.user.update.mutate({ id: userId, ...updates }),
    onMutate: async (newData) => {
      // Cancel outgoing refetches
      await queryClient.cancelQueries({ queryKey: ['user', userId] });

      // Snapshot previous value
      const previousData = queryClient.getQueryData(['user', userId]);

      // Optimistically update to new value
      queryClient.setQueryData(['user', userId], (old: any) => ({ ...old, ...newData }));

      // Return context with previous and rollback function
      return { previousData };
    },
    onError: (err, newData, context) => {
      // Rollback on error
      queryClient.setQueryData(['user', userId], context?.previousData);
      dispatch({ type: 'ADD_NOTIFICATION', payload: {
        id: crypto.randomUUID(),
        message: 'Failed to update profile',
        type: 'error'
      } });
    },
    onSettled: () => {
      // Always refetch after error or success
      queryClient.invalidateQueries({ queryKey: ['user', userId] });
    },
  });

  // Combined state: server data + local edits
  const profile = React.useMemo(() => ({
    ...serverData,
    ...localEdits
  }), [serverData, localEdits]);

  const updateProfile = React.useCallback((updates: Partial<User>) => {
    setLocalEdits(prev => ({ ...prev, ...updates }));
    updateMutation.mutate(updates);
  }, [updateMutation]);

  return {
    profile,
    isLoading,
    error,
    updateProfile,
    isUpdating: updateMutation.isPending
  };
}

// Component using hybrid state management
export function UserProfile({ userId }: { userId: string }) {
  const { profile, isLoading, updateProfile } = useUserProfile(userId);
  const { theme } = useAppState();
  const [localName, setLocalName] = React.useState('');

  if (isLoading) return <div className="animate-pulse">Loading...</div>;

  return (
    <div className={cn('p-6', theme === 'dark' ? 'bg-gray-800 text-white' : 'bg-white text-gray-900')}>
      <div className="space-y-4">
        <h2 className="text-2xl font-bold">{profile?.name || 'User Profile'}</h2>
        <div className="space-y-2">
          <label className="block text-sm font-medium">Name</label>
          <input
            type="text"
            value={localName || profile?.name || ''}
            onChange={(e) => setLocalName(e.target.value)}
            className="w-full p-2 border rounded"
            placeholder="Enter name"
          />
          <button
            onClick={() => {
              updateProfile({ name: localName });
              setLocalName('');
            }}
            disabled={!localName}
            className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:opacity-50"
          >
            Update Name
          </button>
        </div>
        {profile?.email && (
          <div className="text-sm text-gray-500">Email: {profile.email}</div>
        )}
      </div>
    </div>
  );
}

// Usage in App:
// <AppStateProvider>
//   <UserProfile userId="123" />
// </AppStateProvider>
```

**Validation Checklist**:
- [ ] Local state used for UI-specific concerns
- [ ] Global state managed with context or reducer patterns
- [ ] Server state uses tRPC queries and mutations
- [ ] Optimistic updates implemented with proper rollback
- [ ] Loading and error states handled consistently
- [ ] TypeScript types defined for all state shapes
- [ ] State changes are explicit and traceable

**Common Issues & Solutions**:
- **Issue**: Global state becomes bloated with local concerns
  - **Solution**: Keep only truly application-wide state in global store, use local state for components
- **Issue**: Server state and local state get out of sync
  - **Solution**: Use optimistic updates with automatic rollback on errors and refetch on settle
- **Issue**: Race conditions between multiple state updates
  - **Solution**: Use unique query keys and proper invalidation patterns, implement action queuing if needed

**Related Sections**:
- Section 5.4: API design patterns for server state integration
- Section 8.1: Architecture patterns for state separation
- Section 8.2: Component reusability with state props

**Droid Delegation Notes**:
- **Recommended Droid**: frontend-engineer-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 4-5 hours for comprehensive state management implementation
- **Prerequisites**: Understanding of React state patterns and tRPC integration

### 8.5 Configuration Management

**Context**: Define strategies for managing configuration in modular Factory.ai droid applications to ensure environment-specific settings, secure secret handling, and consistent configuration across distributed systems.

**Key Concepts**:
- **Environment Separation**: Clear boundaries between development, staging, and production configurations
- **Secret Management**: Secure handling of sensitive configuration values
- **Type-Safe Configuration**: Full TypeScript validation for configuration schemas
- **Hierarchical Overrides**: Support for multiple configuration layers with override precedence
- **Runtime Validation**: Validate configuration at application startup

**Implementation Guidelines**:
1. **Define Configuration Schema**: Create TypeScript interfaces for all configuration options
2. **Implement Layered Loading**: Load configuration from multiple sources with proper precedence
3. **Validate at Startup**: Run comprehensive validation before application starts
4. **Handle Secrets Securely**: Use environment variables and secret management services
5. **Provide Runtime Access**: Create typed hooks and services for configuration access

**Code Example**:
```typescript
// === Section 8.5: Type-Safe Configuration Management ===
// Context: Secure, validated configuration system for modular applications
// Prerequisites: Understanding of TypeScript validation and environment variables

import { z } from 'zod';
import { logger } from '@/lib/logger';

// Configuration schema definition
export const configSchema = z.object({
  // Database configuration
  database: z.object({
    url: z.string().url(),
    poolSize: z.number().min(1).max(50).default(10),
    ssl: z.boolean().default(true),
    migrations: z.object({
      enabled: z.boolean().default(true),
      path: z.string().default('./migrations')
    })
  }),

  // API configuration
  api: z.object({
    port: z.number().int().min(1).max(65535).default(3000),
    host: z.string().default('0.0.0.0'),
    cors: z.object({
      origins: z.array(z.string().url()).default([]),
      credentials: z.boolean().default(false)
    }),
    rateLimit: z.object({
      windowMs: z.number().default(15 * 60 * 1000), // 15 minutes
      maxRequests: z.number().default(100)
    })
  }),

  // Security configuration
  security: z.object({
    jwt: z.object({
      secret: z.string().min(32),
      expiresIn: z.string().default('24h'),
      issuer: z.string(),
      audience: z.string().optional()
    }),
    password: z.object({
      minLength: z.number().min(8).default(8),
      complexity: z.object({
        uppercase: z.boolean().default(true),
        lowercase: z.boolean().default(true),
        numbers: z.boolean().default(true),
        symbols: z.boolean().default(true)
      })
    })
  }),

  // Feature flags
  features: z.object({
    authentication: z.boolean().default(true),
    analytics: z.boolean().default(false),
    caching: z.boolean().default(true),
    monitoring: z.boolean().default(process.env.NODE_ENV === 'production'),
    developmentMode: z.boolean().default(process.env.NODE_ENV === 'development')
  }),

  // Logging configuration
  logging: z.object({
    level: z.enum(['debug', 'info', 'warn', 'error']).default('info'),
    format: z.enum(['json', 'pretty']).default('json'),
    maxSize: z.number().default(10 * 1024 * 1024), // 10MB
    maxFiles: z.number().default(5)
  }),

  // SMTP configuration (secrets)
  email: z.object({
    enabled: z.boolean().default(false),
    host: z.string().optional(),
    port: z.number().optional(),
    user: z.string().optional(),
    pass: z.string().optional(), // Loaded from secrets
    from: z.string().email().optional()
  }).optional()
});

export type Config = z.infer<typeof configSchema>;

// Configuration loader class
export class ConfigLoader {
  private config: Partial<Config> = {};

  async load(): Promise<Config> {
    try {
      // Load from different sources in order of precedence
      await this.loadEnvironmentVariables();
      await this.loadSecrets();
      await this.loadDefaultValues();
      await this.loadOverrides();

      // Validate the complete configuration
      const validatedConfig = configSchema.parse(this.config);

      // Runtime validation and logging
      this.validateRuntimeDependencies(validatedConfig);
      this.logConfiguration(validatedConfig);

      return validatedConfig;
    } catch (error) {
      if (error instanceof z.ZodError) {
        logger.fatal('Configuration validation failed', {
          errors: error.errors,
          config: this.config
        });
        process.exit(1);
      }

      logger.fatal('Configuration loading failed', { error });
      process.exit(1);
    }
  }

  private async loadEnvironmentVariables(): Promise<void> {
    const envConfig: Partial<Config> = {};

    // Database
    if (process.env.DATABASE_URL) {
      envConfig.database = {
        ...envConfig.database,
        url: process.env.DATABASE_URL
      };
    }

    // API
    if (process.env.PORT) {
      envConfig.api = {
        ...envConfig.api,
        port: parseInt(process.env.PORT, 10)
      };
    }

    // Feature flags
    if (process.env.FEATURE_ANALYTICS === 'true') {
      envConfig.features = {
        ...envConfig.features,
        analytics: true
      };
    }

    this.config = { ...this.config, ...envConfig };
  }

  private async loadSecrets(): Promise<void> {
    try {
      // Load sensitive values from secret manager (e.g., AWS SSM, Vault)
      const secrets = await this.fetchSecrets([
        'SMTP_USER',
        'SMTP_PASS',
        'JWT_SECRET',
        'ENCRYPTION_KEY'
      ]);

      if (secrets.smtpUser && secrets.smtpPass) {
        this.config.email = {
          ...this.config.email,
          enabled: true,
          user: secrets.smtpUser,
          pass: secrets.smtpPass
        };
      }

      if (secrets.jwtSecret) {
        this.config.security = {
          ...this.config.security,
          jwt: {
            ...this.config.security?.jwt,
            secret: secrets.jwtSecret
          }
        };
      }

    } catch (error) {
      logger.warn('Failed to load secrets, using fallback values', { error });
    }
  }

  private loadDefaultValues(): void {
    // Apply default values not covered by schema defaults
    this.config = {
      ...this.config,
      database: {
        ...this.config.database,
        ssl: process.env.NODE_ENV === 'production'
      },
      features: {
        ...this.config.features,
        developmentMode: process.env.NODE_ENV === 'development'
      }
    };
  }

  private async loadOverrides(): Promise<void> {
    try {
      // Load overrides from external configuration (e.g., config files, databases)
      const overrideConfig = await this.fetchOverrides();
      this.config = { ...this.config, ...overrideConfig };
    } catch (error) {
      logger.warn('Failed to load configuration overrides', { error });
    }
  }

  private validateRuntimeDependencies(config: Config): void {
    // Check for required dependencies based on enabled features
    if (config.features.monitoring && !process.env.PROMETHEUS_PORT) {
      logger.warn('Monitoring enabled but Prometheus not configured');
    }

    if (config.email?.enabled && (!config.email.host || !config.email.from)) {
      throw new Error('Email enabled but configuration incomplete');
    }
  }

  private logConfiguration(config: Config): void {
    const safeConfig = this.sanitizeConfig(config);
    logger.info('Configuration loaded successfully', { ...safeConfig });
  }

  private sanitizeConfig(config: Config): Partial<Config> {
    const { security, email, ...safeConfig } = config;
    // Remove sensitive fields
    delete (safeConfig as any).database?.url;
    return safeConfig;
  }

  private async fetchSecrets(secretNames: string[]): Promise<Record<string, string>> {
    // Implementation for secret manager integration
    // This would use AWS SSM, HashiCorp Vault, etc.
    const secrets: Record<string, string> = {};
    for (const name of secretNames) {
      // Placeholder - actual implementation would fetch from secret store
      secrets[name.toLowerCase()] = process.env[`SECRET_${name}`] || '';
    }
    return secrets;
  }

  private async fetchOverrides(): Promise<Partial<Config>> {
    // Load from external sources like config files, databases, etc.
    return {};
  }
}

// Runtime configuration access
export class ConfigService {
  private static instance: ConfigService;
  private config: Config;

  private constructor(config: Config) {
    this.config = config;
  }

  static async initialize(): Promise<ConfigService> {
    if (ConfigService.instance) {
      return ConfigService.instance;
    }

    const loader = new ConfigLoader();
    const config = await loader.load();
    ConfigService.instance = new ConfigService(config);
    return ConfigService.instance;
  }

  getConfig(): Config {
    // Return immutable view of configuration
    return Object.freeze({ ...this.config });
  }

  get<K extends keyof Config>(key: K): Config[K] {
    const value = this.config[key];
    if (value === undefined) {
      throw new Error(`Configuration key not found: ${key}`);
    }
    return value;
  }

  getOrDefault<K extends keyof Config>(key: K, defaultValue: Config[K]): Config[K] {
    return this.config[key] ?? defaultValue;
  }

  async reloadConfig(): Promise<void> {
    ConfigService.instance = new ConfigService(await new ConfigLoader().load());
    logger.info('Configuration reloaded successfully');
  }

  // Convenience methods for common configurations
export function getDatabaseUrl() {
    const service = ConfigService.instance;
    if (!service) {
      throw new Error('ConfigService not initialized');
    }
    return service.get('database').url;
  }

  export function getApiPort() {
    const service = ConfigService.instance;
    if (!service) {
      throw new Error('ConfigService not initialized');
    }
    return service.get('api').port;
  }
}

// Usage in application:
// async function startApplication() {
//   const configService = await ConfigService.initialize();
//   const config = configService.getConfig();
//   const dbUrl = getDatabaseUrl();
//   const apiPort = getApiPort();
//   // Start application with validated configuration
// }
```

**ASCII Diagram**:
```
[Startup]
     ↓
[Environment Variables]
     ↓
[Secret Manager] ← Load Secrets
     ↓
[Default Values]
     ↓
[Override Sources]
     ↓
[Validation Layer] ← Apply Schema Validation
     ↓
[Runtime Validation]
     ↓
[ConfigService] ← Type-safe access
     ↓
[Application Components]
       ↓
[Feature-Specific Hooks]
```

**Validation Checklist**:
- [ ] Configuration schema is defined and exhaustive
- [ ] All required environment variables are present
- [ ] Secret values are loaded from secure storage
- [ ] Configuration validates at startup or fails loudly
- [ ] TypeScript types match runtime configuration
- [ ] Sensitive values are never logged or exposed
- [ ] Configuration changes can be applied without restart where possible
- [ ] Different environments have distinct configurations

**Common Issues & Solutions**:
- **Issue**: Development secrets in production environment
  - **Solution**: Implement triple validation: type validation, value validation, and environment-specific validation
- **Issue**: Missing or invalid environment variables
  - **Solution**: Provide comprehensive defaults and clear error messages, never use undefined values
- **Issue**: Configuration drift between environments
  - **Solution**: Use configuration validation at startup and CI/CD gates, implement configuration as code
- **Issue**: Secret values logged accidentally
  - **Solution**: Implement automatic sanitization for logging and debugging

**Related Sections**:
- Section 8.1: Architecture patterns for configuration integration
- Section 11.3: Security considerations for configuration management
- Section 10.1: Environment-specific configuration in deployment

**Droid Delegation Notes**:
- **Recommended Droid**: backend-engineer-droid-forge
- **Task Complexity**: Medium
- **Estimated Time**: 3-4 hours for comprehensive configuration management
- **Prerequisites**: Understanding of environment management and TypeScript validation</parameter_name=

---

## 9. Droid Coordination & Delegation

### 9.1 Task Delegation Protocols

*This section will define standardized delegation protocols*

### 9.2 Inter-Droid Communication

*This section will document droid interaction patterns*

### 9.3 Specialized Droid Integration

*This section will cover integration with specialized droids:*
- better-auth-integration-droid-forge
- trpc-tanstack-integration-droid-forge
- security-audit-droid-forge
- frontend-engineer-droid-forge
- typescript-integration-droid-forge
- manager-orchestrator-droid-forge

### 9.4 Workflow Synchronization

*This section will define workflow coordination patterns*

### 9.5 Manager Droid Coordination

*This section will document manager-orchestrator integration*

---

## 10. Deployment Patterns

### 10.1 Development Deployment

- Docker containers with hot reload
- Volume mounts for live code changes
- Development database and cache instances

### 10.2 Production Deployment

- Hardened distroless Docker containers
- Nginx reverse proxy configuration
- Production database and Valkey instances
- Automated CI/CD pipeline

---

## 11. Security Guidelines

### 11.1 Input Validation and Normalization

*This section will be expanded with specific security patterns*

### 11.2 Secret Management

*This section will include detailed secret handling guidelines*

### 11.3 Security Best Practices

#### 11.3.1 Core Security Principles

**Context**: Establish comprehensive security framework for Factory.ai droids to protect against common vulnerabilities and ensure secure development practices.

**Key Concepts**:
- **Defense in Depth**: Multiple layers of security controls
- **Principle of Least Privilege**: Minimum permissions required for functionality
- **Secure by Default**: Secure configurations out of the box
- **Zero Trust Architecture**: Verify everything, trust nothing
- **Continuous Security**: Security as an ongoing process, not one-time setup

#### 11.3.2 Authentication and Authorization

**Secure Authentication Patterns**:
```typescript
// === Section 11.3: Secure Authentication Patterns ===
// Context: Implementation of secure authentication for droid services
// Prerequisites: Understanding of authentication concepts and security best practices

export interface SecurityContext {
  userId: string;
  sessionId: string;
  permissions: string[];
  roles: string[];
  expiresAt: Date;
  ipAddress: string;
  userAgent: string;
}

export class AuthenticationService {
  constructor(
    private jwtService: JWTService,
    private userService: UserService,
    private rateLimiter: RateLimiter
  ) {}

  async authenticate(credentials: AuthCredentials): Promise<AuthResult> {
    try {
      // Rate limiting check
      const rateLimitResult = await this.rateLimiter.checkLimit(
        credentials.email,
        'auth_attempt'
      );
      
      if (!rateLimitResult.allowed) {
        return {
          success: false,
          error: {
            code: 'RATE_LIMIT_EXCEEDED',
            message: 'Too many authentication attempts',
            category: ErrorCategory.AUTHENTICATION,
            severity: 'medium',
            recoverable: false,
            timestamp: new Date(),
            context: { 
              retryAfter: rateLimitResult.retryAfter,
              attemptCount: rateLimitResult.attemptCount 
            }
          }
        };
      }

      // Input validation
      const validation = this.validateCredentials(credentials);
      if (!validation.success) {
        return validation;
      }

      // User lookup
      const user = await this.userService.findByEmail(credentials.email);
      if (!user) {
        // Use generic error message to prevent user enumeration
        return {
          success: false,
          error: {
            code: 'INVALID_CREDENTIALS',
            message: 'Invalid email or password',
            category: ErrorCategory.AUTHENTICATION,
            severity: 'medium',
            recoverable: false,
            timestamp: new Date()
          }
        };
      }

      // Password verification with constant-time comparison
      const isPasswordValid = await this.verifyPassword(
        credentials.password,
        user.passwordHash
      );

      if (!isPasswordValid) {
        return {
          success: false,
          error: {
            code: 'INVALID_CREDENTIALS',
            message: 'Invalid email or password',
            category: ErrorCategory.AUTHENTICATION,
            severity: 'medium',
            recoverable: false,
            timestamp: new Date()
          }
        };
      }

      // Generate secure session
      const securityContext = await this.createSecurityContext(user);
      const token = await this.generateSecureToken(securityContext);

      // Audit logging
      logger.info('User authenticated successfully', {
        userId: user.id,
        sessionId: securityContext.sessionId,
        ipAddress: securityContext.ipAddress,
        operation: 'authenticate'
      });

      return {
        success: true,
        data: {
          token,
          user: this.sanitizeUser(user),
          expiresIn: securityContext.expiresAt
        }
      };

    } catch (error) {
      logger.error('Authentication service error', error as Error, {
        operation: 'authenticate',
        email: this.sanitizeEmail(credentials.email)
      });

      return {
        success: false,
        error: {
          code: 'AUTHENTICATION_FAILED',
          message: 'Authentication service temporarily unavailable',
          category: ErrorCategory.SYSTEM,
          severity: 'high',
          recoverable: false,
          timestamp: new Date()
        }
      };
    }
  }

  private async verifyPassword(
    inputPassword: string,
    storedHash: string
  ): Promise<boolean> {
    // Use Argon2id for secure password hashing
    return await argon2.verify(storedHash, inputPassword);
  }

  private async createSecurityContext(user: User): Promise<SecurityContext> {
    return {
      userId: user.id,
      sessionId: this.generateSecureId(),
      permissions: user.permissions,
      roles: user.roles,
      expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000), // 24 hours
      ipAddress: this.getClientIP(),
      userAgent: this.getUserAgent()
    };
  }

  private sanitizeEmail(email: string): string {
    // Partially mask email for logging to prevent PII exposure
    const [username, domain] = email.split('@');
    const maskedUsername = username.slice(0, 2) + '*'.repeat(username.length - 2);
    return `${maskedUsername}@${domain}`;
  }

  private sanitizeUser(user: User): Partial<User> {
    const { passwordHash, ...sanitized } = user;
    return sanitized;
  }
}
```

**Authorization Middleware**:
```typescript
export class AuthorizationMiddleware {
  constructor(
    private authService: AuthenticationService,
    private auditLogger: AuditLogger
  ) {}

  requirePermission(permission: string) {
    return async (req: Request, res: Response, next: NextFunction) => {
      try {
        const token = this.extractToken(req);
        if (!token) {
          return res.status(401).json({
            error: 'Authentication required',
            code: 'MISSING_TOKEN'
          });
        }

        const securityContext = await this.authService.validateToken(token);
        if (!securityContext) {
          return res.status(401).json({
            error: 'Invalid or expired token',
            code: 'INVALID_TOKEN'
          });
        }

        // Check if token is expired
        if (securityContext.expiresAt < new Date()) {
          return res.status(401).json({
            error: 'Token expired',
            code: 'TOKEN_EXPIRED'
          });
        }

        // Check required permission
        if (!securityContext.permissions.includes(permission)) {
          this.auditLogger.logAccessDenied({
            userId: securityContext.userId,
            requiredPermission: permission,
            userPermissions: securityContext.permissions,
            endpoint: req.path,
            method: req.method
          });

          return res.status(403).json({
            error: 'Insufficient permissions',
            code: 'INSUFFICIENT_PERMISSIONS'
          });
        }

        // Attach security context to request
        req.securityContext = securityContext;
        next();

      } catch (error) {
        logger.error('Authorization middleware error', error as Error);
        return res.status(500).json({
          error: 'Authorization service error',
          code: 'AUTHORIZATION_ERROR'
        });
      }
    };
  }

  private extractToken(req: Request): string | null {
    const authHeader = req.headers.authorization;
    if (authHeader && authHeader.startsWith('Bearer ')) {
      return authHeader.substring(7);
    }
    return null;
  }
}
```

#### 11.3.3 Input Validation and Sanitization

**Comprehensive Input Validation**:
```typescript
// === Section 11.3: Input Validation Framework ===
// Context: Secure input validation and sanitization for droid applications
// Prerequisites: Understanding of injection attacks and validation patterns

export interface ValidationRule {
  field: string;
  required?: boolean;
  type: 'string' | 'number' | 'email' | 'url' | 'uuid' | 'date';
  minLength?: number;
  maxLength?: number;
  pattern?: RegExp;
  sanitize?: boolean;
  whitelist?: string[];
  blacklist?: string[];
}

export class InputValidator {
  private static readonly XSS_PATTERNS = [
    /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,
    /javascript:/gi,
    /on\w+\s*=/gi,
    /<iframe\b[^>]*>/gi,
    /<object\b[^>]*>/gi,
    /<embed\b[^>]*>/gi
  ];

  private static readonly SQL_INJECTION_PATTERNS = [
    /('|(\\')|(;)|(\-\-)|(\s+(or|and)\s+.*(=|like))/gi,
    /(union|select|insert|update|delete|drop|create|alter|exec|execute)/gi
  ];

  static validateInput(data: unknown, rules: ValidationRule[]): ValidationResult {
    const errors: ValidationError[] = [];
    const sanitizedData: Record<string, unknown> = {};

    if (typeof data !== 'object' || data === null) {
      return {
        isValid: false,
        errors: [{ field: 'root', message: 'Invalid input format' }],
        sanitizedData: null
      };
    }

    const input = data as Record<string, unknown>;

    for (const rule of rules) {
      const value = input[rule.field];
      
      // Required field validation
      if (rule.required && (value === undefined || value === null || value === '')) {
        errors.push({
          field: rule.field,
          message: `${rule.field} is required`
        });
        continue;
      }

      // Skip validation for optional fields that are not provided
      if (!rule.required && (value === undefined || value === null)) {
        continue;
      }

      // Type validation
      if (!this.validateType(value, rule.type)) {
        errors.push({
          field: rule.field,
          message: `${rule.field} must be of type ${rule.type}`
        });
        continue;
      }

      // Length validation for strings
      if (rule.type === 'string' && typeof value === 'string') {
        if (rule.minLength && value.length < rule.minLength) {
          errors.push({
            field: rule.field,
            message: `${rule.field} must be at least ${rule.minLength} characters long`
          });
        }

        if (rule.maxLength && value.length > rule.maxLength) {
          errors.push({
            field: rule.field,
            message: `${rule.field} must not exceed ${rule.maxLength} characters`
          });
        }
      }

      // Pattern validation
      if (rule.pattern && typeof value === 'string') {
        if (!rule.pattern.test(value)) {
          errors.push({
            field: rule.field,
            message: `${rule.field} format is invalid`
          });
        }
      }

      // Whitelist validation
      if (rule.whitelist && typeof value === 'string') {
        if (!rule.whitelist.includes(value)) {
          errors.push({
            field: rule.field,
            message: `${rule.field} contains invalid value`
          });
        }
      }

      // Blacklist validation
      if (rule.blacklist && typeof value === 'string') {
        if (rule.blacklist.some(pattern => pattern.test(value))) {
          errors.push({
            field: rule.field,
            message: `${rule.field} contains prohibited content`
          });
        }
      }

      // Sanitization
      let sanitizedValue = value;
      if (rule.sanitize && typeof value === 'string') {
        sanitizedValue = this.sanitizeString(value);
      }

      sanitizedData[rule.field] = sanitizedValue;
    }

    return {
      isValid: errors.length === 0,
      errors,
      sanitizedData: errors.length === 0 ? sanitizedData : null
    };
  }

  private static validateType(value: unknown, type: string): boolean {
    switch (type) {
      case 'string':
        return typeof value === 'string';
      case 'number':
        return typeof value === 'number' && !isNaN(value);
      case 'email':
        return typeof value === 'string' && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
      case 'url':
        return typeof value === 'string' && /^https?:\/\/.+/.test(value);
      case 'uuid':
        return typeof value === 'string' && /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value);
      case 'date':
        return typeof value === 'string' && !isNaN(Date.parse(value));
      default:
        return false;
    }
  }

  private static sanitizeString(input: string): string {
    let sanitized = input;

    // Remove XSS patterns
    for (const pattern of this.XSS_PATTERNS) {
      sanitized = sanitized.replace(pattern, '');
    }

    // Remove SQL injection patterns
    for (const pattern of this.SQL_INJECTION_PATTERNS) {
      sanitized = sanitized.replace(pattern, '');
    }

    // HTML entity encoding
    sanitized = sanitized
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#x27;')
      .replace(/\//g, '&#x2F;');

    return sanitized.trim();
  }
}

// Usage example
export const userValidationRules: ValidationRule[] = [
  {
    field: 'email',
    required: true,
    type: 'email',
    maxLength: 255,
    sanitize: true
  },
  {
    field: 'password',
    required: true,
    type: 'string',
    minLength: 8,
    maxLength: 128,
    pattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/
  },
  {
    field: 'username',
    required: true,
    type: 'string',
    minLength: 3,
    maxLength: 50,
    pattern: /^[a-zA-Z0-9_-]+$/,
    sanitize: true
  }
];
```

#### 11.3.4 Secret Management

**Secure Secret Handling**:
```typescript
// === Section 11.3: Secure Secret Management ===
// Context: Implementation of secure secret management for droid applications
// Prerequisites: Understanding of encryption and secure storage practices

export interface SecretMetadata {
  name: string;
  version: number;
  createdAt: Date;
  updatedAt: Date;
  expiresAt?: Date;
  rotationRequired: boolean;
  lastRotatedAt?: Date;
}

export class SecretManager {
  constructor(
    private encryptionKey: string,
    private keyRotationInterval: number = 30 * 24 * 60 * 60 * 1000 // 30 days
  ) {}

  async encryptSecret(secret: string): Promise<EncryptedSecret> {
    const iv = crypto.randomBytes(16);
    const cipher = crypto.createCipher('aes-256-gcm', this.encryptionKey);
    
    let encrypted = cipher.update(secret, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    
    const authTag = cipher.getAuthTag();
    
    return {
      encrypted,
      iv: iv.toString('hex'),
      authTag: authTag.toString('hex'),
      algorithm: 'aes-256-gcm'
    };
  }

  async decryptSecret(encryptedSecret: EncryptedSecret): Promise<string> {
    const decipher = crypto.createDecipher(
      encryptedSecret.algorithm,
      this.encryptionKey
    );
    
    decipher.setAuthTag(Buffer.from(encryptedSecret.authTag, 'hex'));
    
    let decrypted = decipher.update(encryptedSecret.encrypted, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    
    return decrypted;
  }

  async rotateSecret(secretName: string, newSecret: string): Promise<void> {
    const metadata = await this.getSecretMetadata(secretName);
    const encryptedSecret = await this.encryptSecret(newSecret);
    
    // Store encrypted secret with new version
    await this.storeSecret(secretName, {
      ...encryptedSecret,
      version: metadata.version + 1,
      createdAt: new Date(),
      updatedAt: new Date(),
      lastRotatedAt: new Date(),
      rotationRequired: false
    });

    // Audit logging
    logger.info('Secret rotated successfully', {
      secretName,
      newVersion: metadata.version + 1,
      operation: 'rotateSecret'
    });
  }

  async checkRotationRequirements(): Promise<string[]> {
    const secrets = await this.getAllSecrets();
    const rotationRequired: string[] = [];

    for (const [name, metadata] of Object.entries(secrets)) {
      const timeSinceRotation = Date.now() - metadata.lastRotatedAt.getTime();
      
      if (timeSinceRotation > this.keyRotationInterval || metadata.rotationRequired) {
        rotationRequired.push(name);
      }
    }

    return rotationRequired;
  }

  // Environment variable handling
  static getSecureEnvironmentVariable(name: string): string | null {
    const value = process.env[name];
    
    if (!value) {
      logger.warn(`Environment variable ${name} is not set`, {
        operation: 'getSecureEnvironmentVariable'
      });
      return null;
    }

    // Validate that the value doesn't look like it was accidentally committed
    if (this.looksLikeDevelopmentSecret(value)) {
      logger.error(`Development secret detected in production: ${name}`, {
        operation: 'getSecureEnvironmentVariable',
        severity: 'high'
      });
      throw new Error(`Invalid environment variable: ${name}`);
    }

    return value;
  }

  private static looksLikeDevelopmentSecret(value: string): boolean {
    const developmentPatterns = [
      /dev/i,
      /test/i,
      /example/i,
      /sample/i,
      /fake/i,
      /dummy/i,
      /changeme/i,
      /password/i,
      /secret/i
    ];

    return developmentPatterns.some(pattern => pattern.test(value));
  }
}

// Secure configuration management
export class SecureConfig {
  private static instance: SecureConfig;
  private secrets: Map<string, string> = new Map();

  private constructor(private secretManager: SecretManager) {}

  static getInstance(): SecureConfig {
    if (!SecureConfig.instance) {
      const encryptionKey = SecretManager.getSecureEnvironmentVariable('ENCRYPTION_KEY');
      if (!encryptionKey) {
        throw new Error('ENCRYPTION_KEY environment variable is required');
      }
      
      SecureConfig.instance = new SecureConfig(
        new SecretManager(encryptionKey)
      );
    }
    return SecureConfig.instance;
  }

  async getSecret(name: string): Promise<string | null> {
    if (this.secrets.has(name)) {
      return this.secrets.get(name)!;
    }

    const encryptedSecret = await this.secretManager.getSecret(name);
    if (!encryptedSecret) {
      return null;
    }

    const secret = await this.secretManager.decryptSecret(encryptedSecret);
    this.secrets.set(name, secret);
    
    return secret;
  }

  async reloadSecret(name: string): Promise<void> {
    this.secrets.delete(name);
    await this.getSecret(name);
  }

  async reloadAllSecrets(): Promise<void> {
    this.secrets.clear();
    // Preload commonly used secrets
    await Promise.all([
      this.getSecret('database_url'),
      this.getSecret('jwt_secret'),
      this.getSecret('api_key')
    ]);
  }
}
```

#### 11.3.5 Security Monitoring and Auditing

**Security Event Monitoring**:
```typescript
// === Section 11.3: Security Monitoring Framework ===
// Context: Implementation of security monitoring and audit logging
// Prerequisites: Understanding of security events and monitoring patterns

export interface SecurityEvent {
  id: string;
  type: SecurityEventType;
  severity: SecuritySeverity;
  userId?: string;
  ipAddress: string;
  userAgent: string;
  timestamp: Date;
  details: Record<string, unknown>;
  riskScore: number;
}

export enum SecurityEventType {
  LOGIN_SUCCESS = 'login_success',
  LOGIN_FAILURE = 'login_failure',
  PASSWORD_CHANGE = 'password_change',
  PERMISSION_DENIED = 'permission_denied',
  DATA_ACCESS = 'data_access',
  SUSPICIOUS_ACTIVITY = 'suspicious_activity',
  SECURITY_VIOLATION = 'security_violation'
}

export enum SecuritySeverity {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

export class SecurityMonitor {
  private eventQueue: SecurityEvent[] = [];
  private processingInterval: NodeJS.Timeout;

  constructor(
    private alertService: AlertService,
    private analyticsService: AnalyticsService
  ) {
    this.processingInterval = setInterval(
      () => this.processEvents(),
      5000 // Process every 5 seconds
    );
  }

  logSecurityEvent(event: Omit<SecurityEvent, 'id' | 'timestamp' | 'riskScore'>): void {
    const securityEvent: SecurityEvent = {
      ...event,
      id: this.generateEventId(),
      timestamp: new Date(),
      riskScore: this.calculateRiskScore(event)
    };

    this.eventQueue.push(securityEvent);

    // Immediate processing for critical events
    if (event.severity === SecuritySeverity.CRITICAL) {
      this.processEvent(securityEvent);
    }
  }

  private calculateRiskScore(event: Omit<SecurityEvent, 'id' | 'timestamp' | 'riskScore'>): number {
    let score = 0;

    // Base score by severity
    switch (event.severity) {
      case SecuritySeverity.LOW:
        score += 10;
        break;
      case SecuritySeverity.MEDIUM:
        score += 30;
        break;
      case SecuritySeverity.HIGH:
        score += 60;
        break;
      case SecuritySeverity.CRITICAL:
        score += 90;
        break;
    }

    // Event type scoring
    switch (event.type) {
      case SecurityEventType.LOGIN_FAILURE:
        score += 20;
        break;
      case SecurityEventType.PERMISSION_DENIED:
        score += 40;
        break;
      case SecurityEventType.SUSPICIOUS_ACTIVITY:
        score += 50;
        break;
      case SecurityEventType.SECURITY_VIOLATION:
        score += 80;
        break;
    }

    // Location-based scoring (if implemented)
    if (this.isSuspiciousLocation(event.ipAddress)) {
      score += 25;
    }

    return Math.min(score, 100);
  }

  private async processEvents(): Promise<void> {
    if (this.eventQueue.length === 0) return;

    const events = [...this.eventQueue];
    this.eventQueue = [];

    for (const event of events) {
      await this.processEvent(event);
    }
  }

  private async processEvent(event: SecurityEvent): Promise<void> {
    // Store event in database
    await this.storeSecurityEvent(event);

    // Check for alert conditions
    if (event.riskScore >= 70) {
      await this.alertService.sendSecurityAlert({
        type: 'security_incident',
        severity: event.severity,
        message: `High-risk security event detected: ${event.type}`,
        details: event
      });
    }

    // Update analytics
    await this.analyticsService.recordSecurityEvent(event);

    // Check for patterns that might indicate attacks
    await this.detectAttackPatterns(event);
  }

  private async detectAttackPatterns(event: SecurityEvent): Promise<void> {
    const recentEvents = await this.getRecentEvents(
      event.ipAddress,
      60 * 60 * 1000 // Last hour
    );

    // Detect brute force attacks
    const failedLogins = recentEvents.filter(
      e => e.type === SecurityEventType.LOGIN_FAILURE
    ).length;

    if (failedLogins >= 5) {
      await this.alertService.sendSecurityAlert({
        type: 'brute_force_attack',
        severity: SecuritySeverity.HIGH,
        message: `Potential brute force attack from ${event.ipAddress}`,
        details: {
          ipAddress: event.ipAddress,
          failedAttempts: failedLogins,
          timeWindow: '1 hour'
        }
      });
    }

    // Detect suspicious activity patterns
    const suspiciousEvents = recentEvents.filter(
      e => e.type === SecurityEventType.SUSPICIOUS_ACTIVITY ||
           e.type === SecurityEventType.PERMISSION_DENIED
    ).length;

    if (suspiciousEvents >= 3) {
      await this.alertService.sendSecurityAlert({
        type: 'suspicious_activity_pattern',
        severity: SecuritySeverity.MEDIUM,
        message: `Suspicious activity pattern detected from ${event.ipAddress}`,
        details: {
          ipAddress: event.ipAddress,
          suspiciousEvents,
          timeWindow: '1 hour'
        }
      });
    }
  }

  private isSuspiciousLocation(ipAddress: string): boolean {
    // Implement IP geolocation and reputation checking
    // This would integrate with services like MaxMind, AbuseIPDB, etc.
    return false; // Placeholder implementation
  }

  private generateEventId(): string {
    return `sec_${Date.now()}_${crypto.randomBytes(8).toString('hex')}`;
  }

  async getSecurityReport(timeRange: { start: Date; end: Date }): Promise<SecurityReport> {
    const events = await this.getEventsByTimeRange(timeRange);
    
    return {
      totalEvents: events.length,
      eventsByType: this.groupEventsByType(events),
      eventsBySeverity: this.groupEventsBySeverity(events),
      highRiskEvents: events.filter(e => e.riskScore >= 70),
      topRiskIPs: this.getTopRiskIPAddresses(events),
      timeRange
    };
  }
}

// Global security monitor instance
export const securityMonitor = new SecurityMonitor(
  new AlertService(),
  new AnalyticsService()
);
```

#### 11.3.6 Security Validation Checklist

**Before deploying, verify**:
- [ ] **Authentication**: All endpoints require proper authentication
- [ ] **Authorization**: Role-based access control is implemented
- [ ] **Input Validation**: All user inputs are validated and sanitized
- [ ] **Secret Management**: Secrets are encrypted and properly rotated
- [ ] **HTTPS**: All communications use TLS encryption
- [ ] **Security Headers**: Security headers are properly configured
- [ ] **Rate Limiting**: Rate limiting is implemented on sensitive endpoints
- [ ] **Audit Logging**: Security events are logged and monitored
- [ ] **Error Handling**: Error messages don't leak sensitive information
- [ ] **Dependencies**: All dependencies are regularly scanned for vulnerabilities
- [ ] **Data Encryption**: Sensitive data is encrypted at rest and in transit
- [ ] **Session Management**: Sessions are properly managed and secured

#### 11.3.7 Common Security Issues & Solutions

- **Issue**: SQL Injection vulnerabilities
  - **Solution**: Use parameterized queries and input validation
- **Issue**: Cross-Site Scripting (XSS) attacks
  - **Solution**: Implement content security policy and input sanitization
- **Issue**: Insecure direct object references
  - **Solution**: Implement proper authorization checks
- **Issue**: Insufficient authentication mechanisms
  - **Solution**: Use strong password policies and multi-factor authentication
- **Issue**: Hardcoded secrets in code
  - **Solution**: Use environment variables and secret management services

#### 11.3.8 Related Sections
- Section 5.3: Error handling with security considerations
- Section 6.1: Security testing patterns
- Section 10.4: Security monitoring and observability
- Section 7.1: Security in project management workflows

#### 11.3.9 Droid Delegation Notes
- **Recommended Droid**: security-audit-droid-forge
- **Task Complexity**: High
- **Estimated Time**: 4-5 hours for comprehensive security implementation
- **Prerequisites**: Understanding of security principles, cryptography, and secure development practices

---

## 12. Troubleshooting & FAQ

### 12.1 Common Issues

*This section will be expanded with common problems and solutions*

### 12.2 Debugging Strategies

*This section will include debugging approaches for droids*

### 12.3 Performance Optimization

*This section will cover performance tuning guidelines*

---

## 13. Mandatory Rules

### 13.1 Core Development Workflow

**Problem definition → small, safe change → change review → refactor — repeat the loop.**

### 13.2 Essential Rules

- **Read thoroughly**: Before changing anything, read the relevant files end to end, including all call/reference paths
- **Keep tasks small**: Keep commits and PRs focused and manageable
- **Document assumptions**: If you make assumptions, record them in the Issue/PR/ADR
- **Security first**: Never commit or log secrets; validate inputs and encode/normalize outputs
- **Clear naming**: Avoid premature abstraction and use intention-revealing names
- **Compare options**: Always evaluate multiple approaches before deciding

## 14. Mindset and Approach

### 14.1 Senior Engineer Thinking

- **Think systematically**: Don't jump to conclusions or rush to solutions
- **Evaluate approaches**: Always analyze multiple options with pros/cons/risks, then choose the simplest solution
- **Context matters**: Understand the broader system impact before making changes

### 14.2 Workflow Pattern

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Problem      │───▶│  Small Change   │───▶│  Change Review  │───▶│   Refactor     │
│  Definition    │    │                 │    │                 │    │   Loop         │
│                 │    │ • Targeted      │    │ • Validate     │    │   Repeat       │
│ • Context      │    │ • Minimal       │    │ • Impact       │    │   Process      │
│ • Problem      │    │ • Safe          │    │ • Verify       │    │   Continuously  │
│ • Goal         │    │ • Reversible    │    │ • Document     │    │   Improve      │
│ • Constraints   │    │                 │    │                 │    │   Quality      │
└─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 15. Code & File Reference Rules

### 15.1 Reading Requirements

- **Read thoroughly**: Read files from start to finish (no partial reads)
- **Locate dependencies**: Before changing code, find definitions, references, call sites, related tests, docs/config/flags
- **Full context**: Never change code without reading the entire file
- **Global search**: Before modifying a symbol, search globally to understand pre/postconditions
- **Impact notes**: Leave 1-3 line impact notes explaining changes

### 15.2 Reference Checklist

Before modifying any symbol:
- [ ] Read entire file containing the symbol
- [ ] Search for all references in the codebase
- [ ] Understand preconditions and postconditions
- [ ] Identify all dependent code
- [ ] Document the impact of the change

## 16. Required Coding Rules

### 16.1 Pre-Development Requirements

- **Problem 1-Pager**: Before coding, write Context/Problem/Goal/Non-Goals/Constraints
- **Code limits**: 
  - File ≤ 300 LOC
  - Function ≤ 50 LOC  
  - Parameters ≤ 5
  - Cyclomatic complexity ≤ 10
- **Refactor when exceeded**: Split/refactor if limits are exceeded

### 16.2 Code Quality Standards

- **Explicit code**: No hidden "magic"
- **DRY principle**: Follow DRY but avoid premature abstraction
- **Side effects**: Isolate side effects (I/O, network, global state) at boundary layer
- **Error handling**: Catch specific exceptions and present clear user-facing messages
- **Logging**: Use structured logging, never log sensitive data, propagate request/correlation IDs
- **Time zones**: Account for time zones and DST when handling dates

## 17. Testing Rules

### 17.1 Testing Requirements

- **New code requires tests**: All new code must include tests
- **Regression tests**: Bug fixes must include regression tests (write to fail first)
- **Deterministic tests**: Tests must be deterministic and independent
- **Mock external systems**: Replace external systems with fakes/contract tests
- **Coverage**: Include ≥1 happy path and ≥1 failure path in e2e tests
- **Concurrency**: Proactively assess risks from concurrency/locks/retries

### 17.2 Testing Patterns

```typescript
// Example: Test structure
describe('UserService', () => {
  // Happy path test
  it('should create user with valid data', async () => {
    const userData = { email: 'test@example.com', name: 'Test User' };
    const user = await userService.createUser(userData.email, userData.name);
    expect(user).toBeDefined();
    expect(user.email).toBe(userData.email);
  });

  // Failure path test
  it('should throw error for invalid email', async () => {
    const userData = { email: 'invalid-email', name: 'Test User' };
    await expect(userService.createUser(userData.email, userData.name))
      .rejects.toThrow('Invalid email format');
  });
});
```

## 18. Security Rules

### 18.1 Security Principles

- **No secrets**: Never leave secrets in code/logs/tickets
- **Input validation**: Always validate, normalize, and encode inputs
- **Parameterized operations**: Use parameterized operations for database queries
- **Least privilege**: Apply the Principle of Least Privilege

### 18.2 Security Patterns

```typescript
// Input validation example
export function validateUserInput(input: unknown): ValidationResult {
  const schema = z.object({
    email: z.string().email(),
    name: z.string().min(1).max(100)
  });
  
  return schema.safeParse(input);
}

// Parameterized query example
export async function findUserById(id: string): Promise<User | null> {
  const query = 'SELECT * FROM users WHERE id = $1';
  return await db.query(query, [id]);
}
```

## 19. Clean Code Rules

### 19.1 Code Structure

- **Intention-revealing names**: Use clear, descriptive names
- **Single responsibility**: Each function should do one thing
- **Side effects at boundary**: Keep side effects at the boundary layer
- **Guard clauses first**: Prefer guard clauses over nested conditions
- **Constants**: Symbolize constants (no hardcoding)
- **Input → Process → Return**: Structure code as Input → Process → Return

### 19.2 Code Patterns

```typescript
// Good: Early returns and guard clauses
function processUser(user: User | null): ProcessedUser | null {
  if (!user) return null;
  if (!user.isActive) return null;
  if (!hasPermission(user)) return null;
  
  return transformUser(user);
}

// Good: Constants with clear names
const MAX_RETRY_ATTEMPTS = 3;
const DEFAULT_TIMEOUT_MS = 5000;
const API_BASE_URL = 'https://api.example.com';
```

### 19.3 Error Reporting

- **Specific errors**: Report failures with specific error messages
- **Usage examples**: Make tests serve as usage examples with boundary and failure cases

## 20. Anti-Pattern Rules

### 20.1 What to Avoid

- **No context changes**: Don't modify code without reading the whole context
- **No secrets**: Don't expose secrets in any form
- **No ignored failures**: Don't ignore failures or warnings
- **No unjustified optimization**: Don't optimize without clear performance evidence
- **No unnecessary abstraction**: Don't introduce abstractions without clear need
- **No broad exceptions**: Don't overuse broad exception types

### 20.2 Common Anti-Patterns

```typescript
// AVOID: Uninitialized variables
let user: User | undefined;
if (condition) {
  user = fetchUser();
}

// PREFER: IIFE with type annotation
const user: User | null = (() => {
  if (!condition) return null;
  return fetchUser();
})();

// AVOID: Multiple nested ifs
if (condition1) {
  if (condition2) {
    if (condition3) {
      doSomething();
    }
  }
}

// PREFER: Guard clauses
if (!condition1 || !condition2 || !condition3) return;
doSomething();
```

## 21. TypeScript Specific Rules

### 21.1 Import and Export Rules

- **Normal imports**: Always use normal imports instead of dynamic imports
- **No require**: Always use ESM imports, never CommonJS require
- **Absolute imports**: Prefer non-relative imports with package names
- **Explicit array types**: Always specify types for arrays

```typescript
// Good: Normal imports
import React from 'react';
import { useState } from 'react';
import fs from 'node:fs';

// Good: Explicit array types
const items: string[] = [];
const users: User[] = [];
const numbers: number[] = [];

// Good: Object arguments for multiple parameters
function createUser({ email, name, role }: {
  email: string;
  name: string;
  role: string;
}): User {
  // implementation
}
```

### 21.2 Function and Variable Rules

- **Arrow functions**: Always use {} block body in arrow functions
- **No any**: Never use `any` type, always find proper types
- **IIFE over late assignment**: Use IIFE instead of uninitialized variables
- **URL construction**: Use `new URL(path, baseUrl)` instead of string interpolation

```typescript
// Good: Arrow function with block body
const handleClick = () => {
  setState('value');
  doSomethingElse();
};

// Good: IIFE pattern
const result: string = (() => {
  if (!condition) return '';
  return processValue();
})();

// Good: URL construction
const url = new URL('/api/users', 'https://api.example.com');
```

### 21.3 Type Safety Rules

- **Read .d.ts files**: When encountering TypeScript errors, read the type definitions
- **No as any**: Never use `(x as any).field` without checking if it compiles first
- **Prefer || over in**: Use `obj?.x || ''` instead of `'x' in obj ? obj.x : ''`

## 22. Prisma Specific Rules

### 22.1 Database Interaction

- **Read schema first**: Always read schema.prisma before writing queries
- **No schema changes**: Never add tables or modify schema.prisma yourself
- **No mutations**: NEVER run `pnpm prisma db push` or other mutating commands
- **Upsert preferred**: Use upsert calls over updates to handle missing rows

### 22.2 Query Patterns

```typescript
// Good: Simple query with authorization
const user = await prisma.user.findFirst({
  where: { 
    id: userId,
    organization: { users: { some: { userId } } }
  }
});

if (!user) {
  throw new AppError('User not found or access denied');
}

// Good: Parallel queries for relations
const [user, posts] = await Promise.all([
  prisma.user.findUnique({ where: { id: userId } }),
  prisma.post.findMany({ where: { userId } })
]);

// AVOID: Deep nesting
const badQuery = prisma.user.findFirst({
  where: { id: userId },
  include: {
    posts: {
      include: {
        comments: {
          include: {
            author: true // Too deep!
          }
        }
      }
    }
  }
});
```

### 22.3 Transaction Rules

- **Array transactions**: Use array of operations, not interactive transactions
- **No await during construction**: Never call await while building operations array

```typescript
// Good: Array transaction
const operations: Prisma.PrismaPromise<any>[] = [
  prisma.user.delete({ where: { id } }),
  prisma.profile.delete({ where: { userId: id } }),
  prisma.settings.delete({ where: { userId: id } })
];

await prisma.$transaction(operations);
```

## 23. Styling Rules

### 23.1 Tailwind Guidelines

- **Use multiples of 4**: Prefer spacing multiples of 4 (p-4, gap-4, etc.)
- **Flex over margin**: Use flexbox gaps and grid gaps instead of margins
- **shadcn colors**: Use shadcn theme colors instead of default Tailwind colors
- **Simple styles**: Keep styles simple and use flex and gap

```typescript
// Good: Flex with gap
<div className="flex flex-col gap-4">
  <Component1 />
  <Component2 />
</div>

// Good: Size-4 over w-4 h-4
<Icon className="size-4" />

// Good: cn utility
<div className={cn('base-class', isActive && 'active-class')} />
```

### 23.2 Component Guidelines

- **shadcn CLI**: Use shadcn CLI to add new components, don't write them manually
- **Reuse components**: Prefer reusing existing components when possible
- **Simple breakpoints**: Keep breakpoints and responsive design simple

## 24. Error Handling Rules

### 24.1 Error Patterns

- **AppError class**: Use AppError for expected errors
- **ResponseError**: Use ResponseError for HTTP error responses

```typescript
// Expected error
if (!user.subscription) {
  throw new AppError('User has no subscription');
}

// HTTP error response
if (!hasPermission) {
  throw new ResponseError(
    403,
    JSON.stringify({ message: 'Access denied' })
  );
}
```

## 25. Changelog Rules

### 25.1 Package Types

- **Public packages**: Have version field in package.json, published to npm
- **Private packages**: Have `private: true` field in package.json

### 25.2 Changelog Format

**Public packages**:
```markdown
## 0.1.3

### Patch Changes
- fix authentication bug
- improve error messages

## 0.1.2

### Patch Changes
- add support for new feature
```

**Private packages**:
```markdown
# Changelog

## 2025-01-24 19:50
- improve user experience
- fix startup crash
```

### 25.3 Writing Guidelines

- **Present tense**: Use present tense (fix, improve, add)
- **Concise**: Omit unnecessary verbs (implement, added)
- **No nesting**: Don't use nested bullet points
- **Code examples**: Include code snippets when applicable
- **Markdown**: Use proper markdown formatting

---

## Appendix

### A. Section Template Structure

**Standard Section Template for agents.md Guide**:

```markdown
## [Section Number]. [Section Title]

### [Section Number].[Subsection] [Subsection Title]

**Context**: Brief description of the subsection purpose and relevance to droids.

**Key Concepts**:
- • [Concept 1]: Clear definition and explanation
- • [Concept 2]: Practical application examples
- • [Concept 3]: Common pitfalls and how to avoid them

**Implementation Guidelines**:
1. **Step 1**: [Actionable instruction with clear deliverable]
2. **Step 2**: [Specific technique or pattern to apply]
3. **Step 3**: [Validation criteria or quality check]
4. **Step 4**: [Integration with other sections/components]

**Code Example**:
```typescript
// [Brief description of what this code demonstrates]
const [variableName] = [implementation];
// Add inline comments for key decisions
```

**ASCII Diagram** (if applicable):
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Step 1    │───▶│   Step 2    │───▶│   Step 3    │
│             │    │             │    │             │
│ • Action    │    │ • Process   │    │ • Validate  │
│ • Input     │    │ • Transform │    │ • Output    │
└─────────────┘    └─────────────┘    └─────────────┘
```

**Validation Checklist**:
- [ ] [Specific, measurable validation criteria]
- [ ] [Quality standard or best practice check]
- [ ] [Integration requirement verification]
- [ ] [Documentation or comment requirement]

**Common Issues & Solutions**:
- **Issue**: [Description of common problem]
  - **Solution**: [Step-by-step resolution approach]
- **Issue**: [Another frequent challenge]
  - **Solution**: [Prevention and fix strategies]

**Related Sections**:
- [Section X.Y]: [Cross-reference with brief description]
- [Section A.B]: [Related topic or prerequisite]

**Droid Delegation Notes**:
- **Recommended Droid**: [Which specialized droid should handle this]
- **Task Complexity**: [Simple/Medium/Complex]
- **Estimated Time**: [Relative time estimate]
- **Prerequisites**: [Required knowledge or dependencies]
```

### B. Reusable Content Blocks

#### B.1 Code Example Template
```typescript
// === [Section Title]: [Brief Description] ===
// Context: [When and why to use this pattern]
// Prerequisites: [What needs to be set up first]

interface [InterfaceName] {
  [property]: [type]; // [Purpose]
  [method](): [returnType]; // [Behavior]
}

export const [functionName] = async (
  [param]: [paramType]
): Promise<[returnType]> => {
  // Implementation follows established patterns
  const [result] = await [operation];
  return [processedResult];
};

// Usage Example:
// const [instance] = await [functionName]([value]);
```

#### B.2 ASCII Diagram Templates

**Process Flow**:
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   [Step 1]  │───▶│   [Step 2]  │───▶│   [Step 3]  │
│             │    │             │    │             │
│ • Action    │    │ • Process   │    │ • Validate  │
│ • Input     │    │ • Transform │    │ • Output    │
└─────────────┘    └─────────────┘    └─────────────┘
```

**Component Hierarchy**:
```
[Parent Component]
├── [Child Component A]
│   ├── [Sub-component A1]
│   └── [Sub-component A2]
└── [Child Component B]
    ├── [Sub-component B1]
    └── [Sub-component B2]
```

**Data Flow**:
```
[Input] → [Validation] → [Processing] → [Storage] → [Output]
    ↓           ↓            ↓           ↓           ↓
[Error] ← [Sanitization] ← [Business Logic] ← [Query] ← [Request]
```

#### B.3 Checklist Templates

**Quality Checklist**:
- [ ] **Code Quality**: Follows TypeScript standards and conventions
- [ ] **Testing**: Includes unit, integration, and E2E tests
- [ ] **Documentation**: Clear comments and README updates
- [ ] **Security**: Input validation and error handling
- [ ] **Performance**: Optimized for speed and memory usage
- [ ] **Accessibility**: WCAG compliant and keyboard navigable

**Deployment Checklist**:
- [ ] **Environment**: All environment variables configured
- [ ] **Dependencies**: Required packages installed and versions locked
- [ ] **Database**: Migrations applied and data seeded
- [ ] **Testing**: All tests passing in target environment
- [ ] **Monitoring**: Logging and alerting configured
- [ ] **Security**: SSL certificates and security headers set

### C. Modular Content Organization Guidelines

#### C.1 Content Depth Levels

**Level 1 (Overview) - 1-2 pages**:
- Purpose and key concepts
- Quick start examples
- Essential validation checklist
- Cross-references to detailed sections

**Level 2 (Detailed) - 3-5 pages**:
- Comprehensive implementation guidelines
- Multiple code examples
- Detailed validation criteria
- Common issues and solutions

**Level 3 (Comprehensive) - 6+ pages**:
- Complete reference documentation
- Advanced patterns and techniques
- Performance optimization strategies
- Integration examples with other systems

#### C.2 Content Maintenance Rules

**Update Frequency**:
- **Level 1**: Review quarterly, update as needed
- **Level 2**: Review monthly, update with technology changes
- **Level 3**: Review weekly, update with best practice evolution

**Change Management**:
1. **Identify Need**: Based on technology updates, user feedback, or new patterns
2. **Create ADR**: Document significant changes with Architecture Decision Record
3. **Update Content**: Apply changes following established templates
4. **Validate**: Ensure all cross-references and examples remain accurate
5. **Version Control**: Commit with clear description of changes

#### C.3 Droid Content Creation Workflow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Research   │───▶│  Analysis   │───▶│ Definition  │───▶│  Creation   │
│             │    │             │    │             │    │             │
│ • Gather    │    │ • Identify  │    │ • Define    │    │ • Apply     │
│   context   │    │   patterns  │    │   structure │    │   template  │
│ • Review    │    │ • Analyze   │    │ • Plan      │    │ • Create    │
│   existing  │    │   gaps      │    │   content  │    │   content  │
│   content   │    │ • Prioritize│    │ • Validate  │    │ • Validate  │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

### D. Architecture Decision Records (ADRs)

The ADR process is documented in **Section 1.3** (Guiding Principles). Key points:

**When to Create ADRs**:
- Deviating from established patterns with clear justification
- Technology stack changes affecting multiple components  
- Breaking changes to APIs or interfaces
- Major architectural alternatives
- Security or performance decisions with architectural impact

**ADR Process**:
1. Create from template at `docs/adr/template.md`
2. Document context, decision, and consequences
3. Peer review by droid or human
4. Store in `docs/adr/` with sequential numbering
5. Reference in code comments and documentation

**ADR Template Location**: `/docs/adr/template.md`  
**Storage Directory**: `/docs/adr/`  
**Naming Convention**: `ADR-[Number]-[short-title].md`

### E. Quality Checklist

*This section will provide validation checklists for droids*

### F. Glossary

*This section will define key terms and concepts*

---

**Note**: This is the MVG (Minimum Viable Guide) version. Additional sections and detailed content will be added iteratively based on the comprehensive task breakdown in the project task list.
