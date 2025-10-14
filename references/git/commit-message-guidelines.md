# Git Commit Message Guidelines

## Format

**Standard Format:**
```
<type>(<scope>): <subject>

<body>

<footer>
```

## Type Values

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code formatting, missing semi colons, etc (no code change)
- **refactor**: Refactoring production code
- **test**: Adding tests, refactoring test
- **chore**: Updating build tasks, package manager configs, etc (no production code change)

## Scope

The scope should be the affected component or module. Examples:
- `feat(auth)`: Add OAuth2 integration
- `fix(user-service)`: Resolve user creation validation error
- `docs(readme)`: Update installation instructions

## Subject

- Use present tense ("add" not "added")
- Use imperative mood ("change" not "changes" or "changed")
- Don't capitalize first letter
- No period at end
- Keep under 50 characters

## Body

- Explain the what and why, not the how
- Reference any relevant issue numbers
- Use bullet points for multiple changes

Example:
```
Add user authentication with OAuth2

- Implement OAuth2 provider integration
- Add token management system
- Create user session handling

Closes #123
```

## Footer

- Reference issue numbers: `Closes #123`, `Fixes #456`
- Include co-author attribution when applicable:
```
Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>
```

## Examples

### Good Examples
```
feat(auth): add OAuth2 integration

Implement OAuth2 provider integration with support for Google and GitHub.
Includes token validation and session management.

Closes #123

Co-authored-by: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>
```

```
fix(user-service): resolve email validation error

Fix edge case where emails with special characters were incorrectly rejected.
Updated regex pattern to properly handle international characters.

Fixes #456
```

### Bad Examples
```
fix: fixed the bug
feat: added new stuff
docs: updated the documentation
```

## Branch Naming

Follow the established branching conventions:
- `feature/feature-name`
- `hotfix/issue-description`
- `refactor/component-name`

## PR Guidelines

- Link to relevant issues
- Include screenshots for UI changes
- Ensure all tests pass
- Get code review before merge
