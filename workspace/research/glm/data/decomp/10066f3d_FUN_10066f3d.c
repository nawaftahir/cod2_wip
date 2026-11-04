// 10066f3d size=126 FUN_10066f3d

int FUN_10066f3d(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  void *pvVar1;
  int iVar2;
  int in_ECX;
  
  pvVar1 = operator_new(0x70);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10063a97();
  }
  *(int *)(in_ECX + 0x268) = iVar2;
  if (iVar2 == 0) {
    iVar2 = -0x7ff8fff2;
  }
  else {
    iVar2 = FUN_10063b46(param_1,param_2,in_ECX,in_ECX + 0x278,in_ECX + 0x18,param_4,0,0);
    if ((-1 < iVar2) && (iVar2 = FUN_100663c0(param_3), -1 < iVar2)) {
      *(undefined4 *)(in_ECX + 0x26c) = *(undefined4 *)(in_ECX + 0x268);
      *(undefined4 *)(in_ECX + 0x270) = param_4;
      iVar2 = 0;
    }
  }
  return iVar2;
}


