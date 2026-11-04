// 1006d5d9 size=404 FUN_1006d5d9

bool FUN_1006d5d9(int *param_1,int *param_2,uint param_3,uint param_4)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  int *piVar3;
  bool bVar4;
  uint local_c;
  int *local_8;
  
  if (param_2 == (int *)0x2) {
    bVar4 = false;
    if (param_3 * param_4 != 0) {
      local_c = 0;
      if (param_4 != 0) {
        piVar3 = param_1;
        do {
          iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar3 * 4);
          param_2 = (int *)0x0;
          if (param_3 != 0) {
            local_8 = piVar3;
            do {
              iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *local_8 * 4);
              if (*(int *)(iVar1 + 4) != *(int *)(iVar2 + 4)) goto LAB_1006d75f;
              if ((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                     *(int *)(iVar1 + 4) * 4) + 4) & 0x40) == 0) {
                bVar4 = *(int *)(iVar1 + 0x48) == *(int *)(iVar2 + 0x48);
              }
              else {
                if (((uint)param_2 >> 2) + *(int *)(iVar1 + 0xc) != *(int *)(iVar2 + 0xc))
                goto LAB_1006d75f;
                bVar4 = ((uint)param_2 & 3) + *(int *)(iVar1 + 0x10) == *(int *)(iVar2 + 0x10);
              }
              if (!bVar4) goto LAB_1006d75f;
              param_2 = (int *)((int)param_2 + 1);
              local_8 = local_8 + param_4;
            } while (param_2 < param_3);
          }
          local_c = local_c + 1;
          piVar3 = piVar3 + 1;
        } while (local_c < param_4);
      }
      local_c = 0;
      if (param_3 != 0) {
        piVar3 = param_1;
        do {
          iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar3 * 4);
          param_1 = (int *)0x0;
          if (param_4 != 0) {
            param_2 = piVar3;
            do {
              iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *param_2 * 4);
              if (*(int *)(iVar1 + 4) != *(int *)(iVar2 + 4)) {
                return false;
              }
              if ((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                     *(int *)(iVar1 + 4) * 4) + 4) & 0x40) == 0) {
                bVar4 = *(int *)(iVar1 + 0x48) == *(int *)(iVar2 + 0x48);
              }
              else {
                if (((uint)param_1 >> 2) + *(int *)(iVar1 + 0xc) != *(int *)(iVar2 + 0xc)) {
                  return false;
                }
                bVar4 = ((uint)param_1 & 3) + *(int *)(iVar1 + 0x10) == *(int *)(iVar2 + 0x10);
              }
              if (!bVar4) {
                return false;
              }
              param_1 = (int *)((int)param_1 + 1);
              param_2 = param_2 + 1;
            } while (param_1 < param_4);
          }
          local_c = local_c + 1;
          piVar3 = piVar3 + param_4;
        } while (local_c < param_3);
      }
LAB_1006d75f:
      bVar4 = true;
    }
  }
  else {
    bVar4 = param_3 == 1;
  }
  return bVar4;
}


