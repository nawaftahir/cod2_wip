
undefined4 * FUN_00457ce0(undefined4 *param_1)

{
  int in_EAX;
  undefined *puVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 local_c;
  int local_8;
  
  puVar1 = (undefined *)(in_EAX + 0x24);
  if (in_EAX == 0) {
    puVar1 = &DAT_0053dd34;
  }
  (*DAT_0059c468)(puVar1,&local_c);
  puVar2 = (undefined4 *)FUN_004ff450(0x48);
  puVar7 = puVar2;
  for (iVar5 = 0x12; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar7 = 0;
    puVar7 = puVar7 + 1;
  }
  puVar2[0xe] = 6;
  if ((in_EAX != 0) && ((*(byte *)(in_EAX + 0x160) & 1) != 0)) {
    puVar2[0xe] = 8;
  }
  uVar3 = FUN_00454630();
  puVar2[0xf] = uVar3;
  iVar5 = 0;
  if (0 < (int)puVar2[0xe]) {
    local_8 = 0;
    do {
      iVar4 = puVar2[0xf] + local_8;
      puVar7 = param_1;
      puVar8 = (undefined4 *)(iVar4 + 0x24);
      for (iVar6 = 7; iVar6 != 0; iVar6 = iVar6 + -1) {
        *puVar8 = *puVar7;
        puVar7 = puVar7 + 1;
        puVar8 = puVar8 + 1;
      }
      *(undefined4 *)(iVar4 + 0xa4) = local_c;
      *(uint *)(iVar4 + 0x78) = *(uint *)(iVar4 + 0x78) & 0xf7ffdf7b;
      iVar5 = iVar5 + 1;
      local_8 = local_8 + 0xa8;
    } while (iVar5 < (int)puVar2[0xe]);
  }
  iVar5 = 0;
  if (0 < (int)puVar2[0xe]) {
    iVar4 = 0;
    do {
      FUN_00456f30(puVar2[0xf] + iVar4,0,0x41800000);
      iVar5 = iVar5 + 1;
      iVar4 = iVar4 + 0xa8;
    } while (iVar5 < (int)puVar2[0xe]);
  }
  return puVar2;
}

