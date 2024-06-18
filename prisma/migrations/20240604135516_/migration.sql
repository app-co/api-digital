/*
  Warnings:

  - Added the required column `userId` to the `Imovel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Imovel" ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "phones" ALTER COLUMN "codigo" SET DEFAULT +55;

-- AddForeignKey
ALTER TABLE "Imovel" ADD CONSTRAINT "Imovel_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
