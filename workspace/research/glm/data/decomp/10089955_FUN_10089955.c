// 10089955 size=98 FUN_10089955

int FUN_10089955(int param_1,int param_2,int param_3,int param_4)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  
  piVar1 = (int *)(param_1 + (param_3 + param_2 * 4) * 4);
  if (*piVar1 == -1) {
    iVar3 = param_4 * 4;
    iVar2 = *(int *)(iVar3 + *(int *)(in_ECX + 0x14));
    if (*(int *)(iVar2 + 0xc) == -1) {
      *(int *)(*(int *)(iVar3 + *(int *)(in_ECX + 0x14)) + 0xc) = param_2;
      *(int *)(*(int *)(iVar3 + *(int *)(in_ECX + 0x14)) + 0x10) = param_3;
    }
    else {
      param_4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),param_2,param_3,
                             *(undefined8 *)(iVar2 + 0x20));
    }
    *piVar1 = param_4;
  }
  return *piVar1;
}


