// 1002aac0 size=206 FUN_1002aac0

void FUN_1002aac0(int param_1,int param_2,int param_3,int param_4)

{
  int *piVar1;
  short sVar2;
  int iVar3;
  uint uVar4;
  byte bVar5;
  int iVar6;
  
  sVar2 = *(short *)(param_2 + 0xc + param_3 * 4);
  while( true ) {
    bVar5 = (byte)param_4;
    if (sVar2 == 0) {
      iVar6 = (param_3 + 1 << (bVar5 & 0x1f)) * 0x10;
      piVar1 = (int *)(iVar6 + -0x78 + param_2);
      **(undefined4 **)(iVar6 + -0x74 + param_2) = *(undefined4 *)(iVar6 + -0x78 + param_2);
      *(int *)(*piVar1 + 4) = piVar1[1];
      return;
    }
    *(undefined2 *)(param_2 + 0xc + param_3 * 4) = 0;
    if (*(char *)(param_2 + 0xe + param_3 * 4) != '\0') break;
    param_4 = param_4 + -1;
    FUN_1002aac0(param_1,param_2,param_3 * 2 + 1,param_4);
    param_3 = param_3 * 2 + 2;
    sVar2 = *(short *)(param_2 + 0xc + param_3 * 4);
  }
  iVar6 = (param_3 + 1 << (bVar5 & 0x1f)) * 0x10;
  iVar3 = *(int *)(iVar6 + -0x6c + param_2);
  iVar6 = iVar6 + -0x78 + param_2;
  uVar4 = 0;
  do {
    if (*(int *)(iVar3 + uVar4 * 4) == iVar6) {
      *(undefined4 *)(iVar3 + uVar4 * 4) = 0;
      break;
    }
    uVar4 = uVar4 + 1;
  } while (uVar4 < 4);
  *(int *)(param_1 + 0xc430) = *(int *)(param_1 + 0xc430) + (-1 << (bVar5 + 5 & 0x1f));
  *(int *)(param_1 + 0xc434) = *(int *)(param_1 + 0xc434) - (int)*(short *)(*(int *)(iVar6 + 8) + 2)
  ;
  *(undefined1 *)(param_2 + 0xe + param_3 * 4) = 0;
  return;
}


