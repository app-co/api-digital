/*
  Warnings:

  - You are about to drop the column `imobiliaria_endId` on the `imobiliaria` table. All the data in the column will be lost.
  - You are about to drop the column `imovelId` on the `imobiliaria_end` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[imobiliariaId]` on the table `imobiliaria_end` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `imobiliariaId` to the `condominio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imobiliariaId` to the `imobiliaria_end` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "imobiliaria" DROP CONSTRAINT "imobiliaria_imobiliaria_endId_fkey";

-- DropForeignKey
ALTER TABLE "imobiliaria_end" DROP CONSTRAINT "imobiliaria_end_imovelId_fkey";

-- DropIndex
DROP INDEX "imobiliaria_end_imovelId_key";

-- AlterTable
ALTER TABLE "Imovel" ADD COLUMN     "imobiliaria_endId" TEXT;

-- AlterTable
ALTER TABLE "condominio" ADD COLUMN     "imobiliariaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "imobiliaria" DROP COLUMN "imobiliaria_endId";

-- AlterTable
ALTER TABLE "imobiliaria_end" DROP COLUMN "imovelId",
ADD COLUMN     "imobiliariaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "phones" ALTER COLUMN "codigo" SET DEFAULT +55;

-- CreateIndex
CREATE UNIQUE INDEX "imobiliaria_end_imobiliariaId_key" ON "imobiliaria_end"("imobiliariaId");

-- AddForeignKey
ALTER TABLE "imobiliaria_end" ADD CONSTRAINT "imobiliaria_end_imobiliariaId_fkey" FOREIGN KEY ("imobiliariaId") REFERENCES "imobiliaria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Imovel" ADD CONSTRAINT "Imovel_imobiliaria_endId_fkey" FOREIGN KEY ("imobiliaria_endId") REFERENCES "imobiliaria_end"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "condominio" ADD CONSTRAINT "condominio_imobiliariaId_fkey" FOREIGN KEY ("imobiliariaId") REFERENCES "imobiliaria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
