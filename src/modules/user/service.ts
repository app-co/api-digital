import { prisma } from '@/lib/prisma';
import { AppError } from '@/shared/app-error/AppError';
import { TUser } from './types';


export class Service {

  async register(input: TUser) {
    const findEmail = await prisma.user.findUnique({ where: { email: input.email } })
    const findRg = await prisma.user.findUnique({ where: { rg: input.rg } })
    const findCpf = await prisma.user.findUnique({ where: { cpf: input.cpf } })

    if (findEmail) {
      throw new AppError('Email já cadastrado')
    }


    if (findCpf) {
      throw new AppError('CPF já cadastrado')
    }


    if (findRg) {
      throw new AppError('RG já cadastrado')
    }

    const user = await prisma.user.create({
      data: input
    })

  }

  async getUserById(userId: string) {
    const find = await prisma.user.findUnique({ where: { id: userId } });

    if (!find) {
      throw new AppError('Not found');
    }
    return find
  }

  async listAll() {

    const list = await prisma.user.findMany();

    return list
  }
}