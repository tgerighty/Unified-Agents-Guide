// === Section 12: shadcn/ui Styling Examples ===
// Context: Common styling patterns for shadcn/ui components
// Prerequisites: Understanding of Tailwind CSS and component styling

import { cn } from '@/lib/utils';

// Good: Flex with gap
<div className="flex flex-col gap-4">
  <Component1 />
  <Component2 />
</div>

// Good: Size-4 over w-4 h-4
<Icon className="size-4" />

// Good: cn utility
<div className={cn('base-class', isActive && 'active-class')} />
