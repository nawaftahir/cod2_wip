extern int FUN_100840db();


unsigned int FUN_100845a4(unsigned int param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int *_Memory;
  int iVar1;
  unsigned int uVar2;
  unsigned int *puVar3;
  
  _Memory = operator_new(param_2 << 4);
  if (_Memory == (unsigned int *)0x0) {
    uVar2 = 0x8007000e;
  }
  else {
    puVar3 = _Memory;
    for (iVar1 = (param_2 & 0xfffffff) << 2; iVar1 != 0; iVar1 = iVar1 + -1) {
      *puVar3 = 0;
      puVar3 = puVar3 + 1;
    }
    for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
      *(unsigned char *)puVar3 = 0;
      puVar3 = (unsigned int *)((int)puVar3 + 1);
    }
    uVar2 = FUN_100840db(_Memory,param_2 << 4,6,param_3);
  }
  _free(_Memory);
  return uVar2;
}


