// 100caeda size=166 FUN_100caeda

int FUN_100caeda(void)

{
  int iVar1;
  int *in_ECX;
  uint uVar2;
  int local_18 [4];
  int *local_8;
  
  local_8 = (int *)((uint *)in_ECX[0x40])[4];
  uVar2 = *(uint *)in_ECX[0x40] & 0xfffff;
  if (in_ECX[0x22] != *(int *)(*(int *)(in_ECX[5] + *local_8 * 4) + 4)) {
    iVar1 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_18,uVar2,0,0);
    if (iVar1 < 0) {
      return iVar1;
    }
    local_8 = local_18;
  }
  iVar1 = FUN_100c9a7f(0x24,local_8,uVar2,*(undefined4 *)(in_ECX[0x40] + 8),0,0,uVar2,0,0,0,0);
  if (-1 < iVar1) {
    if ((local_8 == local_18) &&
       (iVar1 = FUN_100c9a7f(1,*(undefined4 *)(in_ECX[0x40] + 0x10),uVar2,local_18,0,0,uVar2,0,0,0,0
                            ), iVar1 < 0)) {
      return iVar1;
    }
    iVar1 = 0;
  }
  return iVar1;
}


