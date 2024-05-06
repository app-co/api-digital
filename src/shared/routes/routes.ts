import { userRoute } from '@/modules/user/routes';
import { FastifyInstance } from 'fastify';

export async function Routes(app: FastifyInstance) {
  app.register(userRoute);
}
