
float10 __thiscall FUN_00489900(byte param_1,float param_2)

{
  int iVar1;
  uint uVar2;
  int unaff_ESI;
  
  iVar1 = 1 << (param_1 & 0x1f);
  uVar2 = iVar1 - 1U & (uint)param_2;
  if ((int)uVar2 <= unaff_ESI) {
    return (float10)(float)((int)param_2 - uVar2);
  }
  if ((int)(iVar1 - uVar2) <= unaff_ESI) {
    param_2 = (float)((int)param_2 + (iVar1 - uVar2));
  }
  return (float10)param_2;
}

