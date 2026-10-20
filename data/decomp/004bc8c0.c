
void FUN_004bc8c0(undefined4 *param_1,int *param_2)

{
  int iVar1;
  uint uVar2;
  byte bStack_8;
  byte bStack_7;
  byte bStack_6;
  byte bStack_5;
  byte bStack_4;
  
  iVar1 = param_1[1];
  if (0x1ffffffe < iVar1) {
    FUN_004becd0(&DAT_00563358);
    return;
  }
  bStack_7 = (byte)iVar1;
  uVar2 = iVar1 >> 0x1f;
  bStack_6 = (byte)(iVar1 + (uVar2 & 0xff) >> 8);
  bStack_5 = (byte)(iVar1 + (uVar2 & 0xffff) >> 0x10);
  bStack_4 = (byte)(iVar1 + (uVar2 & 0xffffff) >> 0x18);
  bStack_8 = bStack_4 ^ bStack_5 ^ bStack_6 ^ bStack_7;
  FUN_004bc380(&bStack_8,5,param_2);
  if (*param_2 < 2) {
    FUN_004bc380(*param_1,param_1[1],param_2);
  }
  return;
}

