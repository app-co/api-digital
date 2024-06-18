/*
  Warnings:

  - You are about to drop the column `numer` on the `phones` table. All the data in the column will be lost.
  - Added the required column `numero` to the `phones` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "phones" DROP COLUMN "numer",
ADD COLUMN     "numero" TEXT NOT NULL,
ALTER COLUMN "codigo" SET DEFAULT +55;
