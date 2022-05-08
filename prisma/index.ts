import { PrismaClient, Prisma } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  let includePosts: boolean = false
  let user: Prisma.UserCreateInput

  // Check if posts should be included in the query
  if (includePosts) {
    user = {
      username: 'Elsa Prisma',
      email: "ranjeet",
      password: "dfafsaa"
    }
  } else {
    user = {
      username: 'Elsa Prisma',
      password: "dfafsaa",
      email: "ranjeet"
    }
  }

  // Pass 'user' object into query
  const createUser = await prisma.user.create({ data: user })
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })