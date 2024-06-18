import { z } from "zod";

export const locality = z.object({
  id: z.string(),
  rua: z.string(),
  cidade: z.string(),
  UF: z.string(),
  CEP: z.string(),
  numero: z.string(),
  complemento: z.string(),
  fk_id: z.any(),
  created_at: z.date(),
  updated_at: z.date(),
})