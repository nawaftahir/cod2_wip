// 10049e00 size=310 FUN_10049e00

void FUN_10049e00(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_EAX;
  undefined4 *puVar5;
  int in_ECX;
  int iVar6;
  int *in_EDX;
  int *piVar7;
  
  in_EDX[1] = 0;
  if (in_EAX != 0x3e) {
    *(undefined4 *)(*in_EDX + 0x14) = 0xc;
    *(undefined4 *)(*in_EDX + 0x18) = 0x3e;
    *(int *)(*in_EDX + 0x1c) = in_EAX;
    (**(code **)*in_EDX)();
  }
  if (in_ECX != 0x1b8) {
    *(undefined4 *)(*in_EDX + 0x14) = 0x15;
    *(undefined4 *)(*in_EDX + 0x18) = 0x1b8;
    *(int *)(*in_EDX + 0x1c) = in_ECX;
    (**(code **)*in_EDX)();
  }
  iVar1 = in_EDX[6];
  iVar2 = in_EDX[7];
  iVar3 = *in_EDX;
  iVar4 = in_EDX[3];
  piVar7 = in_EDX;
  for (iVar6 = 0x6e; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar7 = 0;
    piVar7 = piVar7 + 1;
  }
  *in_EDX = iVar3;
  in_EDX[3] = iVar4;
  in_EDX[6] = iVar1;
  in_EDX[7] = iVar2;
  *(undefined1 *)(in_EDX + 4) = 1;
  FUN_10055840();
  in_EDX[2] = 0;
  in_EDX[8] = 0;
  in_EDX[0x26] = 0;
  in_EDX[0x27] = 0;
  in_EDX[0x28] = 0;
  in_EDX[0x29] = 0;
  in_EDX[0x2a] = 0;
  in_EDX[0x2e] = 0;
  in_EDX[0x2b] = 0;
  in_EDX[0x2f] = 0;
  in_EDX[0x2c] = 0;
  in_EDX[0x30] = 0;
  in_EDX[0x2d] = 0;
  in_EDX[0x31] = 0;
  in_EDX[0x45] = 0;
  FUN_1004f7c0();
  puVar5 = (undefined4 *)(**(code **)in_EDX[1])();
  in_EDX[0x66] = (int)puVar5;
  *(undefined1 *)(puVar5 + 4) = 0;
  *(undefined1 *)((int)puVar5 + 0x11) = 0;
  *puVar5 = FUN_1004d460;
  puVar5[1] = FUN_1004d520;
  puVar5[2] = FUN_1004d400;
  puVar5[3] = &LAB_1004d440;
  *(undefined1 *)(puVar5 + 5) = 1;
  in_EDX[5] = 200;
  return;
}


