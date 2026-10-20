
uint FUN_004839b0(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  float *unaff_ESI;
  float local_14 [4];
  
  if ((unaff_ESI == (float *)0x0) && (DAT_0124a3fc == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00551a00,"\\trees\\cod2src\\src\\universal\\com_math.cpp",0x2d4);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3fc = '\x01';
    }
  }
  local_14[0] = *unaff_ESI * *unaff_ESI;
  local_14[1] = unaff_ESI[1] * unaff_ESI[1];
  uVar3 = (uint)(local_14[0] < local_14[1]);
  uVar2 = 2;
  if (unaff_ESI[2] * unaff_ESI[2] <= local_14[uVar3]) {
    uVar2 = uVar3;
  }
  return uVar2;
}

