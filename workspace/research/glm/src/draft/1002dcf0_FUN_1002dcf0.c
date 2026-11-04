extern unsigned int DAT_1076a830;


void FUN_1002dcf0(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iStack_10;
  int iStack_c;
  int iStack_8;
  unsigned char auStack_4 [4];
  
  iStack_8 = (*(void *)RI_Hunk_OverrideDataForFile)(param_1);
  iStack_10 = 0;
  if (0 < iStack_8) {
    do {
      iVar3 = (*(void *)RI_XModelPrecache)(param_1,&iStack_c,iStack_10,auStack_4);
      iVar5 = 0;
      if (0 < iVar3) {
        do {
          iVar1 = *(int *)(iStack_c + iVar5 * 4);
          piVar4 = *(int **)(iVar1 + 0x14);
          if (piVar4 != (int *)0x0) {
            do {
              (**(void **)(*piVar4 + 8))(piVar4);
              piVar4 = (int *)0x0;
            } while (g_1076a830 != 0);
 
	int g_1076a830 = DAT_1076a830;           *(unsigned int *)(iVar1 + 0x14) = 0;
          }
          iVar2 = *(int *)(iVar1 + 0x10);
          while (iVar2 != 0) {
            (**(void **)(**(int **)(iVar1 + 0x10) + 8))(*(int **)(iVar1 + 0x10));
            iVar2 = g_1076a830;
            *(unsigned int *)(iVar1 + 0x10) = 0;
          }
          iVar5 = iVar5 + 1;
        } while (iVar5 < iVar3);
      }
      iStack_10 = iStack_10 + 1;
    } while (iStack_10 < iStack_8);
  }
  return;
}


