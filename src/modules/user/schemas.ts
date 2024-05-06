import { z } from "zod";

export const schemaRegiterUser = z.object({
  name: z.string(),
  email: z.string(),
  password: z.string(),
  cpf: z.string(),
  rg: z.string(),
  phone: z.string(),
  born: z.string(),
  type_user:
    z.enum([
      'proprietario',
      'inquilino',
      'comprador',
      'prestador',
      'captador',
      'fiador',
      'colaborador',
      'corretor',
    ]),
  estado_civil: z.enum(['casado', 'solteiro', 'divorciado', 'viuvo']),
})