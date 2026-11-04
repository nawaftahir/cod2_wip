// 10016db0 size=49 FUN_10016db0

void FUN_10016db0(void)

{
  int iVar1;
  int *piVar2;
  uint uVar3;
  
  uVar3 = 0;
  do {
    iVar1 = *(int *)((int)&DAT_101da564 + uVar3);
    if (iVar1 != 0) {
      piVar2 = *(int **)(iVar1 + 0xc);
      if (*(char *)(iVar1 + 10) == '\0') {
        (**(code **)(*piVar2 + 8))();
      }
      else {
        (**(code **)(*piVar2 + 8))(piVar2);
      }
    }
    uVar3 = uVar3 + 4;
  } while (uVar3 < 0x400);
  return;
}


