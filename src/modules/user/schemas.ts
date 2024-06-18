import { z } from "zod";
export const schemaPhone = z.object({
  id: z.number(),
  codigo: z.string().optional(),
  area: z.string(),
  numero: z.string(),
  type: z.enum(['celular', 'comercial', 'residencial']),
  userId: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaEmail = z.object({
  id: z.number().optional(),
  email: z.string().email(),
  type: z.enum(['primario', 'secundario']),
  userId: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaEndereco = z.object({
  id: z.string().optional(),
  rua: z.string(),
  cidade: z.string(),
  UF: z.preprocess(h => h, z.string().toUpperCase()),
  CEP: z.preprocess(h => h, z.string().toUpperCase()),
  numero: z.string(),
  complemento: z.string().optional(),
  userId: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaAccountBank = z.object({
  id: z.string().optional(),
  bank_code: z.string(),
  agencia: z.string(),
  conta: z.string(),
  key_pix: z.string(),
  userId: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaGrupo = z.object({
  id: z.number(),
  nome: z.string(),
  roles: z.array(z.enum([
    "visualizar",
    "atualizar",
    "criar",
    "excluir",
    "full",
  ])),
  grupo: z.array(z.string()),
  userId: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaUser = z.object({
  id: z.string(),
  name: z.string().min(4, 'Nome inválido'),
  password: z.string(),
  cpf: z.string().min(11, 'digite um CPF válido'),
  rg: z.string().min(9, 'digite um RG válido'),
  born: z.string(),
  estado_civil: z.enum(['casado', 'solteiro', 'divorciado', 'viuvo']),
  type_user: z.array(schemaGrupo.omit({
    id: true,
    userId: true,
    created_at: true,
    updated_at: true,
  })),
  email: z.array(schemaEmail.omit({
    id: true,
    userId: true,
    created_at: true,
    updated_at: true,
  })),
  phones: z.array(schemaPhone.omit({
    userId: true,
    id: true,
    created_at: true,
    updated_at: true,
  })),

  account_bank: schemaAccountBank
    .omit({
      userId: true,
      created_at: true,
      updated_at: true,
      id: true,
    })
    .optional(),
  endereco: schemaEndereco.omit({
    id: true,
    userId: true,
    created_at: true,
    updated_at: true,
  }),
  created_at: z.date(),
  updated_at: z.date(),
})


export const schemaFilterUser = z.object({
  name: z.string().min(4, 'Nome inválido').optional(),
  email: z.string().email('digite um email válido').optional(),
  password: z.string().optional(),
  cpf: z.string().min(11, 'digite um CPF válido').optional(),
  rg: z.string().min(9, 'digite um RG válido').optional(),
  phone: z.string().min(9, 'digite um telefone válido').optional(),
})

