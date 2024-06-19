import { prisma } from '@/lib/prisma';
import { AppError } from '@/shared/app-error/AppError';
import { TImovel } from './schemas';
import { TFilter } from './types';


export class Service {

  async create(
    data: Omit<TImovel,
      'end' |
      'id' |
      'dados' |
      'ambientes' |
      'documentos' |
      'caracteristicas' |
      'placas' |
      'keys' |
      'created_at' |
      'updated_at'
    >) {

    const find = await prisma.imovel.findFirst({ where: { codigo: data.codigo } });

    if (find) {
      throw new AppError('Imovel already exists');
    }

    const imovel = await prisma.imovel.create({ data });

    return imovel;
  }

  async getUserById(userId: string) {
    const find = await prisma.imovel.findUnic({ where: { id: userId } });

    if (!find) {
      throw new AppError('Not found');
    }
    return find
  }

  async listAll() {

    const list = await prisma.imovel.findMany();

    return list
  }

  async filter(params: TFilter) {
    const wherClause: any = {}


    if (params.value_min) {
      wherClause.value = { gte: parseInt(params.value_min) }
    }

    if (params.value_max) {
      wherClause.value = { lte: parseInt(params.value_max) };
    }

    if (params.imob_name) {
      wherClause.imobiliaria = {
        nome: { contains: params.imob_name }
      }
    }

    console.log({ wherClause, params })
    const list = await prisma.imovel.findMany({
      where: wherClause,
      select: {
        value: true,
        imobiliaria: true
      }
    });



    return list
  }
}