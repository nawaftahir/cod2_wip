
void __fastcall FUN_004a4130(undefined4 *param_1)

{
  uint uVar1;
  int *in_EAX;
  int iVar2;
  uint uVar3;
  char cVar4;
  undefined4 *puVar5;
  
  *param_1 = in_EAX;
  if (in_EAX == (int *)0x0) {
    param_1[3] = 0;
    return;
  }
  if ((*in_EAX == 0) && (DAT_0124a677 == '\0')) {
    iVar2 = FUN_0047d980("tree->anims","\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x3b6,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a677 = '\x01';
    }
  }
  uVar1 = *(uint *)(*in_EAX + 4);
  iVar2 = (int)in_EAX + uVar1 * 2 + 0x14;
  param_1[3] = iVar2;
  cVar4 = *(char *)(iVar2 + uVar1 * 2) + '\x01';
  if (cVar4 == '\0') {
    puVar5 = (undefined4 *)(iVar2 + 1 + uVar1 * 2);
    for (uVar3 = uVar1 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar5 = 0;
      puVar5 = puVar5 + 1;
    }
    cVar4 = '\x01';
    for (uVar3 = uVar1 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
      *(undefined1 *)puVar5 = 0;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
  }
  *(char *)(iVar2 + uVar1 * 2) = cVar4;
  return;
}

