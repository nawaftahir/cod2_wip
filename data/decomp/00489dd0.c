
void * FUN_00489dd0(void)

{
  char cVar1;
  char *pcVar2;
  void *pvVar3;
  int iVar4;
  char *unaff_EBX;
  
  pcVar2 = unaff_EBX;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  pvVar3 = _malloc((size_t)(pcVar2 + (1 - (int)(unaff_EBX + 1))));
  if (pvVar3 == (void *)0x0) {
    FUN_00489b70();
  }
  else {
    FUN_0048b5a0(pvVar3,0,pcVar2 + (1 - (int)(unaff_EBX + 1)));
  }
  iVar4 = (int)pvVar3 - (int)unaff_EBX;
  do {
    cVar1 = *unaff_EBX;
    unaff_EBX[iVar4] = cVar1;
    unaff_EBX = unaff_EBX + 1;
  } while (cVar1 != '\0');
  return pvVar3;
}

