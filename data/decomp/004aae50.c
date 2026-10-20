
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004aae50(void)

{
  undefined4 *in_EAX;
  int iVar1;
  short *unaff_ESI;
  short sVar2;
  float10 fVar3;
  
  sVar2 = *(short *)*in_EAX;
  *in_EAX = (short *)*in_EAX + 1;
  *unaff_ESI = sVar2;
  sVar2 = *(short *)*in_EAX;
  *in_EAX = (short *)*in_EAX + 1;
  unaff_ESI[1] = sVar2;
  sVar2 = *(short *)*in_EAX;
  *in_EAX = (short *)*in_EAX + 1;
  unaff_ESI[2] = sVar2;
  iVar1 = ((0x3fff0001 - (int)sVar2 * (int)sVar2) - (int)unaff_ESI[1] * (int)unaff_ESI[1]) -
          (int)*unaff_ESI * (int)*unaff_ESI;
  if (iVar1 < 1) {
    iVar1 = 0;
  }
  else {
    fVar3 = (float10)FUN_004d98d4((double)iVar1);
    FUN_004d7630((double)((float)fVar3 + _DAT_00556b30));
    iVar1 = FUN_004df760();
  }
  sVar2 = (short)iVar1;
  if ((iVar1 != sVar2) && (DAT_0124a74f == '\0')) {
    iVar1 = FUN_0047d980("iQ[3] == (short)iQ[3]","\\trees\\cod2src\\src\\xanim\\xmodel_load_obj.cpp"
                         ,0x24,0,1);
    if (iVar1 != 0) {
      unaff_ESI[3] = sVar2;
      if (iVar1 != 2) {
        return;
      }
      DAT_0124a74f = 1;
      return;
    }
    DebugBreak();
  }
  unaff_ESI[3] = sVar2;
  return;
}

