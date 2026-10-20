
uint __fastcall FUN_0044f560(int param_1)

{
  uint uVar1;
  int *piVar2;
  uint unaff_ESI;
  
  uVar1 = 0;
  if (0 < *(int *)(param_1 + 0x38)) {
    piVar2 = (int *)(*(int *)(param_1 + 0x3c) + 0x24);
    do {
      if ((*(uint *)(*piVar2 + 0x1c) & unaff_ESI) != 0) {
        return CONCAT31((int3)(uVar1 >> 8),1);
      }
      uVar1 = uVar1 + 1;
      piVar2 = piVar2 + 0x2a;
    } while ((int)uVar1 < *(int *)(param_1 + 0x38));
  }
  return uVar1 & 0xffffff00;
}

