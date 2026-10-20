
undefined4 * FUN_00454630(void)

{
  int in_EAX;
  int iVar1;
  undefined4 *puVar2;
  uint uVar3;
  undefined4 *puVar4;
  
  if ((in_EAX < 1) && (DAT_0124a29f == '\0')) {
    iVar1 = FUN_0047d980("count > 0",".\\brush.cpp",0xbb,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a29f = '\x01';
    }
  }
  puVar2 = (undefined4 *)thunk_FUN_004ff450(in_EAX * 0xa8);
  puVar4 = puVar2;
  for (uVar3 = (uint)(in_EAX * 0xa8) >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
    *(undefined1 *)puVar4 = 0;
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  return puVar2;
}

