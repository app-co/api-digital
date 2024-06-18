/*
  Warnings:

  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Account_bank` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Endereco` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "enumTipo" AS ENUM ('venda', 'locacao', 'venda_locacao');

-- CreateEnum
CREATE TYPE "enumSubCategorias" AS ENUM ('armazem', 'barracao', 'box', 'galpao', 'garagem', 'hotel', 'loja', 'pavilhao', 'ponto_comercial', 'predio', 'sala', 'salao', 'sobrado', 'terreno', 'ponto_comercialcondominio', 'industrial', 'lote', 'padrao', 'residencial', 'area');

-- CreateEnum
CREATE TYPE "enumTipoCondominio" AS ENUM ('casa', 'apartamento', 'kitnet', 'comercial', 'lote');

-- CreateEnum
CREATE TYPE "enumStatusCondominio" AS ENUM ('planta', 'comdominio', 'loteamento', 'lancamento');

-- CreateEnum
CREATE TYPE "enumRoles" AS ENUM ('visualizar', 'atualizar', 'criar', 'excluir', 'full');

-- CreateEnum
CREATE TYPE "enumTypePhone" AS ENUM ('celular', 'comercial', 'residencial');

-- CreateEnum
CREATE TYPE "enumEmail" AS ENUM ('primario', 'secundario');

-- DropForeignKey
ALTER TABLE "Account_bank" DROP CONSTRAINT "Account_bank_userId_fkey";

-- DropForeignKey
ALTER TABLE "Endereco" DROP CONSTRAINT "Endereco_userId_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "phone";

-- DropTable
DROP TABLE "Account_bank";

-- DropTable
DROP TABLE "Endereco";

-- CreateTable
CREATE TABLE "email" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "type" "enumEmail" NOT NULL,
    "userId" TEXT NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "email_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "phones" (
    "id" SERIAL NOT NULL,
    "codigo" TEXT NOT NULL DEFAULT +55,
    "area" TEXT NOT NULL DEFAULT 14,
    "numer" TEXT NOT NULL,
    "type" "enumTypePhone" NOT NULL DEFAULT 'celular',
    "userId" TEXT NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "phones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "account_bank" (
    "id" TEXT NOT NULL,
    "bank_code" TEXT NOT NULL,
    "agencia" TEXT NOT NULL,
    "conta" TEXT NOT NULL,
    "key_pix" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "account_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_end" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "userId" TEXT NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_end_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imobiliaria_end" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "imobiliaria_end_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Imovel_end" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Imovel_end_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "condominio_end" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "condominioId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "condominio_end_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Imovel" (
    "id" SERIAL NOT NULL,
    "codigo" INTEGER NOT NULL,
    "imobiliariaId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Imovel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dados_imovel" (
    "id" SERIAL NOT NULL,
    "tipo" "enumTipo" NOT NULL,
    "categoria" TEXT NOT NULL,
    "valor_avaliado" INTEGER NOT NULL,
    "n_matricula" TEXT NOT NULL,
    "n_iptu" TEXT NOT NULL,
    "valor_anual_iptu" INTEGER NOT NULL,
    "valor_mensal_iptu" INTEGER NOT NULL,
    "n_parcelas_iptu" INTEGER NOT NULL,
    "a_pagar_iptu" INTEGER NOT NULL,
    "medidor_gas" TEXT NOT NULL,
    "energia_eletrica" TEXT NOT NULL,
    "agua_esgoto" TEXT NOT NULL,
    "tensao_eletrica" TEXT NOT NULL,
    "observacao" TEXT,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "dados_imovel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "keys" (
    "id" SERIAL NOT NULL,
    "qnt" INTEGER NOT NULL,
    "obs" TEXT NOT NULL,
    "comodo" TEXT,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "keys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "caracteristicas_imovel" (
    "id" SERIAL NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "caracteristicas_imovel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "placas" (
    "id" SERIAL NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "placas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ambientes" (
    "id" SERIAL NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ambientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "documentos" (
    "id" SERIAL NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "documentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imobiliaria" (
    "id" SERIAL NOT NULL,
    "cnpj" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "matriz_filial" TEXT NOT NULL,
    "cpf_responsavel" TEXT NOT NULL,
    "nome_fantasia" TEXT NOT NULL,
    "numero_creci" TEXT NOT NULL,
    "imobiliaria_endId" TEXT NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "imobiliaria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "condominio" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "dt_vencimento" TIMESTAMP(3) NOT NULL,
    "elevadores_servico" INTEGER NOT NULL DEFAULT 0,
    "elevadores_social" INTEGER NOT NULL DEFAULT 0,
    "condominio" TEXT,
    "url_landing_page" TEXT,
    "tipo" "enumTipoCondominio" NOT NULL,
    "status" "enumStatusCondominio" NOT NULL,

    CONSTRAINT "condominio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "corretora" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "contato" TEXT,
    "phone_area" TEXT,

    CONSTRAINT "corretora_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grupo" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "roles" "enumRoles"[],
    "grupo" JSONB[],
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "grupo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "account_bank_userId_key" ON "account_bank"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_end_userId_key" ON "User_end"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "imobiliaria_end_imovelId_key" ON "imobiliaria_end"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "Imovel_end_imovelId_key" ON "Imovel_end"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "condominio_end_condominioId_key" ON "condominio_end"("condominioId");

-- CreateIndex
CREATE UNIQUE INDEX "Imovel_imobiliariaId_key" ON "Imovel"("imobiliariaId");

-- CreateIndex
CREATE UNIQUE INDEX "dados_imovel_imovelId_key" ON "dados_imovel"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "keys_imovelId_key" ON "keys"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "caracteristicas_imovel_imovelId_key" ON "caracteristicas_imovel"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "placas_imovelId_key" ON "placas"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "ambientes_imovelId_key" ON "ambientes"("imovelId");

-- CreateIndex
CREATE UNIQUE INDEX "documentos_imovelId_key" ON "documentos"("imovelId");

-- AddForeignKey
ALTER TABLE "email" ADD CONSTRAINT "email_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "phones" ADD CONSTRAINT "phones_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account_bank" ADD CONSTRAINT "account_bank_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_end" ADD CONSTRAINT "User_end_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imobiliaria_end" ADD CONSTRAINT "imobiliaria_end_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Imovel_end" ADD CONSTRAINT "Imovel_end_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "condominio_end" ADD CONSTRAINT "condominio_end_condominioId_fkey" FOREIGN KEY ("condominioId") REFERENCES "condominio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Imovel" ADD CONSTRAINT "Imovel_imobiliariaId_fkey" FOREIGN KEY ("imobiliariaId") REFERENCES "imobiliaria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dados_imovel" ADD CONSTRAINT "dados_imovel_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "keys" ADD CONSTRAINT "keys_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "caracteristicas_imovel" ADD CONSTRAINT "caracteristicas_imovel_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "placas" ADD CONSTRAINT "placas_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ambientes" ADD CONSTRAINT "ambientes_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "Imovel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imobiliaria" ADD CONSTRAINT "imobiliaria_imobiliaria_endId_fkey" FOREIGN KEY ("imobiliaria_endId") REFERENCES "imobiliaria_end"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
