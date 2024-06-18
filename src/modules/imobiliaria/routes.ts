import { FastifyInstance } from 'fastify';
import { Controller } from './controller';

const controler = new Controller()

export async function imobRoute(app: FastifyInstance) {
  app.post('/imobiliaria/register', controler.register);
  app.put('/imobiliaria/update', controler.update);
  app.get('/imobiliaria/get-by-id/:id', controler.getById);
  app.get('/imobiliaria/get-all', controler.getAll);
  app.delete('/imobiliaria/delete/:id', controler.delete);
}