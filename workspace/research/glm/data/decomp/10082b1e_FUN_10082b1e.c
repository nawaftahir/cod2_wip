// 10082b1e size=67 FUN_10082b1e

bool FUN_10082b1e(undefined4 param_1)

{
  int iVar1;
  int extraout_ECX;
  bool bVar2;
  undefined8 uVar3;
  
  uVar3 = FUN_100827da(param_1);
  iVar1 = (int)((ulonglong)uVar3 >> 0x20);
  if (((((int)uVar3 == 0) || (*(int *)(extraout_ECX + 0x10) != *(int *)(iVar1 + 0x10))) ||
      (*(int *)(extraout_ECX + 0x14) != *(int *)(iVar1 + 0x14))) ||
     (*(int *)(extraout_ECX + 0x18) != *(int *)(iVar1 + 0x18))) {
    bVar2 = false;
  }
  else {
    iVar1 = FUN_100827f5(*(undefined4 *)(extraout_ECX + 0x1c),*(undefined4 *)(iVar1 + 0x1c));
    bVar2 = iVar1 != 0;
  }
  return bVar2;
}


