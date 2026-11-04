


long long FUN_10060540(unsigned int param_1,unsigned int param_2)

{
  long long lVar1;
  
  lVar1 = __allmul(param_1 & 0xff,0,0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_1 >> 8 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_1 >> 0x10 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_1 >> 0x18),0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_2 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_2 >> 8 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (unsigned long long)(param_2 >> 0x10 & 0xff),0x100,0);
  return lVar1 + (unsigned long long)(param_2 >> 0x18);
}


