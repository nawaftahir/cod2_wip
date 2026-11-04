
void FUN_00472280(uint param_1)

{
  undefined4 *puVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  uint unaff_EBX;
  undefined4 *puVar5;
  
  puVar5 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      iVar4 = 0;
      if (0 < (int)puVar5[6]) {
        iVar3 = 0;
        do {
          puVar2 = (uint *)(*(int *)(puVar5[5] + 0x3c) + 0x7c + iVar3);
          *puVar2 = *puVar2 & ~param_1;
          puVar2 = (uint *)(*(int *)(puVar5[5] + 0x3c) + 0x7c + iVar3);
          *puVar2 = *puVar2 | unaff_EBX;
          iVar4 = iVar4 + 1;
          iVar3 = iVar3 + 0xa8;
        } while (iVar4 < (int)puVar5[6]);
      }
      if ((int *)puVar5[8] != (int *)0x0) {
        if ((*(int *)puVar5[8] != *(int *)(puVar5[5] + 0x44)) && (DAT_0124a35f == '\0')) {
          iVar4 = FUN_0047d980("b->patch->def == b->def->patch",".\\select.cpp",0x6eb,0,1);
          if (iVar4 == 0) {
            DebugBreak();
          }
          else if (iVar4 == 2) {
            DAT_0124a35f = '\x01';
          }
        }
        *(uint *)(*(int *)puVar5[8] + 0xc) = *(uint *)(*(int *)puVar5[8] + 0xc) & ~param_1;
        *(uint *)(*(int *)puVar5[8] + 0xc) = *(uint *)(*(int *)puVar5[8] + 0xc) | unaff_EBX;
      }
      puVar1 = puVar5 + 1;
      puVar5 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  DAT_0123348c = 0xffffffff;
  return;
}

