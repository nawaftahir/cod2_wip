
undefined4 __fastcall FUN_0047c9b0(int param_1,char *param_2,char param_3)

{
  FILE *in_EAX;
  char *pcVar1;
  
  pcVar1 = _fgets(param_2,param_1,in_EAX);
  if (pcVar1 != (char *)0x0) {
    return 1;
  }
  if (param_3 != '\0') {
    MessageBoxA((HWND)0x0,"Unexpected end-of-file parsing .map file",".map parse error",0x10);
  }
  return 0;
}

