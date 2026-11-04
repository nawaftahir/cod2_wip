


unsigned int FUN_10060690(unsigned int param_1)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  
  uVar3 = param_1;
  uVar1 = (unsigned int)param_1 >> 0x18;
  uVar2 = (unsigned int)param_1 >> 0x10;
  param_1 = CONCAT13((char)uVar3,
                     CONCAT12((char)((unsigned int)uVar3 >> 8),CONCAT11((char)uVar2,(char)uVar1)));
  return param_1;
}


