// 10027590 size=303 FUN_10027590

void FUN_10027590(int param_1,uint param_2)

{
  undefined4 *puVar1;
  uint uVar2;
  int iVar3;
  char cVar4;
  uint uVar5;
  int unaff_EBX;
  int iVar6;
  int local_68;
  
  *(int *)(unaff_EBX + 8) = DAT_10678ab8;
  *(int *)(unaff_EBX + 4) = DAT_10678ab8;
  FUN_10006be0(&DAT_101904a8,5);
  local_68 = 0;
  iVar6 = DAT_10678abc;
  if (param_1 != 0) {
    do {
      uVar2 = *(uint *)(iVar6 + local_68 * 8);
      puVar1 = (undefined4 *)(iVar6 + local_68 * 8);
      if ((uVar2 & 0x80000000) == 0) {
        iVar3 = 4;
      }
      else {
        iVar3 = 0x13;
      }
      uVar5 = uVar2 >> iVar3 & 0xfff;
      if (0x7ff < uVar5) {
        uVar5 = 0x7fe;
      }
      if ((uVar2 & 0x80000000) == 0) {
        iVar3 = 0x15;
      }
      else {
        iVar3 = 9;
      }
      if ((((*(int *)(*(int *)((&DAT_101d0b08)[uVar2 >> iVar3 & 0x3ff] + 0x38) + 0x84) != 0) &&
           (uVar5 != param_2)) &&
          ((*(int *)puVar1[1] == 6 ||
           ((uVar5 < 0x7fe && ((*(uint *)(uVar5 * 0x74 + 4 + DAT_10678510) & 0x100) != 0)))))) &&
         (cVar4 = FUN_10027540(), cVar4 == '\0')) {
        iVar3 = *(int *)(unaff_EBX + 8);
        *(undefined4 *)(iVar6 + iVar3 * 8) = *puVar1;
        *(undefined4 *)(DAT_10678abc + 4 + iVar3 * 8) = puVar1[1];
        iVar6 = DAT_101da9c8;
        *(int *)(unaff_EBX + 8) = *(int *)(unaff_EBX + 8) + 1;
        DAT_10678ab8 = DAT_10678ab8 + 1;
        *(int *)(iVar6 + 4) = *(int *)(iVar6 + 4) + 1;
        iVar6 = DAT_10678abc;
      }
      local_68 = local_68 + 1;
    } while (local_68 != param_1);
  }
  return;
}


