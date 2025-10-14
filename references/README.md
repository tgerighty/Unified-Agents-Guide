# References Library

This directory contains modular reference files for the Unified Agents Guide. These files are designed to be loaded on-demand by AI agents to provide detailed implementation examples, patterns, and templates without overwhelming the main document.

## Purpose

The references library serves as a "just-in-time" knowledge base that:
- **Reduces token usage** by keeping the main guide lightweight
- **Provides detailed examples** when specific patterns are needed
- **Maintains consistency** across all droid development
- **Enables modular updates** to individual patterns without affecting the core guide

## Directory Structure

```
references/
├── README.md                    # This file - meta guide to the reference system
├── code/                       # Complete code examples and implementations
│   ├── typescript-component-interface.ts
│   └── [additional code files...]
├── patterns/                    # Reusable patterns and guidelines
│   ├── error-handling-patterns.ts
│   ├── api-response-patterns.ts
│   └── naming-conventions.md
├── checklists/                  # Quality assurance and validation checklists
│   └── validation-checklist.md
├── templates/                   # Templates for common development tasks
│   ├── adr-template.md
│   └── project-structure.md
├── testing/                     # Testing patterns and examples (planned)
├── git/                         # Git workflow patterns (planned)
└── security/                    # Security guidelines and checklists (planned)
```

## How to Use This Library

### For AI Agents

1. **Start with the main guide** - Read the rules and principles in `agents-optimized.md`
2. **Identify the pattern needed** - Determine which specific implementation details are required
3. **Load reference files on-demand** - Use `read_file` to fetch specific examples only when needed
4. **Apply the pattern** - Use the reference as a template or guideline for your implementation

### For Human Developers

1. **Add new patterns** - When establishing new development patterns, create corresponding reference files
2. **Update existing patterns** - Keep reference files current with best practices
3. **Maintain consistency** - Ensure all reference files follow the established format and quality standards
4. **Link validation** - Periodically check that links in the main guide reference existing files

## File Naming Conventions

- **Code files**: `kebab-case.ts` - Use descriptive names that indicate the pattern
- **Pattern files**: `kebab-case.md` - Clear, searchable names for guidelines
- **Template files**: `template-name.md` - Indicate that these are templates
- **Checklist files**: `purpose-checklist.md` - Include "checklist" in the name

## Content Guidelines

### Code Files (`/code/`)
- Include complete, working examples
- Add clear comments explaining key decisions
- Include usage examples when applicable
- Follow all the coding rules from the main guide

### Pattern Files (`/patterns/`)
- Provide clear explanations of when and how to use the pattern
- Include pros/cons where relevant
- Link to related patterns or reference files
- Keep explanations concise but comprehensive

### Template Files (`/templates/`)
- Use clear placeholders with instructions
- Include step-by-step guidance
- Provide context for when to use the template
- Link to relevant patterns for implementation details

### Checklist Files (`/checklists/`)
- Use checkbox format for easy validation
- Group related checks together
- Include brief explanations for each check
- Link to detailed patterns where needed

## Contributing

When adding new reference files:

1. **Choose the right category** - Place files in the appropriate subdirectory
2. **Follow naming conventions** - Use established naming patterns
3. **Include descriptions** - Add clear descriptions and usage context
4. **Update the main guide** - Add links to new reference files in `agents-optimized.md`
5. **Test the links** - Ensure all links work correctly
6. **Document the purpose** - Update this README if new categories are added

## Maintenance

- **Regular reviews** - Periodically review reference files for accuracy and relevance
- **Link validation** - Check for broken links between the main guide and reference files
- **Version control** - Track changes to reference files with clear commit messages
- **Consistency checks** - Ensure all reference files follow established patterns and quality standards

## Future Enhancements

Planned additions to expand the reference library:

- **Testing patterns** (`/testing/`)
  - Unit test templates
  - Integration test patterns
  - Mocking strategies
  - E2E test examples

- **Git workflows** (`/git/`)
  - Commit message guidelines
  - Branch naming conventions
  - Pull request templates
  - Merge conflict resolution patterns

- **Security guidelines** (`/security/`)
  - Security review checklists
  - Input validation patterns
  - Secret management examples
  - Common vulnerability prevention

This modular approach ensures that the reference library grows with the project while maintaining its core purpose of providing efficient, on-demand access to detailed implementation guidance.
