// 100b0384 size=94 FUN_100b0384

undefined4 FUN_100b0384(int param_1,uint *param_2,undefined4 *param_3,undefined4 *param_4)

{
  uint uVar1;
  uint uVar2;
  
  uVar1 = *(uint *)(param_1 + 0x6c);
  uVar2 = (uint)*(byte *)(param_1 + 0x6d);
  *param_2 = uVar2;
  uVar1 = uVar1 & 0xff;
  if (uVar1 == 1) {
    if (uVar2 != 0) {
      return 0x80004005;
    }
    *param_3 = 0;
    if (param_4 != (undefined4 *)0x0) {
      *param_4 = 0;
    }
  }
  else {
    if (uVar1 != 2) {
      return 0x80004005;
    }
    if (uVar2 != 0) {
      return 0x80004005;
    }
    *param_3 = 9;
    if (param_4 != (undefined4 *)0x0) {
      *param_4 = 1;
    }
  }
  return 0;
}


