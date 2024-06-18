/* eslint-disable no-underscore-dangle */
import fastify from 'fastify';
import { ZodError } from 'zod';

import { env } from './env';
import { AppError } from './shared/app-error/AppError';
import { Routes } from './shared/routes/routes';

export const app = fastify();

app.register(Routes);

app.setErrorHandler((error, request, reply) => {
  if (error instanceof ZodError) {
    const key = error.issues[0].path[0];
    const mess = error.issues[0].message;

    console.log(error)
    const err = {
      error: {
        message: `Validation error: ${key}, ${mess}`,
        statusCode: 409
      }
    }

    return reply
      .status(409)
      .send(err);
  }

  if (error instanceof AppError) {
    return reply.status(409).send({ error });
  }

  if (env.NODE_ENV !== 'production') {
    console.log(error);
  }

  return reply.status(500).send({ message: 'Interl server error' });
});
