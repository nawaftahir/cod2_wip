extern int FUN_100827da();


unsigned int FUN_10082e6e(unsigned int param_1)

{
  unsigned int uVar1;
  int extraout_ECX;
  int iVar2;
  unsigned long long uVar3;
  
  uVar3 = FUN_100827da(param_1);
  iVar2 = (int)((unsigned long long)uVar3 >> 0x20);
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


