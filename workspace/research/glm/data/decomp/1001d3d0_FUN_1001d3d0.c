// 1001d3d0 size=108 FUN_1001d3d0

void FUN_1001d3d0(undefined4 param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int in_EAX;
  undefined4 *in_ECX;
  
  uVar1 = *(undefined4 *)(in_EAX + -0xc);
  uVar2 = *(undefined4 *)(in_EAX + -8);
  uVar3 = *(undefined4 *)(in_EAX + -4);
  *(undefined4 *)(in_EAX + -0xc) = *in_ECX;
  *(undefined4 *)(in_EAX + -8) = in_ECX[1];
  *(undefined4 *)(in_EAX + -4) = in_ECX[2];
  FUN_1001d320(((in_EAX - (int)in_ECX) + -0xc) / 0xc,uVar1,uVar2,uVar3,param_1);
  return;
}


