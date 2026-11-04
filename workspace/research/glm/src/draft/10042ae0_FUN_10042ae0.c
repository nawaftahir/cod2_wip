


void FUN_10042ae0(int param_1,unsigned int *param_2,int *param_3,int param_4,int param_5)

{
  unsigned int uVar1;
  int iVar2;
  int iVar3;
  unsigned int uVar4;
  unsigned char *puVar5;
  
  uVar1 = *(unsigned int *)(param_1 + 0x24);
  iVar2 = *(int *)(param_1 + 0x2c);
  param_5 = param_5 - 1;
  if (param_5 >= 0) {
    param_1 = param_5;
    param_4 = param_4 << 2;
    do {
      iVar3 = *(int *)(*param_3 + param_4);
      puVar5 = (unsigned char *)*param_2;
      param_2 = param_2 + 1;
      param_4 = param_4 + 4;
      uVar4 = 0;
      if (uVar1 != 0) {
        do {
          *(unsigned char *)(uVar4 + iVar3) = *puVar5;
          puVar5 = puVar5 + iVar2;
          uVar4 = uVar4 + 1;
        } while (uVar4 < uVar1);
      }
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


