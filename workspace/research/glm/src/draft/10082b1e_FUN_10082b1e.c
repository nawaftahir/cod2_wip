extern int FUN_100827da();
extern int FUN_100827f5();


unsigned char FUN_10082b1e(unsigned int param_1)

{
  int iVar1;
  int extraout_ECX;
  unsigned char bVar2;
  unsigned long long uVar3;
  
  uVar3 = FUN_100827da(param_1);
  iVar1 = (int)((unsigned long long)uVar3 >> 0x20);
  if (((((int)uVar3 == 0) || (*(int *)(extraout_ECX + 0x10) != *(int *)(iVar1 + 0x10))) ||
      (*(int *)(extraout_ECX + 0x14) != *(int *)(iVar1 + 0x14))) ||
     (*(int *)(extraout_ECX + 0x18) != *(int *)(iVar1 + 0x18))) {
    bVar2 = false;
  }
  else {
    iVar1 = FUN_100827f5(*(unsigned int *)(extraout_ECX + 0x1c),*(unsigned int *)(iVar1 + 0x1c));
    bVar2 = iVar1 != 0;
  }
  return bVar2;
}


