// 10082ddb size=51 FUN_10082ddb

bool FUN_10082ddb(undefined4 param_1)

{
  int iVar1;
  int extraout_ECX;
  bool bVar2;
  undefined8 uVar3;
  
  uVar3 = FUN_100827da(param_1);
  iVar1 = (int)((ulonglong)uVar3 >> 0x20);
  if (((int)uVar3 == 0) || (*(int *)(extraout_ECX + 0x14) != *(int *)(iVar1 + 0x14))) {
    bVar2 = false;
  }
  else {
    iVar1 = FUN_100827f5(*(undefined4 *)(extraout_ECX + 0x10),*(undefined4 *)(iVar1 + 0x10));
    bVar2 = iVar1 != 0;
  }
  return bVar2;
}


