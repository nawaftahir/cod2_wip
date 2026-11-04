// 1001aa50 size=75 FUN_1001aa50

undefined4 FUN_1001aa50(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_1005faf0("pixelShader",1);
  if (iVar1 != 0) {
    iVar1 = FUN_1001a810(1);
    if (iVar1 != 0) {
      *(int *)(in_EAX + 0xc) = iVar1;
      uVar2 = FUN_1001a920(param_1,in_EAX + 0x12,in_EAX + 0x18);
      return uVar2;
    }
  }
  return 0;
}


