// 1001ee00 size=105 FUN_1001ee00

void FUN_1001ee00(undefined4 *param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 local_24 [6];
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  iVar2 = *(int *)(in_EAX + 0xc);
  puVar3 = param_1;
  param_1 = (undefined4 *)(int)*(short *)(in_EAX + 2);
  if (0 < *(short *)(in_EAX + 2)) {
    do {
      local_c = *(undefined4 *)(iVar2 + 0xc);
      local_8 = *(undefined4 *)(iVar2 + 0x1c);
      local_4 = *(undefined4 *)(iVar2 + 0x2c);
      FUN_1001e3a0();
      iVar2 = iVar2 + 0x40;
      param_1 = (undefined4 *)((int)param_1 + -1);
      puVar4 = local_24;
      puVar5 = puVar3;
      for (iVar1 = 9; iVar1 != 0; iVar1 = iVar1 + -1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      puVar3 = puVar3 + 9;
    } while (param_1 != (undefined4 *)0x0);
  }
  return;
}


