import { z } from "zod";

const enumTipoCondominio = z.enum([
  "casa",
  "apartamento",
  "kitnet",
  "comercial",
  "lote",
])

const enumStatusCondominio = z.enum([
  "planta",
  "comdominio",
  "loteamento",
  "lancamento",
])

export const schemaCondominio = z.object({
  id: z.number(),
  nome: z.string(),
  dt_vencimento: z.date(),
  elevadores_servico: z.number(),
  elevadores_social: z.number(),
  condominio: z.string().optional(),
  url_landing: z.string().optional(),
  tipo: enumTipoCondominio,
  status: enumStatusCondominio,
  imobiliariaId: z.number()
})

export type TCondominio = z.infer<typeof schemaCondominio>