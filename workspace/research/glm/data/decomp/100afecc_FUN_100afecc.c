// 100afecc size=69 FUN_100afecc

undefined4 FUN_100afecc(int param_1,uint *param_2,undefined4 *param_3)

{
  byte bVar1;
  uint uVar2;
  int in_ECX;
  undefined4 uVar3;
  
  uVar2 = *(uint *)(param_1 + 0x6c);
  bVar1 = *(byte *)(param_1 + 0x6d);
  *param_2 = (uint)bVar1;
  uVar2 = uVar2 & 0xff;
  uVar3 = 1;
  if (uVar2 == 1) {
    uVar2 = *(uint *)(in_ECX + 0x28);
  }
  else {
    uVar3 = 3;
    if (uVar2 != 3) {
      return 0x80004005;
    }
    uVar2 = *(uint *)(in_ECX + 0x3c);
  }
  if (uVar2 <= bVar1) {
    return 0x80004005;
  }
  *param_3 = uVar3;
  return 0;
}


