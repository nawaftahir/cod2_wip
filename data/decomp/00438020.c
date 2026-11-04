
void FUN_00438020(void)

{
  undefined4 *puVar1;
  bool bVar2;
  char cVar3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 local_c;
  int local_8;
  
  bVar2 = false;
  puVar5 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if ((int *)puVar5[8] != (int *)0x0) {
        if ((*(int *)puVar5[8] != *(int *)(puVar5[5] + 0x44)) && (DAT_0124a144 == '\0')) {
          iVar4 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x1d51,0,1);
          if (iVar4 == 0) {
            DebugBreak();
          }
          else if (iVar4 == 2) {
            DAT_0124a144 = '\x01';
          }
        }
        iVar4 = *(int *)puVar5[8];
        if (((*(byte *)(iVar4 + 0x10) & 0x40) != 0) &&
           (cVar3 = FUN_00429bc0(iVar4,&local_8,&local_c), cVar3 != '\0')) {
          if (local_8 < 0) {
            FUN_00430010(iVar4,local_c);
          }
          else {
            FUN_0042fda0(iVar4,local_8);
          }
          bVar2 = true;
          FUN_004269d0();
        }
      }
      puVar1 = puVar5 + 1;
      puVar5 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
    if (bVar2) {
      if (DAT_01234694 != 0) {
        FUN_00424b10();
      }
      DAT_0123348c = 0xffffffff;
    }
  }
  return;
}

