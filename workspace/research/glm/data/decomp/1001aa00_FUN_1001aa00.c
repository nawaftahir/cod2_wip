// 1001aa00 size=75 FUN_1001aa00

undefined4 FUN_1001aa00(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_1005faf0("vertexShader",1);
  if (iVar1 != 0) {
    iVar1 = FUN_1001a810(0);
    if (iVar1 != 0) {
      *(int *)(in_EAX + 8) = iVar1;
      uVar2 = FUN_1001a920(param_1,in_EAX + 0x10,in_EAX + 0x14);
      return uVar2;
    }
  }
  return 0;
}


