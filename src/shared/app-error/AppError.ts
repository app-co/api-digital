export class AppError {
  message: string;
  statusCode: number

  constructor(message: string, statusCode = 409) {
    this.message = message;
    this.statusCode = statusCode
  }
}
