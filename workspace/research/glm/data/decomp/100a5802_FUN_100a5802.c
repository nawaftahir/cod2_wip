// 100a5802 size=71 FUN_100a5802

undefined4 FUN_100a5802(int *param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  int iVar1;
  undefined4 uVar2;
  int *in_ECX;
  
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(*(int *)(in_ECX[5] + *param_1 * 4) + 0x6c));
  if (iVar1 == 0x11) {
    *param_4 = 0xe40000;
    uVar2 = 0;
  }
  else {
    uVar2 = FUN_100c48ff(param_1,param_2,param_3,param_4);
  }
  return uVar2;
}


