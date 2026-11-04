// 100fe1ee size=375 __NMSG_WRITE

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* WARNING: Unable to track spacebase fully for stack */
/* Library Function - Single Match
    __NMSG_WRITE
   
   Library: Visual Studio 2003 Release */

void __cdecl __NMSG_WRITE(int param_1)

{
  int iVar1;
  uint uVar2;
  DWORD DVar3;
  size_t sVar4;
  size_t sVar5;
  HANDLE hFile;
  CHAR *pCVar6;
  CHAR *pCVar7;
  int iVar8;
  char *_Str;
  undefined4 uStackY_14c;
  UINT aUStackY_148 [3];
  undefined1 auStackY_13c [4];
  undefined4 uStackY_138;
  undefined4 uStackY_134;
  LPCVOID lpBuffer;
  LPDWORD lpNumberOfBytesWritten;
  LPOVERLAPPED lpOverlapped;
  CHAR local_110 [260];
  undefined1 local_c;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar2 = 0;
  do {
    if (param_1 == (&DAT_101a4f10)[uVar2 * 2]) break;
    uVar2 = uVar2 + 1;
  } while (uVar2 < 0x13);
  iVar8 = uVar2 * 8;
  if (param_1 == (&DAT_101a4f10)[uVar2 * 2]) {
    if ((DAT_101add88 == 1) || ((DAT_101add88 == 0 && (DAT_101add8c == 1)))) {
      lpOverlapped = (LPOVERLAPPED)0x0;
      lpNumberOfBytesWritten = (LPDWORD)&param_1;
      sVar4 = _strlen(*(char **)(iVar8 + 0x101a4f14));
      lpBuffer = *(LPCVOID *)(iVar8 + 0x101a4f14);
      uStackY_134 = 0x100fe342;
      hFile = GetStdHandle(0xfffffff4);
      uStackY_134 = 0x100fe349;
      WriteFile(hFile,lpBuffer,sVar4,lpNumberOfBytesWritten,lpOverlapped);
    }
    else if (param_1 != 0xfc) {
      local_c = 0;
      DVar3 = GetModuleFileNameA((HMODULE)0x0,local_110,0x104);
      if (DVar3 == 0) {
        FUN_100fe890();
      }
      _Str = local_110;
      sVar4 = _strlen(_Str);
      if (0x3c < sVar4 + 1) {
        sVar4 = _strlen(_Str);
        _Str = (char *)((int)&uStackY_14c + sVar4 + 1);
        _strncpy(_Str,"...",3);
      }
      sVar4 = _strlen(_Str);
      sVar5 = _strlen(*(char **)(iVar8 + 0x101a4f14));
      iVar1 = -(sVar4 + sVar5 + 0x1f & 0xfffffffc);
      *(char **)(local_110 + iVar1 + -0x10) = "Runtime Error!\n\nProgram: ";
      *(CHAR **)(local_110 + iVar1 + -0x14) = local_110 + iVar1 + -0xc;
      pCVar6 = local_110 + iVar1 + -0x18;
      pCVar6[0] = -0x12;
      pCVar6[1] = -0x1e;
      pCVar6[2] = '\x0f';
      pCVar6[3] = '\x10';
      FUN_100fe890();
      *(char **)(local_110 + iVar1 + -0x18) = _Str;
      *(CHAR **)(local_110 + iVar1 + -0x1c) = local_110 + iVar1 + -0xc;
      pCVar7 = local_110 + iVar1 + -0x20;
      pCVar7[0] = -0xb;
      pCVar7[1] = -0x1e;
      pCVar7[2] = '\x0f';
      pCVar7[3] = '\x10';
      FUN_100fe8a0();
      *(undefined **)(local_110 + iVar1 + -0x20) = &DAT_1017cdb8;
      *(CHAR **)((int)&uStackY_134 + iVar1) = local_110 + iVar1 + -0xc;
      *(undefined4 *)((int)&uStackY_138 + iVar1) = 0x100fe300;
      FUN_100fe8a0();
      *(undefined4 *)((int)&uStackY_138 + iVar1) = *(undefined4 *)(iVar8 + 0x101a4f14);
      *(CHAR **)(auStackY_13c + iVar1) = local_110 + iVar1 + -0xc;
      *(undefined4 *)((int)aUStackY_148 + iVar1 + 8) = 0x100fe30c;
      FUN_100fe8a0();
      *(undefined4 *)((int)aUStackY_148 + iVar1 + 8) = 0x12010;
      *(char **)((int)aUStackY_148 + iVar1 + 4) = "Microsoft Visual C++ Runtime Library";
      *(CHAR **)((int)aUStackY_148 + iVar1) = local_110 + iVar1 + -0xc;
      *(undefined4 *)((int)&uStackY_14c + iVar1) = 0x100fe31c;
      ___crtMessageBoxA(*(LPCSTR *)((int)aUStackY_148 + iVar1),
                        *(LPCSTR *)((int)aUStackY_148 + iVar1 + 4),
                        *(UINT *)((int)aUStackY_148 + iVar1 + 8));
    }
  }
  return;
}


