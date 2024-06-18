import { z } from "zod";

export const schemaImobiliaria = z.object({
  id: z.number(),
  cnpj: z.string(),
  nome: z.string(),
  matriz_filial: z.enum(['matriz', 'filial']),
  cpf_responsavel: z.string().min(11),
  nome_fantasia: z.string(),
  numero_creci: z.string(),
})