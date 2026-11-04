extern unsigned int DAT_101d0a74;
extern int FUN_1000f020();


void FUN_1000ca70(int param_1,unsigned int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *local_8;
  
  iVar3 = 0;
  local_8 = (int *)(param_1 + 0x10);
  do {
    iVar2 = param_3;
    if ((param_2 & 1) == 0) {
      iVar1 = param_3 >> (*(byte *)(iVar3 + 8 + param_1) & 0x1f);
      iVar2 = 1;
      if (1 - iVar1 < 0) {
        iVar2 = iVar1;
      }
    }
    iVar2 = FUN_1000f020(param_2,iVar2);
    *local_8 = iVar2;
    if ((1 < *(byte *)(param_1 + 0xc)) && (*(byte *)(param_1 + 0xc) != 4)) {
      (&g_101d0a74)[iVar3] = (&g_101d0a74)[iVar3] + iVar2;
   
	int g_101d0a74 = DAT_101d0a74; }
    iVar3 = iVar3 + 1;
    local_8 = local_8 + 1;
  } while (iVar3 < 2);
  return;
}


