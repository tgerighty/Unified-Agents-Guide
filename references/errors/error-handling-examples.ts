// === Section 13: Error Handling Examples ===
// Context: Standard error handling patterns for expected and HTTP errors
// Prerequisites: Understanding of error handling best practices

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
