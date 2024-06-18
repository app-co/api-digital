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

export type TKeys = z.infer<typeof schemaKeys>
export type TDocumentos = z.infer<typeof schemaDocumentos>
export type TAmbientes = z.infer<typeof schemaAmbientes>
export type TPlacas = z.infer<typeof schemaPlacas>
export type TCaracteristicas = z.infer<typeof schemaCaracteristicasImovel>
export type TDadosImovel = z.infer<typeof schemaDadosImovel>
export type TEnd = z.infer<typeof locality>
export type TImovel = z.infer<typeof schemaImovel>