export interface IWalletDto {
  id: string;
  balance: number;
  bet: number;
  deposit: number;

  userId: number;
  crated_at: string | Date;
  updated_at: string | Date;
}

export interface IPaymentDto {
  id: string;

  status: string;
  amount: string;
  userId: string;

  crated_at: string | Date;
  updated_at: string | Date;
}

export interface IUserDto {
  id?: number;
  name: string;
  email: string;
  user_name: string;
  document?: string;
  password: string;

  crated_at?: string | Date;
  updated_at?: string | Date;

  wallet?: IWalletDto;
  referral_settings?: string;
  payments?: IPaymentDto[];
  roles?: {
    id: string;
    admin: boolean;
    is_referral: boolean;
    is_ban: boolean;
  };
}
