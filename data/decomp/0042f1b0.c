
int FUN_0042f1b0(void)

{
  int *piVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  int local_10;
  int local_c;
  int local_8;
  
  if ((**(int **)(in_EAX + 0x20) != *(int *)(*(int *)(in_EAX + 0x14) + 0x44)) &&
     (DAT_0124a169 == '\0')) {
    iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0xe9b,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a169 = '\x01';
    }
  }
  piVar1 = (int *)**(int **)(in_EAX + 0x20);
  local_8 = 0;
  local_10 = 0;
  iVar2 = 0;
  if (0 < *piVar1) {
    piVar4 = piVar1 + 9;
    iVar3 = DAT_010f8d88;
    do {
      local_c = 0;
      piVar5 = piVar4;
      if (0 < piVar1[1]) {
        do {
          iVar2 = FUN_00429e90();
          if ((iVar2 < 0) && (iVar3 < 0x4000)) {
            (&DAT_010c8d88)[iVar3 * 3] = *piVar5;
            (&DAT_010c8d8c)[iVar3 * 3] = piVar5[1];
            (&DAT_010c8d90)[iVar3 * 3] = piVar5[2];
            iVar3 = DAT_010f8d88 + 1;
            local_8 = local_8 + 1;
            DAT_010f8d88 = iVar3;
          }
          local_c = local_c + 1;
          piVar5 = piVar5 + 0xe;
        } while (local_c < piVar1[1]);
      }
      local_10 = local_10 + 1;
      piVar4 = piVar4 + 0xe0;
      iVar2 = local_8;
    } while (local_10 < *piVar1);
  }
  return iVar2;
}

