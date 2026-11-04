// 100227e1 size=65 FUN_100227e1

void FUN_100227e1(int *param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
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


