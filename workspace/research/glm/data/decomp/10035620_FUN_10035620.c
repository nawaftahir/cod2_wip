// 10035620 size=281 FUN_10035620

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10035620(float param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  float fVar3;
  int iVar4;
  int unaff_ESI;
  int unaff_EDI;
  bool bVar5;
  uint local_998;
  undefined4 local_994 [4];
  undefined4 local_984;
  undefined4 local_980;
  undefined4 local_14;
  
  if (param_1 != 0.0) {
    fVar3 = (float)*(int *)(DAT_1072ddc8 + 0x3c);
    if (*(int *)(DAT_1072ddc8 + 0x3c) < 0) {
      fVar3 = fVar3 + 4.2949673e+09;
    }
    local_14 = (&DAT_101d4820)[unaff_ESI * 5];
    fVar3 = fVar3 * param_1 * 0.0020833334;
    uVar1 = *(undefined4 *)(&DAT_101d482c + unaff_EDI * 0x14);
    uVar2 = *(undefined4 *)(&DAT_101d4830 + unaff_EDI * 0x14);
    bVar5 = unaff_ESI == 2;
    if (bVar5) {
      local_980 = 0;
      local_994[0] = DAT_101d1bd4;
      local_994[1] = 0x3f800000;
      local_994[2] = 0x3f800000;
      local_994[3] = uVar1;
      local_984 = uVar2;
    }
    local_998 = (uint)bVar5;
    iVar4 = FUN_100351a0(_DAT_101d4c80 * fVar3,fVar3,uVar1,uVar2,uVar1,uVar2,
                         local_994 + (uint)bVar5 * 0x26);
    local_998 = local_998 + iVar4;
    if (local_998 != 0) {
      FUN_10035490(&local_998);
      return;
    }
  }
  return;
}


