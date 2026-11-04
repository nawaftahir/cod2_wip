
void FUN_00454a30(void)

{
  int *piVar1;
  int in_EAX;
  int iVar2;
  
  piVar1 = (int *)(DAT_01128d90 * 0x1c + 0x24 + in_EAX);
  if ((*piVar1 == 0) && (DAT_0124a297 == '\0')) {
    iVar2 = FUN_0047d980("td->radMat",".\\brush.cpp",0x110,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a297 = '\x01';
    }
  }
  FUN_004401d0(in_EAX + 0x80,piVar1 + 3,piVar1[5],piVar1[6]);
  return;
}

