// 10068c42 size=192 FUN_10068c42

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10068c42(undefined4 *param_1,char *param_2)

{
  int *piVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  char local_1004 [255];
  undefined1 local_f05;
  undefined4 uStack_8;
  
  uStack_8 = 0x10068c51;
  iVar2 = 0xd;
  bVar5 = true;
  param_1[0x13] = 1;
  pcVar3 = param_2;
  pcVar4 = "syntax error";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    piVar1 = param_1 + 4;
    FUN_10067e62(2000,piVar1);
    if (*piVar1 == 9) {
      if (param_1[0x15] == 0x7e7) {
        FUN_10067c3e(*param_1,piVar1,0x7e7,
                     "\'%s\' is not a valid instruction in this shader version",param_1[6]);
      }
      if (param_1[0x15] == 0x7e8) {
        FUN_10067c3e(*param_1,piVar1,0x7e8,"invalid instruction modifiers \'%s\'",param_1[6]);
      }
    }
  }
  else {
    __vsnprintf(local_1004,0x1000,param_2,&stack0x0000000c);
    local_f05 = 0;
    FUN_10067c3e(*param_1,param_1 + 4,0,&DAT_10193358,local_1004);
  }
  return;
}


