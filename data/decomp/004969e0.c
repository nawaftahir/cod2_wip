
void FUN_004969e0(char *param_1)

{
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  
  iVar1 = __vsnprintf((char *)&DAT_0117b180,32000,param_1,&stack0x00000008);
  DAT_01182e7f = 0;
  if ((iVar1 < 0) || (31999 < iVar1)) {
    FUN_0047ae50(1,"Attempted to overrun string in call to va()\n");
  }
  if (0x7cfe < DAT_0124a4f8 + iVar1) {
    DAT_0124a4f8 = 0;
  }
  puVar3 = &DAT_0117b180;
  puVar4 = (undefined4 *)((int)&DAT_01173470 + DAT_0124a4f8);
  for (uVar2 = iVar1 + 1U >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  for (uVar2 = iVar1 + 1U & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
    *(undefined1 *)puVar4 = *(undefined1 *)puVar3;
    puVar3 = (undefined4 *)((int)puVar3 + 1);
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  DAT_0124a4f8 = DAT_0124a4f8 + 1 + iVar1;
  return;
}

