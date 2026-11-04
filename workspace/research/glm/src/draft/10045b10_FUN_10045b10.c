extern int FUN_10044f20();
extern int FUN_10045350();


void FUN_10045b10(int *param_1)

{
  unsigned char bVar1;
  int iVar2;
  int *piVar3;
  unsigned int *puVar4;
  int iVar5;
  int iVar6;
  
  iVar5 = 0;
  iVar6 = 0;
  if (0 < param_1[0x11]) {
    puVar4 = (unsigned int *)(param_1[0x13] + 0x10);
    do {
      iVar2 = FUN_10044f20(*puVar4);
      iVar5 = iVar5 + iVar2;
      iVar6 = iVar6 + 1;
      puVar4 = puVar4 + 0x15;
    } while (iVar6 < param_1[0x11]);
  }
  if (((*(char *)((int)param_1 + 0xb9) == '\0') && ((char)param_1[0x37] == '\0')) &&
     (param_1[0x10] == 8)) {
    iVar6 = param_1[0x11];
    bVar1 = true;
    if (0 < iVar6) {
      piVar3 = (int *)(param_1[0x13] + 0x18);
      do {
        if ((1 < piVar3[-1]) || (1 < *piVar3)) {
          bVar1 = false;
        }
        piVar3 = piVar3 + 0x15;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
    }
    if ((iVar5 != 0) && (bVar1)) {
      *(unsigned int *)(*param_1 + 0x14) = 0x4b;
      (**(void **)(*param_1 + 4))(param_1,0);
    }
  }
  if (*(char *)((int)param_1 + 0xb9) == '\0') {
    if ((char)param_1[0x37] == '\0') {
      FUN_10045350();
      return;
    }
    FUN_10045350();
    return;
  }
  FUN_10045350();
  return;
}


