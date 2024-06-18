import { z } from "zod";
import { schemaFilterUser, schemaUser } from './schemas';

export type TUser = z.infer<typeof schemaUser>
export type TSearchUser = z.infer<typeof schemaFilterUser>