import { z } from "zod";
import { schemaRegiterUser } from './schemas';

export type TUser = z.infer<typeof schemaRegiterUser>