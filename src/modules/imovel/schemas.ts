import { locality } from "@/shared/dtos";
import { z } from "zod";


export const schemaKeys = z.object({
  id: z.number(),
  qnt: z.number(),
  obs: z.string(),
  comodo: z.string(),
  imovelId: z.number(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaDadosImovel = z.object({
  id: z.number(),
  tipo: z.enum(['venda', 'locacao', 'venda_locacao']),
  categoria: z.number(),
  valor_avaliado: z.number(),
  n_matricula: z.number(),
  n_iptu: z.number(),
  valor_anual_iptu: z.number(),
  valor_mensal_iptu: z.number(),
  n_parcelas_iptu: z.number(),
  a_pagar_iptu: z.number(),
  medidor_gas: z.number(),
  energia_eletrica: z.number(),
  agua_esgoto: z.number(),
  tensao_eletrica: z.number(),
  observacao: z.number(),
})

export const schemaCaracteristicasImovel = z.object({
  id: z.number(),
  imovelId: z.number(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaPlacas = z.object({
  id: z.number(),
  imovelId: z.number(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaAmbientes = z.object({
  id: z.number(),
  imovelId: z.number(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaDocumentos = z.object({
  id: z.number(),
  imovelId: z.number(),
  created_at: z.date(),
  updated_at: z.date(),
})

export const schemaImovel = z.object({
  id: z.number(),
  codigo: z.number().optional(),
  imobiliariaId: z.number(),
  userId: z.string(),
  value: z.number(),
  created_at: z.date(),
  updated_at: z.date(),

  end: locality,
  dados: schemaDadosImovel,
  ambientes: z.array(schemaAmbientes),
  documentos: z.array(schemaDocumentos),
  caracteristicas: z.array(schemaCaracteristicasImovel),
  placas: z.array(schemaPlacas),
  keys: z.array(schemaKeys),
})

export const schemaFilter = z.object({
  value_max: z.string().optional(),
  value_min: z.string().optional(),
  tipo: z.enum(['venda', 'locacao', 'venda_locacao']).optional(),
  categoria: z.number().optional(),
  n_matricula: z.number().optional(),
  n_iptu: z.number().optional(),
  imob_name: z.string().optional(),
  qnt_quartos: z.number().optional(),
  qnt_suites: z.number().optional(),
  qnt_banheiros: z.number().optional(),
  qnt_vagas: z.number().optional(),
  vagas_garagens: z.number().optional(),
  mobiliado: z.boolean().default(false)
})

