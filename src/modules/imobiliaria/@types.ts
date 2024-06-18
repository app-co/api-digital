import { z } from 'zod'
import { schemaImobiliaria } from './schemas'

export type TImobiliaria = z.infer<typeof schemaImobiliaria>