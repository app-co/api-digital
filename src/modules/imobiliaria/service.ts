import { prisma } from '@/lib/prisma';
import { AppError } from '@/shared/app-error/AppError';
import { TImobiliaria } from './@types';


export class Service {

  async create(data: Omit<TImobiliaria, 'id'>) {

    const find = await prisma.imobiliaria.findFirst({ where: { nome_fantasia: data.nome_fantasia } });

    if (find) {
      throw new AppError('Imobiliaria already exists');
    }

    const imob = await prisma.imobiliaria.create({ data })

    return imob
  }
  async update(data: TImobiliaria) {

    const imob = await prisma.imobiliaria.update({
      where: { id: data.id },
      data: {
        cnpj: data.cnpj,
        nome: data.nome,
        matriz_filial: data.matriz_filial,
        cpf_responsavel: data.cpf_responsavel,
        nome_fantasia: data.nome_fantasia,
        numero_creci: data.numero_creci,
      }
    })

    return imob
  }

  async getById(id: number) {
    const find = await prisma.imobiliaria.findUnique({ where: { id }, include: { imoveis: true } });

    if (!find) {
      throw new AppError('Not found');
    }
    return find
  }

  async listAll() {

    const list = await prisma.imobiliaria.findMany();

    return list
  }

  async delete(id: number) {
    const find = await prisma.imobiliaria.findUnique({ where: { id } });

    if (!find) {
      throw new AppError('imobiliaria not found');
    }

    await prisma.imobiliaria.delete({ where: { id } });

    return find
  }
}