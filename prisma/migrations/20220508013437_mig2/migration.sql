/*
  Warnings:

  - You are about to drop the column `tags` on the `Archived` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `Note` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `Trash` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Archived" DROP COLUMN "tags";

-- AlterTable
ALTER TABLE "Note" DROP COLUMN "tags";

-- AlterTable
ALTER TABLE "Trash" DROP COLUMN "tags";

-- CreateTable
CREATE TABLE "Tag" (
    "id" SERIAL NOT NULL,
    "tagName" TEXT NOT NULL,
    "noteId" INTEGER,
    "archivedId" INTEGER,
    "trashId" INTEGER,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_noteId_fkey" FOREIGN KEY ("noteId") REFERENCES "Note"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_archivedId_fkey" FOREIGN KEY ("archivedId") REFERENCES "Archived"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_trashId_fkey" FOREIGN KEY ("trashId") REFERENCES "Trash"("id") ON DELETE SET NULL ON UPDATE CASCADE;
