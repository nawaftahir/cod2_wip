// 10085b72 size=127 FUN_10085b72

uint FUN_10085b72(int param_1,int *param_2)

{
  uint uVar1;
  uint uVar2;
  uint *in_ECX;
  
  uVar2 = *in_ECX;
  uVar1 = uVar2 & 0xfff00000;
  if (uVar1 == 0) {
    uVar2 = 0;
    goto LAB_10085bc0;
  }
  if (uVar1 != 0x50000000) {
    if (uVar1 == 0x50200000) {
      uVar2 = 1;
      goto LAB_10085bc0;
    }
    if (uVar1 != 0x70800000) {
      if ((uVar2 & 0xf0000000) == 0x60000000) {
        uVar2 = 4;
      }
      else {
        uVar2 = uVar2 & 0xfffff;
      }
      goto LAB_10085bc0;
    }
  }
  uVar2 = in_ECX[3];
LAB_10085bc0:
  if (in_ECX[3] < uVar2 * param_1 + uVar2) {
    if (param_2 != (int *)0x0) {
      *param_2 = 0;
    }
    uVar2 = 0;
  }
  else if (param_2 != (int *)0x0) {
    *param_2 = in_ECX[4] + uVar2 * param_1 * 4;
  }
  return uVar2;
}


