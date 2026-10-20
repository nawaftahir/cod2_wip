
void FUN_004a48e0(undefined4 *param_1)

{
  int iVar1;
  undefined4 *unaff_EBX;
  undefined4 *puVar2;
  
  if ((unaff_EBX == (undefined4 *)0x0) && (DAT_0124a66b == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555460,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x466);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a66b = '\x01';
    }
  }
  puVar2 = unaff_EBX;
  for (iVar1 = 0x19; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_1;
    param_1 = param_1 + 1;
    puVar2 = puVar2 + 1;
  }
  unaff_EBX[1] = 0;
  if ((*(ushort *)(unaff_EBX + 4) != 0) && (*(ushort *)(unaff_EBX + 4) != DAT_0123351c)) {
    iVar1 = FUN_004a87b0();
    *(short *)(iVar1 + 2) = *(short *)(iVar1 + 2) + 1;
  }
  FUN_004a4130();
  return;
}

