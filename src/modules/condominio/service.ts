import { prisma } from '@/lib/prisma';
import { AppError } from '@/shared/app-error/AppError';
import { TCondominio } from './schemas';


export class Service {

  async create(data: Omit<TCondominio, 'id'>) {
    const exec = await prisma.condominio.create({ data })

    return exec
  }



  async getById(id: number) {
    const find = await prisma.condominio.findUnique({ where: { id } });

    if (!find) {
      throw new AppError('Condominio not found');
    }
    return find
  }

  async listAll() {

    const list = await prisma.condominio.findMany();

    return list
  }


}