
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_004b14c0(undefined4 param_1,int param_2)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  ushort uVar4;
  uint uVar5;
  uint uVar6;
  int unaff_EBX;
  uint uVar7;
  int unaff_EDI;
  ushort auStack_24 [16];
  undefined4 local_4;
  
  local_4 = DAT_0058ea68;
  uVar4 = 0;
  iVar2 = 1;
  do {
    uVar4 = (*(short *)(param_2 + -2 + iVar2 * 2) + uVar4) * 2;
    auStack_24[iVar2] = uVar4;
    iVar2 = iVar2 + 1;
  } while (iVar2 < 0x10);
  iVar2 = 0;
  if (-1 < unaff_EBX) {
    do {
      uVar6 = (uint)*(ushort *)(unaff_EDI + 2 + iVar2 * 4);
      if (uVar6 != 0) {
        uVar5 = (uint)auStack_24[uVar6];
        auStack_24[uVar6] = auStack_24[uVar6] + 1;
        uVar1 = 0;
        do {
          uVar3 = uVar1;
          uVar7 = uVar5 & 1;
          uVar5 = uVar5 >> 1;
          uVar6 = uVar6 - 1;
          uVar1 = (uVar3 | uVar7) << 1;
        } while (0 < (int)uVar6);
        *(ushort *)(unaff_EDI + iVar2 * 4) = (ushort)uVar3 | (ushort)uVar7;
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 <= unaff_EBX);
  }
  return;
}

