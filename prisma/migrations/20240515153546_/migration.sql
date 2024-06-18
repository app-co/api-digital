/*
  Warnings:

  - You are about to drop the column `type_user` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "type_user";

-- AlterTable
ALTER TABLE "grupo" ADD COLUMN     "userId" TEXT;

-- AlterTable
ALTER TABLE "phones" ALTER COLUMN "codigo" SET DEFAULT +55;

-- AddForeignKey
ALTER TABLE "grupo" ADD CONSTRAINT "grupo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
