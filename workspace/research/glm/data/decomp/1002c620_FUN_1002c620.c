// 1002c620 size=397 FUN_1002c620

void FUN_1002c620(int param_1)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  undefined1 *in_EAX;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  float *pfVar9;
  uint uVar10;
  int unaff_EDI;
  int local_3c;
  int local_34;
  undefined1 local_28;
  undefined1 local_24;
  undefined1 local_1c;
  
  iVar6 = *(int *)(param_1 + 0xc) * *(int *)(param_1 + 0x10);
  fVar3 = (float)iVar6;
  if (0 < iVar6) {
    iVar5 = 0;
    do {
      fVar1 = *(float *)(unaff_EDI + 4 + iVar5 * 8);
      iVar5 = iVar5 + 1;
      fVar2 = *(float *)(unaff_EDI + -8 + iVar5 * 8);
      *(float *)(unaff_EDI + -8 + iVar5 * 8) = SQRT(fVar1 * fVar1 + fVar2 * fVar2);
    } while (iVar5 < iVar6);
  }
  local_3c = *(int *)(param_1 + 0xc) + -1;
  uVar10 = iVar6 - *(int *)(param_1 + 0xc);
  iVar5 = 0;
  local_34 = 0;
  if (0 < *(int *)(param_1 + 0x10)) {
    do {
      iVar8 = 0;
      if (0 < *(int *)(param_1 + 0xc)) {
        pfVar9 = (float *)(unaff_EDI + uVar10 * 8);
        iVar7 = local_3c << 3;
        do {
          local_3c = iVar5;
          fVar1 = *(float *)(local_3c * 8 + unaff_EDI);
          fVar4 = fVar1 - *(float *)(iVar7 + unaff_EDI);
          fVar1 = fVar1 - *pfVar9;
          fVar2 = 127.5 / SQRT(fVar4 * fVar4 + fVar1 * fVar1 + fVar3 * fVar3);
          local_28 = (undefined1)(int)ROUND(fVar2 * fVar4 + 127.5 + 9.313226e-10);
          in_EAX[2] = local_28;
          local_24 = (undefined1)(int)ROUND(fVar2 * fVar1 + 127.5 + 9.313226e-10);
          in_EAX[1] = local_24;
          local_1c = (undefined1)(int)ROUND(fVar3 * fVar2 + 127.5 + 9.313226e-10);
          *in_EAX = local_1c;
          in_EAX[3] = 0xff;
          in_EAX = in_EAX + 4;
          pfVar9 = pfVar9 + 2;
          iVar5 = local_3c + 1;
          iVar8 = iVar8 + 1;
          iVar7 = local_3c * 8;
        } while (iVar8 < *(int *)(param_1 + 0xc));
      }
      uVar10 = (iVar5 - *(int *)(param_1 + 0xc)) + iVar6 & iVar6 - 1U;
      local_34 = local_34 + 1;
    } while (local_34 < *(int *)(param_1 + 0x10));
  }
  return;
}


