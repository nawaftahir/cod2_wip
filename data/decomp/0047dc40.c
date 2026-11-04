
undefined4 FUN_0047dc40(void)

{
  int in_EAX;
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  char *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  
  if (((in_EAX < 1) || (0x3f < in_EAX)) && (DAT_0124a3ba == '\0')) {
    uVar7 = 1;
    uVar6 = 0;
    uVar5 = 0x220;
    pcVar4 = "\\trees\\cod2src\\src\\universal\\com_files.cpp";
    uVar1 = FUN_004969e0("%s\n\t(f) = %i","(f > 0 && f < (1 + 50 + 13))");
    iVar2 = FUN_0047d980(uVar1,pcVar4,uVar5,uVar6,uVar7);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a3ba = '\x01';
    }
  }
  iVar2 = in_EAX * 0x11c;
  if ((*(int *)(&DAT_011436cc + iVar2) != 0) && (DAT_0124a3b9 == '\0')) {
    iVar3 = FUN_0047d980("!fsh[f].zipFile","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x221,0
                         ,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a3b9 = '\x01';
    }
  }
  if ((*(int *)(&DAT_011436b8 + iVar2) == 0) && (DAT_0124a3b8 == '\0')) {
    iVar3 = FUN_0047d980("fsh[f].handleFiles.file.o",
                         "\\trees\\cod2src\\src\\universal\\com_files.cpp",0x222,0,1);
    if (iVar3 != 0) {
      if (iVar3 != 2) {
        return *(undefined4 *)(&DAT_011436b8 + iVar2);
      }
      DAT_0124a3b8 = 1;
      return *(undefined4 *)(&DAT_011436b8 + iVar2);
    }
    DebugBreak();
  }
  return *(undefined4 *)(&DAT_011436b8 + iVar2);
}

