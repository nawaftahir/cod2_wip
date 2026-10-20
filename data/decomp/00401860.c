
undefined4 FUN_00401860(int param_1,int param_2,int param_3,undefined4 param_4)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  
  if ((param_2 == 0x100) && (param_3 == 0x59)) {
    PostMessageA(*(HWND *)(DAT_01233488 + 0x1c),0x111,0x816a,0);
    return 0;
  }
  iVar3 = 0;
  uVar1 = 0;
  do {
    if (param_1 == *(int *)((int)&DAT_0058fab4 + uVar1)) {
      uVar2 = (*(code *)(&DAT_0058fab8)[iVar3 * 3])(param_1,param_2,param_3,param_4);
      return uVar2;
    }
    uVar1 = uVar1 + 0xc;
    iVar3 = iVar3 + 1;
  } while (uVar1 < 0xcc);
  return 0;
}

