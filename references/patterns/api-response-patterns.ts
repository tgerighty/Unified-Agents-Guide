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
