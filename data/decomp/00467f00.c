
void FUN_00467f00(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  char cVar4;
  HCURSOR hCursor;
  int local_8;
  
  if (DAT_010a44e0 != (undefined4 *)0x0) {
    hCursor = LoadCursorA((HINSTANCE)0x0,(LPCSTR)0x7f02);
    DAT_01129e28 = SetCursor(hCursor);
    local_8 = 0;
    puVar3 = DAT_010a44e0;
joined_r0x00467f3a:
    if ((puVar3 != (undefined4 *)0x0) && (puVar3 != &DAT_010a44dc)) {
      iVar1 = puVar3[5];
      puVar2 = (undefined4 *)puVar3[1];
      FUN_0045a220(0);
      if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
        FUN_00475350();
      }
      *(short *)(iVar1 + 0x42) = *(short *)(iVar1 + 0x42) + 1;
      if (*(int *)(puVar3[5] + 0x3c) != 0) goto code_r0x00467f7e;
      goto LAB_00467fa8;
    }
    if (DAT_01129e28 != (HCURSOR)0x0) {
      SetCursor(DAT_01129e28);
      DAT_01129e28 = (HCURSOR)0x0;
    }
  }
  return;
code_r0x00467f7e:
  puVar3 = puVar2;
  if (*(int *)(DAT_01233b64 + 0x20c) != 0) {
    cVar4 = FUN_00467ec0(local_8,*(undefined4 *)(DAT_01233b64 + 0x204));
    local_8 = local_8 + 1;
    if (cVar4 != '\0') {
LAB_00467fa8:
      FUN_00458c00();
      FUN_0047a5b0("Removed degenerate brush\n");
      puVar3 = puVar2;
    }
  }
  goto joined_r0x00467f3a;
}

