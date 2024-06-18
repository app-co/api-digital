import { Service } from '@modules/condominio/service';
import { FastifyReply, FastifyRequest } from 'fastify';

const make = new Service()

export class Controller {
async register(req: FastifyRequest, res: FastifyReply) {
const schema = req.body
const rs = await make.register(schema);

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