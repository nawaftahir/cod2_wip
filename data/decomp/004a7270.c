
char * FUN_004a7270(void)

{
  byte bVar1;
  int *piVar2;
  char *pcVar3;
  int unaff_ESI;
  
  bVar1 = *(byte *)((int)&DAT_01203280 + unaff_ESI);
  if (bVar1 == 0) {
    return "<FREE>";
  }
  if (unaff_ESI == 0) {
    pcVar3 = "<NULL>";
  }
  else {
    piVar2 = (int *)FUN_004a87b0();
    pcVar3 = (char *)(piVar2 + 1);
    if (*(char *)((*piVar2 - 1U & 0xff) + (int)pcVar3) != '\0') {
      pcVar3 = "<BINARY>";
    }
  }
  pcVar3 = (char *)FUN_004969e0("%s: \'%s\' (%d)",(&PTR_s_empty_005971a0)[bVar1],pcVar3,
                                *(undefined1 *)((int)&DAT_01213280 + unaff_ESI));
  return pcVar3;
}

