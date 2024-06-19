import { FastifyInstance } from 'fastify';
import { Controller } from '../controller';

const controler = new Controller()

export async function userRoute(app: FastifyInstance) {
  app.post('/user/register', controler.register);
}