# Validation Checklist for TypeScript Components

## Code Quality
- [ ] All functions have explicit return types
- [ ] Interfaces are used over type aliases for object shapes
- [ ] No usage of `any` type without explicit justification
- [ ] Function parameters limited to ≤5 (use parameter objects if needed)
- [ ] Async functions use proper error handling patterns
- [ ] Generic types are properly constrained where applicable
- [ ] Utility types are used to reduce code duplication

## Testing Requirements
- [ ] New code includes comprehensive tests
- [ ] Bug fixes include regression tests
- [ ] Tests are deterministic and independent
- [ ] External systems are mocked/faked appropriately
- [ ] Coverage includes happy path and failure scenarios
- [ ] E2E tests cover critical user workflows

## Security Requirements
- [ ] Input validation is implemented
- [ ] No secrets are committed or logged
- [ ] Parameterized queries are used for database operations
- [ ] Principle of least privilege is applied
- [ ] Error messages don't expose sensitive information

## Code Organization
- [ ] File names follow naming conventions
- [ ] Directory structure matches project organization
- [ ] Component names are descriptive and follow PascalCase
- [ ] Hook names use `use` prefix and kebab-case file names
- [ ] Constants use UPPER_SNAKE_CASE
- [ ] Imports are organized following standard order
- [ ] Related files are co-located
