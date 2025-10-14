// === Section 8: Clean Code Anti-Pattern Examples ===
// Context: Examples of code patterns to avoid and their corrections
// Prerequisites: Understanding of TypeScript best practices

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
