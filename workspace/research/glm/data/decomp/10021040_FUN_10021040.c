// 10021040 size=143 FUN_10021040

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10021040(void)

{
  int iVar1;
  undefined *puVar2;
  
  DAT_101d4d1c = DAT_101d4d1c + 1;
  DAT_101da9c8 = &DAT_1042e780;
  _DAT_1042e780 = DAT_101d4d1c;
  FUN_1001e540();
  puVar2 = DAT_101da9c8;
  DAT_101d49bc = DAT_101d49bc + 1 & 0x80000001;
  if ((int)DAT_101d49bc < 0) {
    DAT_101d49bc = (DAT_101d49bc - 1 | 0xfffffffe) + 1;
  }
  iVar1 = DAT_101d49bc * 0xc;
  *(undefined **)(DAT_101da9c8 + 0x217c78) = &DAT_101d4980 + iVar1;
  *(undefined4 *)(&DAT_101d4980 + iVar1) = 0;
  *(undefined4 *)(puVar2 + 4) = 0;
  *(undefined4 *)(puVar2 + 0x80008) = 0;
  *(undefined4 *)(puVar2 + 0xa000c) = 0;
  *(undefined4 *)(puVar2 + 0x187c70) = 0;
  *(undefined4 *)(puVar2 + 0x18fc74) = 0;
  *(undefined4 *)(puVar2 + 0x217c7c) = 0;
  DAT_1042e778 = puVar2 + 0x219d0c;
  *(undefined4 *)(puVar2 + 0x249d4c) = 0;
  *(undefined4 *)(puVar2 + 0x249d34) = 0;
  *(undefined4 *)(puVar2 + 0x249d1c) = 0;
  return;
}


