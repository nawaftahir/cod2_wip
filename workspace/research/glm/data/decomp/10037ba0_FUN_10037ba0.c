// 10037ba0 size=106 FUN_10037ba0

void FUN_10037ba0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  uint in_EAX;
  undefined4 uVar1;
  uint in_ECX;
  uint in_EDX;
  
  if ((in_EAX & in_EDX) == 0) {
    param_2 = param_3;
  }
  uVar1 = FUN_10060c70("---------- (%c)%-14s: %s\n",(((in_ECX & in_EAX) == 0) - 1U & 10) + 0x20,
                       param_1,param_2);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  return;
}


