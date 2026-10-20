
int FUN_00462f20(int param_1)

{
  int iVar1;
  int in_EAX;
  int *piVar2;
  int iVar3;
  
  iVar1 = *(int *)(in_EAX + 4);
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      piVar2 = (int *)FUN_00407730();
      if (*piVar2 == param_1) {
        return iVar3;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
  }
  return -1;
}

