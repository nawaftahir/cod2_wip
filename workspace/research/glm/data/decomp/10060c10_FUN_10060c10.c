// 10060c10 size=26 FUN_10060c10

void FUN_10060c10(char *param_1)

{
  size_t unaff_ESI;
  char *unaff_EDI;
  
  __vsnprintf(unaff_EDI,unaff_ESI,param_1,&stack0x00000008);
  unaff_EDI[unaff_ESI - 1] = '\0';
  return;
}


