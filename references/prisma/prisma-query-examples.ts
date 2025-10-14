// === Section 11: Prisma Query Examples ===
// Context: Standard database query patterns with authorization and error handling
// Prerequisites: Understanding of Prisma ORM and database patterns

// Good: Simple query with authorization
const user = await prisma.user.findFirst({
  where: { 
    id: userId,
    organization: { users: { some: { userId } } }
  }
});

if (!user) {
  throw new AppError('User not found or access denied');
}

// Good: Parallel queries for relations
const [user, posts] = await Promise.all([
  prisma.user.findUnique({ where: { id: userId } }),
  prisma.post.findMany({ where: { userId } })
]);

// AVOID: Deep nesting
const badQuery = prisma.user.findFirst({
  where: { id: userId },
  include: {
    posts: {
      include: {
        comments: {
          include: {
            author: true // Too deep!
          }
        }
      }
    }
  }
});

// Good: Array transaction
const operations: Prisma.PrismaPromise<any>[] = [
  prisma.user.delete({ where: { id } }),
  prisma.profile.delete({ where: { userId: id } }),
  prisma.settings.delete({ where: { userId: id } })
];

await prisma.$transaction(operations);
