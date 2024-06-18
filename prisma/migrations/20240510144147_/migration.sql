/*
  Warnings:

  - You are about to drop the column `account_bank` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `imovel` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `roles` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "account_bank",
DROP COLUMN "imovel",
DROP COLUMN "roles";
