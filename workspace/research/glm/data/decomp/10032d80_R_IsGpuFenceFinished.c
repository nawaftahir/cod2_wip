// 10032d80 size=160 R_IsGpuFenceFinished

void R_IsGpuFenceFinished(void)

{
  uint uVar1;
  uint uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  bool bVar9;
  bool bVar10;
  
  if (DAT_101d4810 != 3) {
    FUN_10032cd0();
    return;
  }
  uVar8 = 0;
  uVar3 = rdtsc();
  iVar7 = (int)DAT_101d4954 >> 0x1f;
  bVar9 = (uint)uVar3 < DAT_101d4954;
  uVar6 = (uint)uVar3 - DAT_101d4954;
  DAT_101d4954 = 0;
  do {
    if (DAT_101d4958 == '\0') {
LAB_10032e00:
      DAT_101d4950 = DAT_101d4950 - (int)(DAT_101d4950 - uVar8) / 2;
      return;
    }
    iVar5 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
    if ((iVar5 == -0x7789f798) || (iVar5 != 1)) {
      DAT_101d4958 = '\0';
      goto LAB_10032e00;
    }
    uVar4 = rdtsc();
    uVar8 = (uint)uVar4 - uVar6;
    uVar1 = (uint)((uint)uVar4 < uVar6);
    uVar2 = (int)((ulonglong)uVar4 >> 0x20) -
            (((int)((ulonglong)uVar3 >> 0x20) - iVar7) - (uint)bVar9);
    bVar10 = -1 < (int)(uVar2 - uVar1);
    if (uVar2 != uVar1 && bVar10) {
      return;
    }
    if ((bVar10) && (0x7fffffff < uVar8)) {
      return;
    }
  } while( true );
}


