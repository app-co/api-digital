import { FastifyInstance } from 'fastify';
import { Controller } from './controller';

const controler = new Controller()

export async function imovelRoute(app: FastifyInstance) {
  app.post('/imovel/register', controler.register);
  app.get('/imovel/filter', controler.filter);
}