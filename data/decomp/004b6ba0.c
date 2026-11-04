
int * __fastcall FUN_004b6ba0(int param_1)

{
  int iVar1;
  int *in_EAX;
  undefined4 uVar2;
  undefined4 uVar3;
  int *piVar4;
  
  uVar2 = FUN_004be490(&DAT_0053f3d4,in_EAX);
  uVar3 = FUN_004be450(&DAT_00547368);
  if (1 < *in_EAX) {
    return (int *)0x0;
  }
  iVar1 = **(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4);
  uVar3 = FUN_004b6a10(uVar3);
  piVar4 = (int *)(**(code **)(iVar1 + 0x40))(uVar3);
  (**(code **)(*piVar4 + 4))(uVar2);
  return piVar4;
}

