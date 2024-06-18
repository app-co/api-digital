/*
  Warnings:

  - Added the required column `value` to the `Imovel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Imovel" ADD COLUMN     "value" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "phones" ALTER COLUMN "codigo" SET DEFAULT +55;
