
void __fastcall FUN_004bbb40(int *param_1)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  
  iVar1 = param_1[1] - param_1[3];
  iVar3 = *param_1 + param_1[3];
  *(char *)(iVar3 + -4) = (char)iVar1;
  uVar2 = iVar1 >> 0x1f;
  *(char *)(iVar3 + -3) = (char)(iVar1 + (uVar2 & 0xff) >> 8);
  *(char *)(iVar3 + -2) = (char)(iVar1 + (uVar2 & 0xffff) >> 0x10);
  *(char *)(iVar3 + -1) = (char)(iVar1 + (uVar2 & 0xffffff) >> 0x18);
  iVar1 = param_1[1];
  param_1[1] = iVar1 + 1;
  if (param_1[2] < iVar1 + 1) {
    FUN_004bf1c0(iVar1);
  }
  *(undefined1 *)(iVar1 + *param_1) = 0;
  param_1[3] = 0;
  return;
}

