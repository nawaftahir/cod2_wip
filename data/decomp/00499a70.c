
float10 FUN_00499a70(int param_1)

{
  int in_EAX;
  undefined4 *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  
  iVar3 = in_EAX - *(int *)(param_1 + 0x14);
  iVar4 = 0;
  if (0 < *(int *)(param_1 + 0x28)) {
    do {
      puVar1 = (undefined4 *)FUN_0040b780();
      if (*(int *)*puVar1 <= iVar3) {
        piVar2 = (int *)FUN_0040b780();
        puVar1 = (undefined4 *)FUN_0040b780();
        if (iVar3 <= *(int *)(*piVar2 + 4) + *(int *)*puVar1) {
          piVar2 = (int *)FUN_0040b780();
          return (float10)*(float *)(*piVar2 + 8);
        }
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < *(int *)(param_1 + 0x28));
  }
  return (float10)*(float *)(param_1 + 0x38);
}

