// 1001ed70 size=137 FUN_1001ed70

void FUN_1001ed70(void)

{
  int in_EAX;
  undefined4 *in_ECX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 *local_5c;
  int local_58;
  undefined4 local_50 [7];
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  
  iVar2 = *(int *)(in_EAX + 0xc);
  local_58 = (int)*(short *)(in_EAX + 2);
  local_5c = in_ECX;
  if (0 < local_58) {
    do {
      local_34 = *(undefined4 *)(iVar2 + 0xc);
      local_30 = *(undefined4 *)(iVar2 + 0x1c);
      local_2c = *(undefined4 *)(iVar2 + 0x2c);
      FUN_1001e260(iVar2 + 0x30,iVar2 + 0x20);
      iVar2 = iVar2 + 0x40;
      local_58 = local_58 + -1;
      puVar3 = local_50;
      puVar4 = local_5c;
      for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      local_5c = local_5c + 0x10;
    } while (local_58 != 0);
  }
  return;
}


