// 100cb84b size=179 FUN_100cb84b

int FUN_100cb84b(void)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  undefined4 uVar3;
  undefined1 local_c [4];
  undefined1 local_8 [4];
  
  uVar1 = *(uint *)in_ECX[0x40] & 0xfffff;
  if (uVar1 == 1) {
    uVar3 = 5;
  }
  else if (uVar1 == 3) {
    uVar3 = 8;
  }
  else {
    if (uVar1 != 4) {
      iVar2 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_c,2,0,0);
      if (iVar2 < 0) {
        return iVar2;
      }
      iVar2 = FUN_100c9a7f(5,local_c,2,*(int *)(in_ECX[0x40] + 8),*(int *)(in_ECX[0x40] + 8) + 8,0,2
                           ,0,0,0,0);
      if (iVar2 < 0) {
        return iVar2;
      }
      iVar2 = FUN_100c9a7f(2,*(undefined4 *)(in_ECX[0x40] + 0x10),
                           *(undefined4 *)(in_ECX[0x40] + 0xc),local_c,local_8,0,1,0,0,0,0);
      if (iVar2 < 0) {
        return iVar2;
      }
      return 0;
    }
    uVar3 = 9;
  }
  iVar2 = FUN_100cb270(uVar3,0);
  return iVar2;
}


