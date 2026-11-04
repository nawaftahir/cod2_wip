// 1008d905 size=97 FUN_1008d905

int FUN_1008d905(uint param_1,int param_2)

{
  uint *puVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  
  puVar1 = *(uint **)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + param_2 * 4);
  puVar2[0xc] = param_1;
  iVar4 = FUN_1008d884(puVar1,puVar2);
  if (-1 < iVar4) {
    uVar3 = *puVar2;
    uVar7 = *puVar1 & 0xe000000;
    uVar6 = *puVar1 & 0xf1ffffff;
    *puVar1 = uVar6;
    uVar5 = uVar3 & 0xe000000;
    if ((uVar3 & 0xe000000) < uVar7) {
      uVar5 = uVar7;
    }
    *puVar1 = uVar6 | uVar5;
    if (puVar1[0x18] == 0) {
      puVar1[0x18] = puVar2[0x18];
      puVar1[0x19] = puVar2[0x19];
    }
    iVar4 = 0;
  }
  return iVar4;
}


