// 10082e6e size=69 FUN_10082e6e

undefined4 FUN_10082e6e(undefined4 param_1)

{
  undefined4 uVar1;
  int extraout_ECX;
  int iVar2;
  undefined8 uVar3;
  
  uVar3 = FUN_100827da(param_1);
  iVar2 = (int)((ulonglong)uVar3 >> 0x20);
  if (((((int)uVar3 == 0) || (*(int *)(extraout_ECX + 0x10) != *(int *)(iVar2 + 0x10))) ||
      (*(int *)(extraout_ECX + 0x14) != *(int *)(iVar2 + 0x14))) ||
     (((*(int *)(extraout_ECX + 0x18) != *(int *)(iVar2 + 0x18) ||
       (*(int *)(extraout_ECX + 0x1c) != *(int *)(iVar2 + 0x1c))) ||
      (*(int *)(extraout_ECX + 0x20) != *(int *)(iVar2 + 0x20))))) {
    uVar1 = 0;
  }
  else {
    uVar1 = 1;
  }
  return uVar1;
}


