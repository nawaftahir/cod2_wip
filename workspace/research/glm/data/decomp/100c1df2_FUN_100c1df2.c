// 100c1df2 size=526 FUN_100c1df2

undefined4 FUN_100c1df2(int param_1,int *param_2,uint param_3,int param_4)

{
  uint *puVar1;
  bool bVar2;
  undefined4 uVar3;
  uint uVar4;
  int in_ECX;
  int *piVar5;
  uint local_c;
  int local_8;
  
  if (param_3 < 0x1f) {
    if (*(uint *)(in_ECX + 0xfc) < *(uint *)(in_ECX + 0xc)) {
      do {
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4);
        uVar4 = *puVar1 & 0xfff00000;
        if ((uVar4 == 0x73400000) ||
           ((param_4 != 0 && ((uVar4 == 0x73100000 || (uVar4 == 0x73300000)))))) break;
        if ((uVar4 == 0x73000000) ||
           (((uVar4 == 0x73300000 || (uVar4 == 0x73100000)) || (uVar4 == 0x73200000)))) {
          local_8 = 1;
          if ((uVar4 == 0x73100000) || (uVar4 == 0x73200000)) {
            local_8 = 0;
          }
          bVar2 = false;
          if (param_3 != 0) {
            local_c = param_3;
            piVar5 = param_2;
            do {
              piVar5 = piVar5 + 1;
              if ((*(int *)puVar1[4] == *(int *)((param_1 - (int)param_2) + (int)piVar5)) &&
                 (*piVar5 == local_8)) {
                bVar2 = true;
              }
              local_c = local_c - 1;
            } while (local_c != 0);
            if (bVar2) {
              if ((uVar4 == 0x73000000) || (uVar4 == 0x73200000)) {
                *puVar1 = 0;
              }
              else {
                *puVar1 = 0x73400000;
              }
              *(int *)(in_ECX + 0xfc) = *(int *)(in_ECX + 0xfc) + 1;
              *(undefined4 *)(param_1 + 4 + param_3 * 4) = *(undefined4 *)(param_1 + param_3 * 4);
              (param_2 + param_3)[1] = param_2[param_3];
              FUN_100c1df2(param_1,param_2,param_3 + 1,1);
              puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4);
              uVar4 = *puVar1 & 0xfff00000;
              if (uVar4 == 0x73400000) {
                *puVar1 = 0;
              }
              else if (uVar4 == 0x73100000) {
                *puVar1 = 0x73200001;
              }
              else if (uVar4 == 0x73300000) {
                *puVar1 = 0x73000001;
              }
              goto LAB_100c1faa;
            }
          }
          if ((uVar4 == 0x73000000) || (uVar4 == 0x73200000)) {
            *(int *)(in_ECX + 0xfc) = *(int *)(in_ECX + 0xfc) + 1;
            *(undefined4 *)(param_1 + 4 + param_3 * 4) = *(undefined4 *)puVar1[4];
            param_2[param_3 + 1] = local_8;
            FUN_100c1df2(param_1,param_2,param_3 + 1,0);
          }
        }
LAB_100c1faa:
        if (*(uint *)(in_ECX + 0xc) <= *(uint *)(in_ECX + 0xfc)) {
          return 0x80004005;
        }
        uVar4 = **(uint **)(*(int *)(in_ECX + 0x18) + *(uint *)(in_ECX + 0xfc) * 4) & 0xfff00000;
        if ((uVar4 == 0x73100000) || (uVar4 == 0x73300000)) {
          param_2[param_3] = (uint)(param_2[param_3] == 0);
        }
        *(int *)(in_ECX + 0xfc) = *(int *)(in_ECX + 0xfc) + 1;
      } while (*(uint *)(in_ECX + 0xfc) < *(uint *)(in_ECX + 0xc));
    }
    uVar3 = 0;
  }
  else {
    uVar3 = 0x80004005;
  }
  return uVar3;
}


