-- CreateEnum
CREATE TYPE "enumTypeUser" AS ENUM ('proprietario', 'inquilino', 'comprador', 'prestador', 'captador', 'fiador', 'colaborador', 'corretor');

-- CreateEnum
CREATE TYPE "enumUserRoles" AS ENUM ('listar', 'criar', 'editar', 'deletar');

-- CreateEnum
CREATE TYPE "enumEstadoCivil" AS ENUM ('casado', 'solteiro', 'divorciado', 'viuvo');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "roles" TEXT NOT NULL,
    "imovel" TEXT NOT NULL,
    "account_bank" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "rg" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "born" TEXT NOT NULL,
    "type_user" "enumTypeUser" NOT NULL,
    "estado_civil" "enumEstadoCivil" NOT NULL DEFAULT 'solteiro',
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account_bank" (
    "id" TEXT NOT NULL,
    "bank_code" TEXT NOT NULL,
    "agencia" TEXT NOT NULL,
    "conta" TEXT NOT NULL,
    "key_pix" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Account_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Endereco" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "UF" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_bank_userId_key" ON "Account_bank"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_userId_key" ON "Endereco"("userId");

-- AddForeignKey
ALTER TABLE "Account_bank" ADD CONSTRAINT "Account_bank_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
