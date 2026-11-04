// 1006eb1e size=103 FUN_1006eb1e

undefined4 FUN_1006eb1e(undefined4 param_1,int param_2,int param_3)

{
  uint *puVar1;
  uint *_Memory;
  undefined4 uVar2;
  int in_ECX;
  uint *puVar3;
  
  _Memory = operator_new(param_3 << 2);
  if (_Memory == (uint *)0x0) {
    uVar2 = 0x8007000e;
  }
  else {
    FUN_1006ddf3(param_1,_Memory);
    if (param_3 != 0) {
      puVar3 = _Memory;
      do {
        puVar1 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                           *(int *)((param_2 - (int)_Memory) + (int)puVar3) * 4);
        *puVar1 = *puVar1 | *puVar3;
        puVar3 = puVar3 + 1;
        param_3 = param_3 + -1;
      } while (param_3 != 0);
    }
    _free(_Memory);
    uVar2 = 0;
  }
  return uVar2;
}


