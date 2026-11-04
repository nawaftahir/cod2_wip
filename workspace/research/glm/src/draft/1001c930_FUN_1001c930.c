extern unsigned int DAT_1019166e;
extern unsigned int DAT_101948f4;
extern unsigned int DAT_10194928;
extern unsigned int DAT_101da964;
extern unsigned int DAT_101da968;
extern int FUN_1001c7f0();
extern int FUN_1001ca80();


void FUN_1001c930(void)

{
  int iVar1;
  int iVar2;
  int local_c;
  int iStack_8;
  int iStack_4;
  
  iVar1 = (*(void *)RI_FS_FOpenFileRead)("materials/shaders/",&g_10194928,0,&local_c,0x14);
 
	int g_10194928 = DAT_10194928; iStack_4 = (*(void *)RI_FS_FOpenFileRead)("materials/shaders/lib/",&g_10194928,0,&iStack_8,0x14)
  ;
  g_101da964 = iStack_8 + local_c;
 
	int g_101da964 = DAT_101da964; g_101da968 = (*(void *)RI_Hunk_AllocInternal)(g_101da964 * 0xc);
 
	int g_101da968 = DAT_101da968; iVar2 = 0;
  if (0 < local_c) {
    do {
      FUN_1001c7f0(*(unsigned int *)(iVar1 + iVar2 * 4),&DAT_1019166e);
      iVar2 = iVar2 + 1;
    } while (iVar2 < local_c);
  }
  iVar2 = 0;
  if (0 < iStack_8) {
    do {
      FUN_1001c7f0(*(unsigned int *)(iStack_4 + iVar2 * 4),&DAT_101948f4);
      iVar2 = iVar2 + 1;
    } while (iVar2 < iStack_8);
  }
  iVar2 = g_101da968 + g_101da964 * 0xc;
  FUN_1001ca80(g_101da968,iVar2,(iVar2 - g_101da968) / 0xc,&LAB_1001c8d0);
  (*(void *)RI_FS_ListFiles)(iStack_4,0x14);
  (*(void *)RI_FS_ListFiles)(iVar1,0x14);
  return;
}


