import { FastifyReply, FastifyRequest } from 'fastify';
import { schemaImobiliaria } from './schemas';
import { Service } from './service';

const make = new Service()

export class Controller {
  async register(req: FastifyRequest, res: FastifyReply) {
    const schema = schemaImobiliaria.omit({ id: true }).parse(req.body)

    const rs = await make.create(schema);

    return res.status(201).send(rs);
  }

  async update(req: FastifyRequest, res: FastifyReply) {
    const schema = schemaImobiliaria.parse(req.body)

    const rs = await make.update(schema);

    return res.status(201).send(rs);
  }

  async getById(req: FastifyRequest, res: FastifyReply) {
    const { id } = req.params as unknown as { id: number }
    const rs = await make.getById(Number(id));

    return res.status(201).send(rs);
  }
  async getAll(req: FastifyRequest, res: FastifyReply) {
    const rs = await make.listAll();

    return res.status(201).send(rs);
  }

  async delete(req: FastifyRequest, res: FastifyReply) {
    const { id } = req.params as unknown as { id: number }
    const rs = await make.delete(id);

    return res.status(201).send(rs);
  }

}