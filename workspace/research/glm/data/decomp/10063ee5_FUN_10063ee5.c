// 10063ee5 size=186 FUN_10063ee5

void FUN_10063ee5(int param_1,char *param_2)

{
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  bool bVar4;
  char local_104 [255];
  undefined1 local_5;
  
  *(undefined4 *)(param_1 + 0x44) = 1;
  if (*(int *)(param_1 + 0x50) != 0) {
    iVar1 = 0xd;
    bVar4 = true;
    pcVar2 = param_2;
    pcVar3 = "syntax error";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar4 = *pcVar2 == *pcVar3;
      pcVar2 = pcVar2 + 1;
      pcVar3 = pcVar3 + 1;
    } while (bVar4);
    if (bVar4) {
      if ((*(int *)(param_1 + 0x4c) == 0) || (*(int *)(param_1 + 0x278) != 9)) {
        FUN_10067e62(0x5dc,param_1 + 0x278);
      }
      else {
        FUN_10067c3e(param_1 + 0x18,(int *)(param_1 + 0x278),0x5e0,
                     "invalid preprocessor command \'%s\'",*(undefined4 *)(param_1 + 0x280));
      }
    }
    else {
      __vsnprintf(local_104,0x100,param_2,&stack0x0000000c);
      local_5 = 0;
      FUN_10067c3e(param_1 + 0x18,param_1 + 0x278,0,&DAT_10193358,local_104);
    }
  }
  return;
}


