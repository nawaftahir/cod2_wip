
undefined4 FUN_00435760(char *param_1,undefined4 param_2,char param_3)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  if ((in_EAX == 0) && (DAT_0124a14c == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\Pmesh.cpp",0x1870,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a14c = '\x01';
    }
  }
  if ((*(int *)(in_EAX + 0x44) == 0) && (DAT_0124a14b == '\0')) {
    iVar1 = FUN_0047d980("b->patch",".\\Pmesh.cpp",0x1871,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a14b = '\x01';
    }
  }
  iVar1 = *(int *)(in_EAX + 0x44);
  if (param_3 == '\0') {
    iVar2 = __stricmp(*(char **)(*(int *)(iVar1 + 0x18 + DAT_01128d90 * 4) + 4),param_1);
    if (iVar2 != 0) {
      return 0;
    }
  }
  uVar3 = FUN_00440840();
  *(undefined4 *)(iVar1 + 0x18 + DAT_01128d90 * 4) = uVar3;
  *(short *)(iVar1 + 0x382c) = *(short *)(iVar1 + 0x382c) + 1;
  return 1;
}

