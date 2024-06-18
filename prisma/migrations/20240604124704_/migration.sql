/*
  Warnings:

  - A unique constraint covering the columns `[codigo]` on the table `Imovel` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
CREATE SEQUENCE imovel_codigo_seq;
ALTER TABLE "Imovel" ALTER COLUMN "codigo" SET DEFAULT nextval('imovel_codigo_seq');
ALTER SEQUENCE imovel_codigo_seq OWNED BY "Imovel"."codigo";

-- AlterTable
ALTER TABLE "phones" ALTER COLUMN "codigo" SET DEFAULT +55;

-- CreateIndex
CREATE UNIQUE INDEX "Imovel_codigo_key" ON "Imovel"("codigo");
