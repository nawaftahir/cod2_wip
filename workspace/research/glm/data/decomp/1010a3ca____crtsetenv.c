// 1010a3ca size=469 ___crtsetenv

/* Library Function - Single Match
    ___crtsetenv
   
   Library: Visual Studio 2003 Release */

int __cdecl ___crtsetenv(char **_POption,int _Primary)

{
  uchar *_Str;
  uchar *puVar1;
  int iVar2;
  int *piVar3;
  size_t sVar4;
  LPCSTR lpName;
  BOOL BVar5;
  bool bVar6;
  int local_14;
  
  local_14 = 0;
  if (_POption == (char **)0x0) {
    return -1;
  }
  _Str = (uchar *)*_POption;
  if (_Str == (uchar *)0x0) {
    return -1;
  }
  puVar1 = __mbschr(_Str,0x3d);
  if (puVar1 == (uchar *)0x0) {
    return -1;
  }
  if (_Str == puVar1) {
    return -1;
  }
  bVar6 = puVar1[1] == '\0';
  if (DAT_101ae02c == DAT_101ae030) {
    DAT_101ae02c = (int *)copy_environ();
  }
  if (DAT_101ae02c == (int *)0x0) {
    if ((_Primary != 0) && (DAT_101ae034 != (undefined4 *)0x0)) {
      iVar2 = ___wtomb_environ();
      if (iVar2 != 0) {
        return -1;
      }
      goto LAB_1010a47f;
    }
    if (!bVar6) {
      DAT_101ae02c = _malloc(4);
      if (DAT_101ae02c == (int *)0x0) {
        return -1;
      }
      *DAT_101ae02c = 0;
      if (DAT_101ae034 == (undefined4 *)0x0) {
        DAT_101ae034 = _malloc(4);
        if (DAT_101ae034 == (undefined4 *)0x0) {
          return -1;
        }
        *DAT_101ae034 = 0;
      }
      goto LAB_1010a47f;
    }
LAB_1010a44d:
    local_14 = 0;
  }
  else {
LAB_1010a47f:
    piVar3 = DAT_101ae02c;
    iVar2 = findenv(_Str);
    if ((iVar2 < 0) || (*piVar3 == 0)) {
      if (bVar6) {
        _free(_Str);
        *_POption = (char *)0x0;
        goto LAB_1010a44d;
      }
      if (iVar2 < 0) {
        iVar2 = -iVar2;
      }
      piVar3 = _realloc(DAT_101ae02c,iVar2 * 4 + 8);
      if (piVar3 == (int *)0x0) {
        return -1;
      }
      piVar3[iVar2] = (int)_Str;
      (piVar3 + iVar2)[1] = 0;
      *_POption = (char *)0x0;
LAB_1010a51c:
      DAT_101ae02c = piVar3;
    }
    else {
      piVar3 = piVar3 + iVar2;
      _free((void *)*piVar3);
      if (bVar6) {
        for (; *piVar3 != 0; piVar3 = piVar3 + 1) {
          *piVar3 = piVar3[1];
          iVar2 = iVar2 + 1;
        }
        piVar3 = _realloc(DAT_101ae02c,iVar2 << 2);
        if (piVar3 != (int *)0x0) goto LAB_1010a51c;
      }
      else {
        *piVar3 = (int)_Str;
        *_POption = (char *)0x0;
      }
    }
    if (_Primary != 0) {
      sVar4 = _strlen((char *)_Str);
      lpName = _malloc(sVar4 + 2);
      if (lpName != (LPCSTR)0x0) {
        FUN_100fe890(lpName,_Str);
        puVar1[(int)lpName - (int)_Str] = '\0';
        BVar5 = SetEnvironmentVariableA
                          (lpName,(LPCSTR)(~-(uint)bVar6 &
                                          (uint)(puVar1 + ((int)lpName - (int)_Str) + 1)));
        if (BVar5 == 0) {
          local_14 = -1;
        }
        _free(lpName);
      }
    }
    if (bVar6) {
      _free(_Str);
    }
  }
  return local_14;
}


