// === Section 5.1: Component Interface Definition ===
// Context: Standard pattern for component props in React/Next.js
// Prerequisites: Understanding of React props and TypeScript interfaces

import React, { useState } from 'react';

interface ComponentProps {
  id: string; // Unique identifier for the component
  title: string; // Display title for the component
  isActive?: boolean; // Optional flag for active state
  onSubmit?: (data: FormData) => Promise<void>; // Optional submit handler
  children?: React.ReactNode; // Optional child elements
}

export const MyComponent: React.FC<ComponentProps> = ({
  id,
  title,
  isActive = false,
  onSubmit,
  children,
}) => {
  // Component implementation follows established patterns
  const [loading, setLoading] = useState(false);
  
  const handleSubmit = async (data: FormData) => {
    if (!onSubmit) return;
    
    setLoading(true);
    try {
      await onSubmit(data);
    } catch (error) {
      // Error handling follows Section 5.3 patterns
      console.error('Submit failed:', error);
    } finally {
      setLoading(false);
    }
  };
  
  return (
    <div className={`component ${isActive ? 'active' : ''}`}>
      <h2>{title}</h2>
      {children}
    </div>
  );
};

// Usage Example:
// <MyComponent id="123" title="My Title" onSubmit={handleSubmit} />
