import { prisma } from '@/lib/prisma';
import { AppError } from '@/shared/app-error/AppError';
import { enumEmail, enumEstadoCivil } from '@prisma/client';
import { hash } from 'bcryptjs';
import { TSearchUser, TUser } from './types';



export class Service {

  async register(input: Omit<TUser, 'id' | 'created_at' | 'updated_at'>) {
    const email = input.email.find(h => h.type === 'primario')

    const findEmail = await prisma.user.findFirst({
      where: {
        email: {
          some: email
        }
      }
    })
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

    const password = await hash(input.password, 6)
    const emails = input.email.map(h => {
      return {
        email: h.email,
        type: h.type as enumEmail
      }
    })

    const user = await prisma.user.create({
      data: {
        name: input.name,
        cpf: input.cpf,
        rg: input.rg,
        born: input.born,
        password,
        estado_civil: input.estado_civil as enumEstadoCivil,
        type_user: {
          createMany: {
            data: input.type_user
          }
        },
        email: {
          createMany: {
            data: emails
          }
        },
        phones: {
          createMany: {
            data: input.phones
          }
        },
        endereco: {
          create: input.endereco
        },
      },
    })

    return user

  }

  async getUserById(userId: string) {
    const find = await prisma.user.findUnique({
      where: {
        id: userId
      },
      include: {
        phones: true,
        email: true,
        type_user: true,
        endereco: true,
        Imovel: true
      }
    });

    if (!find) {
      throw new AppError('Not found');
    }
    return find
  }

  async listAll() {

    const list = await prisma.user.findMany(
      {
        include: {
          phones: true,
          email: true,
          type_user: true,
          endereco: true,
          Imovel: true
        },
      }
    );

    return list
  }

  async searchUser(input: TSearchUser) {
    let user = await this.listAll()

    if (input.cpf) {
      user = user.filter(h => h.cpf === input.cpf)
    }
  }
}