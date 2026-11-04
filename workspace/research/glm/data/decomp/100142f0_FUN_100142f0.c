// 100142f0 size=113 FUN_100142f0

void FUN_100142f0(undefined4 param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int in_EAX;
  undefined4 *in_ECX;
  
  uVar1 = *(undefined4 *)(in_EAX + -0x10);
  uVar2 = *(undefined4 *)(in_EAX + -0xc);
  uVar3 = *(undefined4 *)(in_EAX + -8);
  uVar4 = *(undefined4 *)(in_EAX + -4);
  *(undefined4 *)(in_EAX + -0x10) = *in_ECX;
  *(undefined4 *)(in_EAX + -0xc) = in_ECX[1];
  *(undefined4 *)(in_EAX + -8) = in_ECX[2];
  *(undefined4 *)(in_EAX + -4) = in_ECX[3];
  FUN_10014230((in_EAX - (int)in_ECX) + -0x10 >> 4,uVar1,uVar2,uVar3,uVar4,param_1);
  return;
}


