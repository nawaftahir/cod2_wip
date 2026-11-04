extern int FUN_1002fe70();


void FUN_1002ff50(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_1002fe70(iVar1 + 0xc,*(unsigned int *)(iVar1 + 8),*(unsigned char *)(iVar1 + 5));
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


