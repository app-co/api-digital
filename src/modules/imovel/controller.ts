import { FastifyReply, FastifyRequest } from 'fastify';
import * as S from './schemas';
import { Service } from './service';

const make = new Service()

export class Controller {
  async register(req: FastifyRequest, res: FastifyReply) {
    const schema = S.schemaImovel
      .omit({
        id: true,
        end: true,
        dados: true,
        ambientes: true,
        documentos: true,
        caracteristicas: true,
        placas: true,
        created_at: true,
        updated_at: true,
        keys: true,
      })
      .parse(req.body)

    const rs = await make.create(schema);

    return res.status(201).send(rs);
  }

  async getUser(req: FastifyRequest, res: FastifyReply) {
    const schema = req.body
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

  async getAll(req: FastifyRequest, res: FastifyReply) {
    const schema = req.body
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

  async delete(req: FastifyRequest, res: FastifyReply) {
    const schema = req.body
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

}