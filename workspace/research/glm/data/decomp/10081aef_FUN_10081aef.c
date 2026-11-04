// 10081aef size=27 FUN_10081aef

void FUN_10081aef(void)

{
  int iVar1;
  undefined4 *in_ECX;
  
  iVar1 = in_ECX[3];
  *in_ECX = &PTR_FUN_1010ff18;
  if (iVar1 != 0) {
    in_ECX[3] = iVar1 - (uint)*(byte *)(iVar1 + -1);
  }
  FUN_10081a02();
  return;
}


