// 1007b4e5 size=262 FUN_1007b4e5

uint FUN_1007b4e5(void)

{
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  int *in_ECX;
  int iVar4;
  
  iVar1 = in_ECX[1];
  if ((iVar1 == 0) || (*(int *)(iVar1 + 4) != 4)) {
    uVar2 = 0;
  }
  else if (in_ECX[2] == 0) {
    uVar2 = 0x80004005;
  }
  else {
    uVar2 = FUN_1008b39f(iVar1,*in_ECX + 0x18,in_ECX[4],in_ECX[5]);
    if (-1 < (int)uVar2) {
      _free((void *)in_ECX[6]);
      puVar3 = operator_new(*(int *)(iVar1 + 0x18) << 2);
      in_ECX[6] = (int)puVar3;
      if (puVar3 == (undefined4 *)0x0) {
        uVar2 = 0x8007000e;
      }
      else {
        for (uVar2 = *(uint *)(iVar1 + 0x18) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar3 = 0xffffffff;
          puVar3 = puVar3 + 1;
        }
        for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
          *(undefined1 *)puVar3 = 0xff;
          puVar3 = (undefined4 *)((int)puVar3 + 1);
        }
        iVar4 = FUN_10086139(*(undefined4 *)(in_ECX[2] + 0x78),0,0,0x3ff0000000000000);
        in_ECX[8] = iVar4;
        iVar4 = FUN_10086139(*(undefined4 *)(in_ECX[2] + 0x78),0,0,0);
        in_ECX[9] = iVar4;
        iVar4 = FUN_10086139(*(undefined4 *)(in_ECX[2] + 0x78),0,0,0xbff0000000000000);
        in_ECX[0xc] = -1;
        in_ECX[10] = iVar4;
        in_ECX[0xb] = in_ECX[8];
        in_ECX[0xd] = 1;
        uVar2 = FUN_1007a632(*(undefined4 *)(iVar1 + 0x1c),0);
        if (-1 < (int)uVar2) {
          uVar2 = -(uint)(in_ECX[0x13] != 0) & 0x80004005;
        }
      }
    }
  }
  return uVar2;
}


