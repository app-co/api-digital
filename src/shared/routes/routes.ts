import { imobRoute } from '@/modules/imobiliaria/routes';
import { imovelRoute } from '@/modules/imovel/routes';
import { userRoute } from '@/modules/user/routes';
import { FastifyInstance } from 'fastify';

export async function Routes(app: FastifyInstance) {
  app.register(userRoute);
  app.register(imobRoute)
  app.register(imovelRoute)
}
