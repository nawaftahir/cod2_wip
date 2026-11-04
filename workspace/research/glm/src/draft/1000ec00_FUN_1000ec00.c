extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;
extern int FUN_1000e840();
extern int FUN_1000e900();


void FUN_1000ec00(int param_1,unsigned int param_2,unsigned int param_3,int param_4)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int local_10;
  unsigned int local_c;
  int iStack_8;
  int iStack_4;
  
  uVar1 = (unsigned int)(*(unsigned short *)(param_1 + 0x1a) >> ((byte)param_3 & 0x1f));
  uVar3 = 1;
  if ((int)(1 - uVar1) < 0) {
    uVar3 = uVar1;
  }
  uVar1 = (unsigned int)(*(unsigned short *)(param_1 + 0x1c) >> ((byte)param_3 & 0x1f));
  local_10 = 1;
  if ((int)(1 - uVar1) < 0) {
    local_10 = uVar1;
  }
  iVar2 = FUN_1000e840();
  do {
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;  
	int g_101ce7ec = DAT_101ce7ec;   _fprintf(g_10764584,"%s","image->texture.volmap->LockBox( mipLevel, &lockedBox, 0, 0 )\n");
      _fflush(g_10764584);
    }
    (**(void **)(**(int **)(param_1 + 4) + 0x4c))(*(int **)(param_1 + 4),param_3,&local_c,0,0);
  } while (g_1076a830 != 0);
 
	int g_1076a830 = DAT_1076a830; g_1076a830 = 0;
  iVar4 = iStack_4;
  for (; local_10 != 0; local_10 = local_10 - 1) {
    FUN_1000e900(uVar3,param_4,local_c,iVar4);
    param_4 = param_4 + iVar2;
    iVar4 = iVar4 + iStack_8;
  }
  do {
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
      _fprintf(g_10764584,"%s","image->texture.volmap->UnlockBox( mipLevel )\n");
      _fflush(g_10764584);
    }
    (**(void **)(**(int **)(param_1 + 4) + 0x50))(*(int **)(param_1 + 4),param_3);
  } while (g_1076a830 != 0);
  return;
}


