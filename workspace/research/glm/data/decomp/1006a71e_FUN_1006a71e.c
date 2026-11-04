// 1006a71e size=89 FUN_1006a71e

int FUN_1006a71e(undefined4 *param_1)

{
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  int *in_ECX;
  uint uVar4;
  undefined4 *puVar5;
  int *local_8;
  
  local_8 = in_ECX;
  iVar1 = FUN_10081d1e(in_ECX[0x17] << 2,&local_8);
  if (-1 < iVar1) {
    uVar2 = (**(code **)(*local_8 + 0x10))(local_8);
    puVar5 = (undefined4 *)in_ECX[0x16];
    puVar3 = (undefined4 *)(**(code **)(*local_8 + 0xc))(local_8);
    for (uVar4 = uVar2 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar3 = *puVar5;
      puVar5 = puVar5 + 1;
      puVar3 = puVar3 + 1;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *(undefined1 *)puVar3 = *(undefined1 *)puVar5;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
      puVar3 = (undefined4 *)((int)puVar3 + 1);
    }
    *param_1 = local_8;
    iVar1 = 0;
  }
  return iVar1;
}


