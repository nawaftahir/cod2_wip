extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;
extern int FUN_10037420();
extern int FUN_10037500();


void FUN_1003a1a0(void)

{
  int iVar1;
  unsigned int uVar2;
  unsigned char *puVar3;
  unsigned char local_340 [832];
  
  iVar1 = *(int *)(*(int *)(DAT_1072d9bc + 0x38) + 0x40);
  if ((iVar1 == 0) || (*(char *)(iVar1 + 0xe) == '\0')) {
    iVar1 = FUN_10037500();
  }
  else {
    iVar1 = FUN_10037420();
  }
  uVar2 = 0;
  if (0 < iVar1) {
    puVar3 = local_340;
    do {
      do {
        if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;  
	int g_101ce7ec = DAT_101ce7ec;       _fprintf(g_10764584,"%s","dx.device->LightEnable( lightIndex, 1 )\n");
          _fflush(g_10764584);
        }
        (**(void **)(*g_101d1bf8 + 0xd4))(g_101d1bf8,uVar2,1);
      } w
	int g_101d1bf8 = DAT_101d1bf8;hile (g_1076a830 != 0);
 
	int g_1076a830 = DAT_1076a830;     do {
        if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
          _fprintf(g_10764584,"%s","dx.device->SetLight( lightIndex, &lights[lightIndex] )\n");
          _fflush(g_10764584);
        }
        (**(void **)(*g_101d1bf8 + 0xcc))(g_101d1bf8,uVar2,puVar3);
      } while (g_1076a830 != 0);
      uVar2 = uVar2 + 1;
      puVar3 = puVar3 + 0x68;
    } while ((int)uVar2 < iVar1);
    if (7 < uVar2) {
      return;
    }
  }
  do {
    if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
      _fprintf(g_10764584,"%s","dx.device->LightEnable( lightIndex, 0 )\n");
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0xd4))(g_101d1bf8,uVar2,0);
  } while ((g_1076a830 != 0) || (uVar2 = uVar2 + 1, uVar2 < 8));
  return;
}


