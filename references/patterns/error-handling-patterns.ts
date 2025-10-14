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
