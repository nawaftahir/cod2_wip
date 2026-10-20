
int FUN_0047db70(void)

{
  int in_EAX;
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined *puVar5;
  
  if (in_EAX == 0) {
    iVar4 = 1;
    iVar3 = 0x32;
  }
  else {
    iVar4 = 0x33;
    iVar3 = 0xd;
  }
  iVar2 = 0;
  if (iVar3 != 0) {
    piVar1 = (int *)(&DAT_011436b8 + iVar4 * 0x11c);
    do {
      if (*piVar1 == 0) {
        return iVar2 + iVar4;
      }
      iVar2 = iVar2 + 1;
      piVar1 = piVar1 + 0x47;
    } while (iVar2 < iVar3);
  }
  if ((in_EAX != 0) && (DAT_0124a3bb == '\0')) {
    iVar3 = FUN_0047d980("!streamThread","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x20e,0,1
                        );
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a3bb = '\x01';
    }
  }
  iVar3 = 1;
  puVar5 = &DAT_011437f0;
  do {
    FUN_00408f20("FILE %2i: \'%s\'\n",iVar3,puVar5);
    puVar5 = puVar5 + 0x11c;
    iVar3 = iVar3 + 1;
  } while ((int)puVar5 < 0x1147dd4);
  FUN_0047ae50(1,"FS_HandleForFile: none free");
  return -1;
}

