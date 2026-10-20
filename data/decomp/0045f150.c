
void FUN_0045f150(void)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int local_c;
  int local_8;
  
  if ((in_EAX == 0) && (DAT_0124a227 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x1062,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a227 = '\x01';
    }
  }
  local_c = 0;
  if (0 < *(int *)(in_EAX + 0x38)) {
    local_8 = 0;
    do {
      iVar1 = *(int *)(in_EAX + 0x3c) + local_8;
      if ((iVar1 == 0) && (DAT_0124a229 == '\0')) {
        iVar2 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",0x104a,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a229 = '\x01';
        }
      }
      puVar3 = (undefined4 *)(iVar1 + 0x5c);
      puVar4 = (undefined4 *)(DAT_01128d94 * 0x1c + 0x24 + iVar1);
      for (iVar2 = 7; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      *(short *)(in_EAX + 0x42) = *(short *)(in_EAX + 0x42) + 1;
      local_c = local_c + 1;
      local_8 = local_8 + 0xa8;
    } while (local_c < *(int *)(in_EAX + 0x38));
  }
  if (*(int *)(in_EAX + 0x44) != 0) {
    FUN_00439450();
  }
  return;
}

