# Naming Conventions for Factory.ai Droids

## File Naming Rules
- **Components**: `PascalCase.tsx` (UserProfile.tsx, ProductCard.tsx)
- **Hooks**: `use-kebab-case.ts` (use-mobile.ts, use-toast.ts)
- **Utilities**: `lowercase.ts` (utils.ts, helpers.ts)
- **Types**: `lowercase.ts` (user.ts, product.ts)
- **Services**: `kebab-case.service.ts` (auth.service.ts, data.service.ts)
- **Constants**: `lowercase.ts` (constants.ts, config.ts)
- **Tests**: `filename.test.ts` (UserProfile.test.ts)
- **Stories**: `ComponentName.stories.tsx` (UserProfile.stories.tsx)

## Variable Naming Rules
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
