extern unsigned int DAT_101d4c6c;
extern unsigned int DAT_101d4c70;
extern unsigned int DAT_101d4c78;


void FUN_100227c0(int *param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = DAT_101d4c70;
  if (DAT_101d4c78 != 0) {
    *param_1 = DAT_101d4c6c;
    *param_2 = iVar4;
    return;
  }
  iVar1 = GetSystemMetrics(0x4e);
  iVar2 = GetSystemMetrics(0x4f);
  iVar3 = GetSystemMetrics(0);
  iVar4 = GetSystemMetrics(1);
  if (iVar1 - iVar3 < 0) {
    iVar1 = iVar3;
  }
  *param_1 = iVar1;
  if (-1 < iVar2 - iVar4) {
    iVar4 = iVar2;
  }
  *param_2 = iVar4;
  return;
}


