// 100b3610 size=220 FUN_100b3610

void FUN_100b3610(void)

{
  uint *puVar1;
  int iVar2;
  int *in_ECX;
  uint uVar3;
  int local_54 [4];
  int local_44 [4];
  undefined4 local_34 [4];
  undefined4 local_24 [4];
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  puVar1 = (uint *)in_ECX[0x40];
  local_c = puVar1[3];
  local_14 = puVar1[4];
  local_10 = puVar1[2];
  uVar3 = *puVar1 & 0xfffff;
  iVar2 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_34,4,0,0);
  if (-1 < iVar2) {
    local_8 = 0;
    do {
      local_44[local_8] = in_ECX[0x88];
      local_54[local_8] = in_ECX[0x89];
      if (local_8 < local_c) {
        local_24[local_8] =
             local_34[*(int *)(*(int *)(in_ECX[5] + *(int *)(local_8 * 4 + local_14) * 4) + 0x10)];
      }
      local_8 = local_8 + 1;
    } while (local_8 < 4);
    FUN_100c9a7f(2,local_24,local_c,local_10,local_10 + uVar3 * 4,0,uVar3,0,0x1000000,0,0);
    FUN_100c9a7f(0x58,local_14,local_c,local_24,local_54,local_44,uVar3,0,0,0,0);
  }
  return;
}


