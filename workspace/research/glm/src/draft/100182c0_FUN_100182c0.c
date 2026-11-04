extern int FUN_10018250();
extern int FUN_10060c70();


unsigned char FUN_100182c0(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                 unsigned int param_5,unsigned int param_6)

{
  char cVar1;
  unsigned int uVar2;
  
  cVar1 = FUN_10018250(param_3,param_5,param_6);
  if (cVar1 != '\0') {
    return false;
  }
  uVar2 = FUN_10060c70("lib/%s",param_3,param_5,param_6);
  cVar1 = FUN_10018250(uVar2);
  return cVar1 == '\0';
}


