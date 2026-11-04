// 10065219 size=167 FUN_10065219

int FUN_10065219(void)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  bool bVar6;
  
  iVar1 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
  if (-1 < iVar1) {
    iVar1 = *(int *)(in_ECX + 0x278);
    if (iVar1 == 9) {
      pcVar4 = *(char **)(in_ECX + 0x280);
      iVar2 = 0xc;
      bVar6 = true;
      pcVar3 = pcVar4;
      pcVar5 = "pack_matrix";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar6 = *pcVar3 == *pcVar5;
        pcVar3 = pcVar3 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (bVar6) {
        iVar1 = FUN_10064454();
        return iVar1;
      }
      iVar2 = 8;
      bVar6 = true;
      pcVar3 = pcVar4;
      pcVar5 = "warning";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar6 = *pcVar3 == *pcVar5;
        pcVar3 = pcVar3 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar6);
      if (bVar6) {
        iVar1 = FUN_10064593();
        return iVar1;
      }
      iVar2 = 4;
      bVar6 = true;
      pcVar3 = "def";
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar6 = *pcVar4 == *pcVar3;
        pcVar4 = pcVar4 + 1;
        pcVar3 = pcVar3 + 1;
      } while (bVar6);
      if (bVar6) {
        iVar1 = FUN_1006497b();
        return iVar1;
      }
    }
    if ((iVar1 != 0xc) && (iVar1 != 0xd)) {
      FUN_10067789();
    }
    iVar1 = 0;
  }
  *(undefined4 *)(in_ECX + 0x40) = 1;
  return iVar1;
}


