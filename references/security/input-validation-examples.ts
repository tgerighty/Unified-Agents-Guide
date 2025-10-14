// === Section 7: Security Examples ===
// Context: Security patterns for input validation and database operations
// Prerequisites: Understanding of Zod validation and secure coding practices

import { z } from 'zod';

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
