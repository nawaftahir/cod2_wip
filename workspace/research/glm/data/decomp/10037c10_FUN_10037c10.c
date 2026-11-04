// 10037c10 size=208 FUN_10037c10

void FUN_10037c10(undefined4 param_1,uint param_2)

{
  uint in_EAX;
  int iVar1;
  undefined4 uVar2;
  uint in_EDX;
  int unaff_ESI;
  int unaff_EDI;
  
  iVar1 = 0;
  if (0 < unaff_EDI) {
    do {
      if (*(uint *)(unaff_ESI + iVar1 * 8) == (param_2 & in_EAX)) {
        uVar2 = FUN_10060c70("---------- (%c)%-14s: %s\n",
                             (((in_EDX & in_EAX) == 0) - 1U & 10) + 0x20,param_1,
                             *(undefined4 *)(unaff_ESI + 4 + iVar1 * 8));
        if (*(int *)(DAT_101ce7ec + 8) == 0) {
          return;
        }
        if (DAT_10764584 == (FILE *)0x0) {
          return;
        }
        _fprintf(DAT_10764584,"%s",uVar2);
        _fflush(DAT_10764584);
        return;
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < unaff_EDI);
  }
  uVar2 = FUN_10060c70("---------- (%c)%-14s: unknown - %08x\n",
                       (((in_EDX & in_EAX) == 0) - 1U & 10) + 0x20,param_1,param_2 & in_EAX);
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar2);
    _fflush(DAT_10764584);
  }
  return;
}


