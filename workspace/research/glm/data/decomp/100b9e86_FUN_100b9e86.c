// 100b9e86 size=375 FUN_100b9e86

uint FUN_100b9e86(void)

{
  uint uVar1;
  uint *puVar2;
  uint *puVar3;
  bool bVar4;
  int iVar5;
  int *piVar6;
  int *in_ECX;
  char cVar7;
  undefined1 local_210 [256];
  undefined1 local_110 [256];
  uint local_10;
  uint local_c;
  char local_5;
  
  bVar4 = false;
  local_5 = '\0';
  local_c = 0;
  if (in_ECX[2] != 0) {
    do {
      iVar5 = *(int *)(in_ECX[5] + local_c * 4);
      uVar1 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar5 + 4) * 4) + 4);
      if (((((uVar1 & 0x10) != 0) && ((uVar1 & 0x200) == 0)) || ((uVar1 & 0x20) != 0)) &&
         (iVar5 = (**(code **)(*in_ECX + 4))(iVar5,0), iVar5 < 0)) {
        FUN_100b9e11(&local_c);
        local_5 = '\x01';
        bVar4 = true;
      }
      local_c = local_c + 1;
    } while (local_c < (uint)in_ECX[2]);
    if (bVar4) {
      return 0x80004005;
    }
  }
  cVar7 = '\0';
  local_c = 0;
  if (in_ECX[2] != 0) {
    do {
      puVar2 = *(uint **)(in_ECX[5] + local_c * 4);
      uVar1 = *(uint *)(*(int *)(in_ECX[4] + puVar2[1] * 4) + 4);
      if (((((uVar1 & 0x10) != 0) && ((uVar1 & 0x200) == 0)) || ((uVar1 & 0x20) != 0)) &&
         (local_10 = local_c + 1, local_10 < (uint)in_ECX[2])) {
        piVar6 = (int *)(in_ECX[5] + local_10 * 4);
        do {
          puVar3 = (uint *)*piVar6;
          if (((puVar3[1] == puVar2[1]) && (puVar3[0x1c] == puVar2[0x1c])) &&
             ((puVar3[0x1b] == puVar2[0x1b] && (((*puVar2 ^ *puVar3) & 0x1000000) != 0)))) {
            FUN_10086472(puVar2,local_210,0x100);
            FUN_10086472(puVar3,local_110,0x100);
            FUN_1008b0b5();
            FUN_100b9e11(&local_c);
            local_5 = '\x01';
            cVar7 = local_5;
            break;
          }
          local_10 = local_10 + 1;
          piVar6 = piVar6 + 1;
          cVar7 = local_5;
        } while (local_10 < (uint)in_ECX[2]);
      }
      local_c = local_c + 1;
    } while (local_c < (uint)in_ECX[2]);
  }
  return -(uint)(cVar7 != '\0') & 0x80004005;
}


