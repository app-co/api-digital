import { z } from 'zod'
import * as s from './schemas'
export type TKeys = z.infer<typeof s.schemaKeys>
export type TDocumentos = z.infer<typeof s.schemaDocumentos>
export type TAmbientes = z.infer<typeof s.schemaAmbientes>
export type TPlacas = z.infer<typeof s.schemaPlacas>
export type TCaracteristicas = z.infer<typeof s.schemaCaracteristicasImovel>
export type TDadosImovel = z.infer<typeof s.schemaDadosImovel>
// export type TEnd = z.infer<typeof s.schel>
export type TImovel = z.infer<typeof s.schemaImovel>
export type TFilter = z.infer<typeof s.schemaFilter>