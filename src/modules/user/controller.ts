import { FastifyReply, FastifyRequest } from 'fastify';
import { schemaUser } from './schemas';
import { Service } from './service';

const make = new Service()

export class Controller {
  async register(req: FastifyRequest, res: FastifyReply) {
    const schema = schemaUser
      .omit({
        id: true,
        created_at: true,
        updated_at: true,
      })
      .parse(req.body)
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

  async getUser(req: FastifyRequest, res: FastifyReply) {
    const schema = req.body
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

  async getAll(req: FastifyRequest, res: FastifyReply) {
    const rs = await make.listAll();

    return res.status(201).send(rs);
  }

  async delete(req: FastifyRequest, res: FastifyReply) {
    const schema = req.body
    const rs = await make.register(schema);

    return res.status(201).send(rs);
  }

}