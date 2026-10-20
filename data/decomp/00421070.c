
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00421070(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *unaff_EBX;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  int local_40;
  int local_3c;
  int local_38;
  undefined4 local_34 [11];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  local_40 = 0;
  if (0 < unaff_EBX[1]) {
    iVar1 = *unaff_EBX / 2;
    local_38 = 0x2c;
    do {
      local_3c = 0;
      if (0 < iVar1) {
        iVar2 = 0;
        do {
          iVar1 = unaff_EBX[3];
          puVar5 = (undefined4 *)((*unaff_EBX * local_40 + local_3c) * 0x2c + iVar1);
          puVar4 = puVar5;
          puVar6 = local_34;
          for (iVar3 = 0xb; iVar3 != 0; iVar3 = iVar3 + -1) {
            *puVar6 = *puVar4;
            puVar4 = puVar4 + 1;
            puVar6 = puVar6 + 1;
          }
          puVar4 = (undefined4 *)((local_38 * *unaff_EBX - iVar2) + -0x2c + iVar1);
          for (iVar3 = 0xb; iVar3 != 0; iVar3 = iVar3 + -1) {
            *puVar5 = *puVar4;
            puVar4 = puVar4 + 1;
            puVar5 = puVar5 + 1;
          }
          iVar3 = *unaff_EBX * local_38 - iVar2;
          iVar2 = iVar2 + 0x2c;
          puVar5 = local_34;
          puVar4 = (undefined4 *)(iVar3 + -0x2c + unaff_EBX[3]);
          for (iVar1 = 0xb; iVar1 != 0; iVar1 = iVar1 + -1) {
            *puVar4 = *puVar5;
            puVar5 = puVar5 + 1;
            puVar4 = puVar4 + 1;
          }
          local_3c = local_3c + 1;
          iVar1 = *unaff_EBX / 2;
        } while (local_3c < iVar1);
      }
      local_40 = local_40 + 1;
      local_38 = local_38 + 0x2c;
    } while (local_40 < unaff_EBX[1]);
  }
  return;
}

