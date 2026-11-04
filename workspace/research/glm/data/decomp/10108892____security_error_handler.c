// 10108892 size=318 ___security_error_handler

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* Library Function - Single Match
    ___security_error_handler
   
   Library: Visual Studio 2003 Release */

void ___security_error_handler(int param_1)

{
  DWORD DVar1;
  size_t sVar2;
  char *_Str;
  char *local_12c;
  CHAR local_128 [260];
  undefined1 local_24;
  undefined4 local_20;
  undefined1 *local_1c;
  undefined4 uStack_c;
  undefined *local_8;
  
  local_8 = &DAT_101824e0;
  uStack_c = 0x101088a1;
  local_20 = DAT_101a50d0;
  if (DAT_101ae258 == (code *)0x0) {
    if (param_1 == 1) {
      local_12c = 
      "A buffer overrun has been detected which has corrupted the program\'s\ninternal state.  The program cannot safely continue execution and must\nnow be terminated.\n"
      ;
    }
    else {
      local_12c = 
      "A security error of unknown cause has been detected which has\ncorrupted the program\'s internal state.  The program cannot safely\ncontinue execution and must now be terminated.\n"
      ;
    }
    local_24 = 0;
    DVar1 = GetModuleFileNameA((HMODULE)0x0,local_128,0x104);
    if (DVar1 == 0) {
      FUN_100fe890();
    }
    _Str = local_128;
    sVar2 = _strlen(_Str);
    if (0x3c < sVar2 + 0xb) {
      sVar2 = _strlen(_Str);
      _Str = &stack0xfffffea7 + sVar2;
      _strncpy(_Str,"...",3);
    }
    _strlen(_Str);
    local_1c = &stack0xfffffec8;
    FUN_100fe890();
    FUN_100fe8a0();
    FUN_100fe8a0();
    FUN_100fe8a0();
    FUN_100fe8a0(&stack0xfffffec8,&DAT_1017cdb8);
    FUN_100fe8a0(&stack0xfffffec8,local_12c);
    ___crtMessageBoxA(&stack0xfffffec8,"Microsoft Visual C++ Runtime Library",0x12010);
  }
  else {
    local_8 = (undefined *)0x0;
    (*DAT_101ae258)();
    local_8 = (undefined *)0xffffffff;
  }
                    /* WARNING: Subroutine does not return */
  __exit(3);
}


