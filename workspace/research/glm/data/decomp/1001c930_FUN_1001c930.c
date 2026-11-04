// 1001c930 size=282 FUN_1001c930

void FUN_1001c930(void)

{
  int iVar1;
  int iVar2;
  int local_c;
  int iStack_8;
  int iStack_4;
  
  iVar1 = (*(code *)RI_FS_FOpenFileRead)("materials/shaders/",&DAT_10194928,0,&local_c,0x14);
  iStack_4 = (*(code *)RI_FS_FOpenFileRead)("materials/shaders/lib/",&DAT_10194928,0,&iStack_8,0x14)
  ;
  DAT_101da964 = iStack_8 + local_c;
  DAT_101da968 = (*(code *)RI_Hunk_AllocInternal)(DAT_101da964 * 0xc);
  iVar2 = 0;
  if (0 < local_c) {
    do {
      FUN_1001c7f0(*(undefined4 *)(iVar1 + iVar2 * 4),&DAT_1019166e);
      iVar2 = iVar2 + 1;
    } while (iVar2 < local_c);
  }
  iVar2 = 0;
  if (0 < iStack_8) {
    do {
      FUN_1001c7f0(*(undefined4 *)(iStack_4 + iVar2 * 4),&DAT_101948f4);
      iVar2 = iVar2 + 1;
    } while (iVar2 < iStack_8);
  }
  iVar2 = DAT_101da968 + DAT_101da964 * 0xc;
  FUN_1001ca80(DAT_101da968,iVar2,(iVar2 - DAT_101da968) / 0xc,&LAB_1001c8d0);
  (*(code *)RI_FS_ListFiles)(iStack_4,0x14);
  (*(code *)RI_FS_ListFiles)(iVar1,0x14);
  return;
}


