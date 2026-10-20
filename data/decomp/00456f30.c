
void FUN_00456f30(int param_1,int param_2,float param_3)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  do {
    if (iVar4 != param_2) {
      piVar1 = (int *)(iVar4 * 0x1c + 0x24 + param_1);
      iVar3 = FUN_00440840();
      *piVar1 = iVar3;
      iVar2 = *(int *)(iVar3 + 0x14);
      piVar1[2] = (int)((float)*(int *)(iVar3 + 0x18) * param_3);
      piVar1[1] = (int)((float)iVar2 * param_3);
      piVar1[3] = 0;
      piVar1[4] = 0;
      piVar1[5] = 0;
      piVar1[6] = 0;
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 2);
  return;
}

