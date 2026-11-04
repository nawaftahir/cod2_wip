
void __fastcall FUN_004968b0(char *param_1)

{
  char *pcVar1;
  char cVar2;
  int in_EAX;
  undefined4 uVar3;
  int iVar4;
  
  if ((in_EAX == 4) && (DAT_0124a4fc == '\0')) {
    uVar3 = FUN_004969e0("%s\n\t%s","size != sizeof( char * )",
                         "Chances are really high that you passed in a sizeof( pointer )",
                         "\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x2b7,0,1);
    iVar4 = FUN_0047d980(uVar3);
    if (iVar4 == 0) {
      DebugBreak();
    }
    else if (iVar4 == 2) {
      DAT_0124a4fc = '\x01';
    }
  }
  pcVar1 = param_1 + 1;
  do {
    cVar2 = *param_1;
    param_1 = param_1 + 1;
  } while (cVar2 != '\0');
  if (in_EAX <= (int)param_1 - (int)pcVar1) {
    FUN_0047ae50(0,"I_strncat: already overflowed");
  }
  FUN_00496430();
  return;
}

