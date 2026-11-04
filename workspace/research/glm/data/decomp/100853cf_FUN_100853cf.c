// 100853cf size=61 FUN_100853cf

uint FUN_100853cf(int param_1,int *param_2)

{
  uint uVar1;
  uint *in_ECX;
  
  uVar1 = *in_ECX & 0xfffff;
  if (in_ECX[1] < uVar1 * param_1 + uVar1) {
    if (param_2 != (int *)0x0) {
      *param_2 = 0;
    }
    uVar1 = 0;
  }
  else if (param_2 != (int *)0x0) {
    *param_2 = in_ECX[2] + uVar1 * param_1 * 4;
  }
  return uVar1;
}


