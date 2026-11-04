// 100845a4 size=87 FUN_100845a4

undefined4 FUN_100845a4(undefined4 param_1,uint param_2,undefined4 param_3)

{
  undefined4 *_Memory;
  int iVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  
  _Memory = operator_new(param_2 << 4);
  if (_Memory == (undefined4 *)0x0) {
    uVar2 = 0x8007000e;
  }
  else {
    puVar3 = _Memory;
    for (iVar1 = (param_2 & 0xfffffff) << 2; iVar1 != 0; iVar1 = iVar1 + -1) {
      *puVar3 = 0;
      puVar3 = puVar3 + 1;
    }
    for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
      *(undefined1 *)puVar3 = 0;
      puVar3 = (undefined4 *)((int)puVar3 + 1);
    }
    uVar2 = FUN_100840db(_Memory,param_2 << 4,6,param_3);
  }
  _free(_Memory);
  return uVar2;
}


