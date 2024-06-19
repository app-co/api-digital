import { FastifyInstance } from "fastify";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import { z } from "zod";
import { Controller } from "../controller";

const control = new Controller()

export async function registerUser(app: FastifyInstance) {
  app.withTypeProvider<ZodTypeProvider>().post('/user/register', {
    schema: {
      body: z.object({
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
          ])
      })
    }
  }, control.getUser
  )
}