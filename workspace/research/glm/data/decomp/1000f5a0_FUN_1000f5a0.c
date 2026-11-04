// 1000f5a0 size=527 FUN_1000f5a0

void FUN_1000f5a0(int param_1,int param_2,int param_3,int param_4)

{
  int *in_EAX;
  int iVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  uint uVar5;
  undefined1 *puVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int local_10;
  
  FUN_1000ee30((int)*(short *)(param_1 + 6),(int)*(short *)(param_1 + 8),
               (int)*(short *)(param_1 + 10),*(undefined1 *)(param_1 + 5),0);
  local_10 = 0;
  uVar5 = (*in_EAX != 5) - 1 & 5;
  if (param_3 == 0x16) {
    local_10 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)
                         ((uint)*(ushort *)((int)in_EAX + 0x1a) * (uint)*(ushort *)(in_EAX + 6) * 4)
    ;
  }
  iVar1 = 1;
  if ((*(byte *)(param_1 + 5) & 2) == 0) {
    iVar2 = iVar1;
    iVar1 = 1;
    for (; ((iVar2 < *(short *)(param_1 + 6) || (iVar2 < *(short *)(param_1 + 8))) ||
           (iVar2 < *(short *)(param_1 + 10))); iVar2 = iVar2 << 1) {
      iVar1 = iVar1 + 1;
    }
  }
  uVar3 = iVar1 - 1;
  if ((int)(uint)*(byte *)(in_EAX + 2) <= (int)uVar3) {
    do {
      iVar1 = (int)*(short *)(param_1 + 6) >> ((byte)uVar3 & 0x1f);
      if (-1 < 1 - iVar1) {
        iVar1 = 1;
      }
      iVar2 = (int)*(short *)(param_1 + 8) >> ((byte)uVar3 & 0x1f);
      if (-1 < 1 - iVar2) {
        iVar2 = 1;
      }
      iVar7 = 0;
      if (uVar5 != 0xffffffff) {
        do {
          if (param_3 == 0x16) {
            puVar4 = (undefined1 *)(local_10 + 2);
            puVar6 = (undefined1 *)(param_2 + 2);
            iVar8 = iVar2 * iVar1;
            do {
              puVar4[-2] = puVar6[-2];
              puVar4[-1] = puVar6[-1];
              *puVar4 = *puVar6;
              puVar4[1] = 0xff;
              puVar4 = puVar4 + 4;
              puVar6 = puVar6 + 3;
              iVar8 = iVar8 + -1;
            } while (iVar8 != 0);
            if (*in_EAX == 4) {
              FUN_1000ec00();
            }
            else if (((*in_EAX != 5) || (uVar3 == *(byte *)(in_EAX + 2))) || (DAT_101d496b != '\0'))
            {
              iVar8 = 0x16;
              iVar9 = local_10;
LAB_1000f757:
              FUN_1000ea20(iVar8,iVar9);
            }
          }
          else if (*in_EAX == 4) {
            FUN_1000ec00();
          }
          else {
            iVar8 = param_3;
            iVar9 = param_2;
            if (((*in_EAX != 5) || (uVar3 == *(byte *)(in_EAX + 2))) || (DAT_101d496b != '\0'))
            goto LAB_1000f757;
          }
          param_2 = param_2 + iVar2 * iVar1 * param_4;
          iVar7 = iVar7 + 1;
        } while (iVar7 < (int)(uVar5 + 1));
      }
      uVar3 = uVar3 - 1;
    } while ((int)(uint)*(byte *)(in_EAX + 2) <= (int)uVar3);
  }
  if (local_10 != 0) {
    (*(code *)RI_Hunk_FreeTempMemory)(local_10);
  }
  return;
}


