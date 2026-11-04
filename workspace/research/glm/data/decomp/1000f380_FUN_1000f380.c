// 1000f380 size=537 FUN_1000f380

void FUN_1000f380(int *param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  int in_EAX;
  int in_ECX;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int local_68 [6];
  int aiStack_50 [6];
  int aiStack_38 [6];
  undefined2 local_20;
  undefined2 local_1e;
  undefined4 local_1c;
  int local_18;
  int local_14;
  int local_c;
  int local_8;
  undefined1 local_4;
  
  FUN_1000ee30((int)*(short *)(in_ECX + 6),(int)*(short *)(in_ECX + 8),(int)*(short *)(in_ECX + 10),
               *(undefined1 *)(in_ECX + 5),0);
  local_18 = (int)*(short *)(in_ECX + 6);
  local_14 = (int)*(short *)(in_ECX + 8);
  local_20 = 0;
  local_1e = 0;
  iVar7 = 1;
  if ((*(byte *)(in_ECX + 5) & 2) == 0) {
    for (iVar4 = 1; ((iVar4 < local_18 || (iVar4 < local_14)) || (iVar4 < *(short *)(in_ECX + 10)));
        iVar4 = iVar4 << 1) {
      iVar7 = iVar7 + 1;
    }
  }
  local_8 = iVar7 + -1;
  local_4 = 0;
  local_c = in_EAX;
  if (in_EAX == 3) {
    local_c = 4;
  }
  iVar7 = local_18 * local_14 * local_c;
  uVar5 = (*param_1 != 5) - 1 & 5;
  iVar4 = uVar5 + 1;
  iVar6 = 0;
  if (iVar4 != 0) {
    piVar8 = local_68;
    for (iVar3 = iVar4; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar8 = 0;
      piVar8 = piVar8 + 1;
    }
    do {
      iVar3 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(iVar7);
      aiStack_50[iVar6] = iVar3;
      iVar6 = iVar6 + 1;
    } while (iVar6 < iVar4);
  }
  local_1c = param_2;
  if ((int)(uint)*(byte *)(param_1 + 2) <= local_8) {
    do {
      iVar3 = local_18 >> ((byte)local_8 & 0x1f);
      iVar6 = 1;
      if (1 - iVar3 < 0) {
        iVar6 = iVar3;
      }
      iVar3 = local_14 >> ((byte)local_8 & 0x1f);
      if (-1 < 1 - iVar3) {
        iVar3 = 1;
      }
      iVar6 = iVar3 * iVar6 * local_c;
      iVar3 = 0;
      if (iVar4 != 0) {
        do {
          iVar2 = local_68[iVar3];
          iVar1 = (aiStack_50[iVar3] - iVar6) + iVar7;
          aiStack_38[iVar3] = iVar2;
          local_68[iVar3] = iVar1;
          FUN_10010d40(iVar2,iVar1);
          if (*param_1 == 4) {
            FUN_1000ec00(param_1,param_3,local_8 - (uint)*(byte *)(param_1 + 2),iVar1);
          }
          else if (((*param_1 != 5) || (local_8 - (uint)*(byte *)(param_1 + 2) == 0)) ||
                  (DAT_101d496b != '\0')) {
            FUN_1000ea20(param_3,iVar1);
          }
          iVar3 = iVar3 + 1;
        } while (iVar3 < iVar4);
      }
      local_8 = local_8 + -1;
    } while ((int)(uint)*(byte *)(param_1 + 2) <= local_8);
  }
  for (; -1 < (int)uVar5; uVar5 = uVar5 - 1) {
    (*(code *)RI_Hunk_FreeTempMemory)(aiStack_50[uVar5]);
  }
  return;
}


