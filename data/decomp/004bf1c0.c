
void __thiscall FUN_004bf1c0(undefined4 *param_1,uint param_2)

{
  undefined4 *_Memory;
  int iVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  uint uVar4;
  undefined4 *puVar5;
  
  _Memory = (undefined4 *)*param_1;
  iVar1 = param_1[1];
  param_1[2] = iVar1;
  if (_Memory != (undefined4 *)&DAT_00598c80) {
    iVar1 = (iVar1 * 3 + 0x5a) / 2;
    param_1[2] = iVar1;
    puVar2 = (undefined4 *)FUN_004ff450(iVar1);
    *param_1 = puVar2;
    puVar5 = _Memory;
    for (uVar4 = param_2 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar2 = *puVar5;
      puVar5 = puVar5 + 1;
      puVar2 = puVar2 + 1;
    }
    for (param_2 = param_2 & 3; param_2 != 0; param_2 = param_2 - 1) {
      *(undefined1 *)puVar2 = *(undefined1 *)puVar5;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
      puVar2 = (undefined4 *)((int)puVar2 + 1);
    }
    _free(_Memory);
    return;
  }
  if (iVar1 < 0x1000) {
    param_1[2] = iVar1 + 1;
  }
  uVar3 = FUN_004ff450(param_1[2]);
  *param_1 = uVar3;
  return;
}

