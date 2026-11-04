
int * __fastcall FUN_004b64f0(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  char *pcVar3;
  int *piVar4;
  
  if (*(int *)(param_1 + 0x108) != 0) {
    return (int *)(param_1 + 0x104);
  }
  iVar1 = FUN_004c0fe0("P4CLIENT");
  if (iVar1 != 0) {
    *(undefined4 *)(param_1 + 0x108) = 0;
    FUN_004bf280(iVar1);
    return (int *)(param_1 + 0x104);
  }
  uVar2 = FUN_004b6110();
  piVar4 = (int *)(param_1 + 0x104);
  *(undefined4 *)(param_1 + 0x108) = 0;
  FUN_004bf2e0(uVar2);
  pcVar3 = _strchr((char *)*piVar4,0x2e);
  if (pcVar3 != (char *)0x0) {
    *(undefined4 *)(param_1 + 0x108) = 0;
    FUN_004bf230(*piVar4,(int)pcVar3 - *piVar4);
  }
  return piVar4;
}

