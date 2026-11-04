// 100993ad size=304 FUN_100993ad

void FUN_100993ad(int param_1,char *param_2)

{
  int iVar1;
  char *pcVar2;
  bool bVar3;
  char *pcVar4;
  char local_104 [255];
  undefined1 local_5;
  
  iVar1 = 0xd;
  bVar3 = true;
  pcVar4 = param_2;
  pcVar2 = "syntax error";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar3 = *pcVar4 == *pcVar2;
    pcVar4 = pcVar4 + 1;
    pcVar2 = pcVar2 + 1;
  } while (bVar3);
  if (!bVar3) {
    __vsnprintf(local_104,0x100,param_2,&stack0x0000000c);
    local_5 = 0;
    FUN_10067c3e(*(int *)(param_1 + 4) + 0x18,param_1 + 0x20,0,&DAT_10193358,local_104);
    goto LAB_100994d2;
  }
  if (*(int *)(param_1 + 0x40) != 0) goto LAB_100994d2;
  iVar1 = *(int *)(param_1 + 0x20);
  if (iVar1 < 10) {
    if (iVar1 != 9) {
      if (iVar1 == 0) {
        pcVar4 = "version token";
      }
      else {
        if (iVar1 == 1) {
          iVar1 = param_1 + 0x28;
          goto LAB_1009945c;
        }
        if (iVar1 < 2) {
LAB_10099483:
          pcVar4 = "token";
        }
        else if (iVar1 < 5) {
          pcVar4 = "integer constant";
        }
        else {
          if (8 < iVar1) goto LAB_10099483;
          pcVar4 = "float constant";
        }
      }
      goto LAB_1009949d;
    }
    iVar1 = *(int *)(param_1 + 0x28);
LAB_1009945c:
    __snprintf(local_104,0x100,"token \'%s\'",iVar1);
  }
  else {
    if (iVar1 == 10) {
      pcVar4 = "string constant";
    }
    else if (iVar1 == 0xc) {
      pcVar4 = "end of line";
    }
    else {
      if (iVar1 != 0xd) goto LAB_10099483;
      pcVar4 = "end of file";
    }
LAB_1009949d:
    __snprintf(local_104,0x100,pcVar4);
  }
  FUN_10067c3e(*(int *)(param_1 + 4) + 0x18,(int *)(param_1 + 0x20),3000,
               "syntax error: unexpected %s",local_104);
LAB_100994d2:
  *(undefined4 *)(param_1 + 0x40) = 1;
  return;
}


