// 10107615 size=124 __set_osfhnd

/* Library Function - Single Match
    __set_osfhnd
   
   Library: Visual Studio 2003 Release */

int __cdecl __set_osfhnd(int param_1,intptr_t param_2)

{
  undefined4 *puVar1;
  int iVar2;
  DWORD nStdHandle;
  
  if ((uint)param_1 < DAT_1076ac9c) {
    iVar2 = (param_1 & 0x1fU) * 0x24;
    if (*(int *)(iVar2 + (&DAT_1076aca0)[param_1 >> 5]) == -1) {
      if (DAT_101add8c == 1) {
        if (param_1 == 0) {
          nStdHandle = 0xfffffff6;
        }
        else if (param_1 == 1) {
          nStdHandle = 0xfffffff5;
        }
        else {
          if (param_1 != 2) goto LAB_1010766e;
          nStdHandle = 0xfffffff4;
        }
        SetStdHandle(nStdHandle,(HANDLE)param_2);
      }
LAB_1010766e:
      *(intptr_t *)(iVar2 + (&DAT_1076aca0)[param_1 >> 5]) = param_2;
      return 0;
    }
  }
  puVar1 = (undefined4 *)FUN_100fc216();
  *puVar1 = 9;
  puVar1 = (undefined4 *)FUN_100fc21f();
  *puVar1 = 0;
  return -1;
}


