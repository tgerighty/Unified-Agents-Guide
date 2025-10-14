// === Section 10: TypeScript Type Examples ===
// Context: Examples of explicit typing and type-safe patterns
// Prerequisites: Understanding of TypeScript best practices

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
