
uint __thiscall FUN_0044f590(int param_1,byte param_2)

{
  uint uVar1;
  int *piVar2;
  
  uVar1 = 0;
  if (0 < *(int *)(param_1 + 0x38)) {
    piVar2 = (int *)(*(int *)(param_1 + 0x3c) + 0x24);
    do {
      if ((*(byte *)(*piVar2 + 9) & param_2) != 0) {
        return CONCAT31((int3)(uVar1 >> 8),1);
      }
      uVar1 = uVar1 + 1;
      piVar2 = piVar2 + 0x2a;
    } while ((int)uVar1 < *(int *)(param_1 + 0x38));
  }
  return uVar1 & 0xffffff00;
}

