extern int FUN_10099b4f();


void FUN_1009a568(int param_1)

{
  int iVar1;
  unsigned int uVar2;
  
  if ((param_1 != 0) && (*(int *)(param_1 + 4) == 0xd)) {
    iVar1 = *(int *)(param_1 + 0x10);
    if (iVar1 == 0) {
      *(unsigned int *)(param_1 + 0x14) = 0;
      *(unsigned int *)(param_1 + 0x18) = 0;
    }
    else {
      if (*(int *)(iVar1 + 4) == 9) {
        *(unsigned int *)(param_1 + 0x14) = *(unsigned int *)(iVar1 + 0x18);
        uVar2 = *(unsigned int *)(iVar1 + 0x1c);
      }
      else {
        *(unsigned int *)(param_1 + 0x14) = 1;
        uVar2 = FUN_10099b4f(iVar1);
      }
      *(unsigned int *)(param_1 + 0x18) = uVar2;
    }
  }
  return;
}


