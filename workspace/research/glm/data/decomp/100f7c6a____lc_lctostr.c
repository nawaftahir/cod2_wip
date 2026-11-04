// 100f7c6a size=78 ___lc_lctostr

/* Library Function - Single Match
    ___lc_lctostr
   
   Library: Visual Studio 2003 Release */

void ___lc_lctostr(undefined4 param_1,int param_2)

{
  FUN_100fe890(param_1,param_2);
  if (*(char *)(param_2 + 0x40) != '\0') {
    __strcats(param_1,2,&DAT_1017c67c,(char *)(param_2 + 0x40));
  }
  if (*(char *)(param_2 + 0x80) != '\0') {
    __strcats(param_1,2,&DAT_10195640,(char *)(param_2 + 0x80));
  }
  return;
}


