// 1007a504 size=302 FUN_1007a504

int FUN_1007a504(undefined4 param_1,int param_2,undefined4 param_3,int param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 *_Memory;
  int in_ECX;
  uint uVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  int local_8;
  
  if ((param_2 != 0) &&
     ((param_4 != param_2 || ((*(byte *)(*(int *)(in_ECX + 8) + 0x70) & 4) == 0)))) {
    iVar6 = FUN_1007a632(param_2,0);
    if (iVar6 < 0) {
      return iVar6;
    }
    if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) {
      return 0;
    }
    param_2 = 0;
  }
  uVar7 = *(uint *)(*(int *)(in_ECX + 4) + 0x18);
  uVar1 = *(undefined4 *)(*(int *)(in_ECX + 8) + 8);
  uVar2 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0xc);
  _Memory = operator_new(uVar7 << 2);
  if (_Memory == (undefined4 *)0x0) {
    local_8 = -0x7ff8fff2;
  }
  else {
    puVar8 = *(undefined4 **)(in_ECX + 0x18);
    puVar9 = _Memory;
    for (uVar7 = uVar7 & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
      *puVar9 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar9 = puVar9 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar8;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    if (*(int *)(*(int *)(in_ECX + 8) + 0x5c) != 0) {
      uVar3 = *(undefined4 *)(in_ECX + 0x60);
      uVar4 = *(undefined4 *)(in_ECX + 0x58);
      uVar5 = *(undefined4 *)(in_ECX + 0x5c);
      *(undefined4 *)(in_ECX + 0x58) = 1;
      *(undefined4 *)(in_ECX + 0x5c) = 0;
      *(undefined4 *)(in_ECX + 0x60) = 0;
      local_8 = FUN_1007227c(param_1,param_2,param_3,param_4,_Memory);
      *(undefined4 *)(in_ECX + 0x4c) = 0;
      *(undefined4 *)(in_ECX + 0x50) = 0;
      *(undefined4 *)(in_ECX + 0x54) = 0;
      *(undefined4 *)(in_ECX + 0x58) = uVar4;
      *(undefined4 *)(in_ECX + 0x5c) = uVar5;
      *(undefined4 *)(in_ECX + 0x60) = uVar3;
      if (-1 < local_8) goto LAB_1007a61f;
      FUN_1006e26a(uVar1,uVar2,_Memory);
    }
    local_8 = FUN_100730ba(param_1,param_2,param_3,param_4,_Memory);
    if (-1 < local_8) {
      local_8 = 0;
    }
  }
LAB_1007a61f:
  _free(_Memory);
  return local_8;
}


