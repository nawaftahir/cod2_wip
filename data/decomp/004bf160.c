
void __thiscall FUN_004bf160(int *param_1,int param_2)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  
  bVar3 = param_2 < 0;
  *param_1 = (int)(param_1 + 8);
  if (bVar3) {
    param_2 = -param_2;
  }
  *param_1 = (int)param_1 + 0x1f;
  *(undefined1 *)((int)param_1 + 0x1f) = 0;
  do {
    iVar1 = *param_1;
    *param_1 = iVar1 + -1;
    iVar2 = param_2 / 10;
    *(char *)(iVar1 + -1) = (char)(param_2 % 10) + '0';
    param_2 = iVar2;
  } while (iVar2 != 0);
  if (bVar3) {
    iVar1 = *param_1;
    *param_1 = iVar1 + -1;
    *(undefined1 *)(iVar1 + -1) = 0x2d;
  }
  param_1[1] = (int)param_1 + (0x1f - *param_1);
  return;
}

