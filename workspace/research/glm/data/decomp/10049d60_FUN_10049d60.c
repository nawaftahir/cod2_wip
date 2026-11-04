// 10049d60 size=159 FUN_10049d60

void FUN_10049d60(undefined4 param_1)

{
  int in_EAX;
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 *puVar4;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(in_EAX + 4))();
  *(undefined4 **)(in_EAX + 0x150) = puVar1;
  *puVar1 = &LAB_10049a60;
  puVar1[1] = &LAB_10049ad0;
  puVar1[6] = param_1;
  puVar2 = (undefined4 *)(**(code **)(*(int *)(in_EAX + 4) + 4))();
  puVar4 = puVar2;
  for (iVar3 = 0x140; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  puVar1[8] = puVar2 + 0x20;
  puVar1[9] = puVar2 + 0x40;
  puVar1[10] = puVar2 + 0x60;
  puVar1[0xb] = puVar2 + 0x80;
  puVar1[0xc] = puVar2 + 0xa0;
  puVar1[0xd] = puVar2 + 0xc0;
  puVar1[7] = puVar2;
  puVar1[0xe] = puVar2 + 0xe0;
  puVar1[0xf] = puVar2 + 0x100;
  puVar1[0x10] = puVar2 + 0x120;
  return;
}


