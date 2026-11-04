// 10037b20 size=122 FUN_10037b20

void FUN_10037b20(void)

{
  undefined4 uVar1;
  
  uVar1 = FUN_10060c70();
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s",uVar1);
    _fflush(DAT_10764584);
  }
  return;
}


