
undefined1 * FUN_0048b9b0(void)

{
  char cVar1;
  char cVar2;
  char *in_EAX;
  int iVar3;
  char *pcVar4;
  undefined1 *puVar5;
  
  if ((in_EAX == (char *)0x0) && (DAT_0124a4cb == '\0')) {
    iVar3 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x98);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a4cb = '\x01';
    }
  }
  cVar1 = *in_EAX;
  if (cVar1 == '\0') {
    return &DAT_0053d753;
  }
  pcVar4 = in_EAX;
  do {
    cVar2 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar2 != '\0');
  cVar2 = in_EAX[1];
  if (cVar2 == '\0') {
    if (('/' < cVar1) && (cVar1 < ':')) {
      return &DAT_0053dbe0 + cVar1 * 2;
    }
  }
  else if (cVar1 == 'o') {
    if ((int)pcVar4 - (int)(in_EAX + 1) == 3) {
      if (((cVar2 == 'f') && (in_EAX[2] == 'f')) && (in_EAX[3] == '\0')) {
        return PTR_PTR_00592734;
      }
    }
    else if ((((int)pcVar4 - (int)(in_EAX + 1) == 2) && (cVar2 == 'n')) && (in_EAX[2] == '\0')) {
      return PTR_DAT_00592738;
    }
  }
  puVar5 = (undefined1 *)FUN_00489dd0();
  return puVar5;
}

