// 10107af1 size=743 __tsopen_lk

/* Library Function - Single Match
    __tsopen_lk
   
   Library: Visual Studio 2003 Release */

uint __tsopen_lk(undefined4 *param_1,uint *param_2,LPCSTR param_3,uint param_4,byte param_5)

{
  byte *pbVar1;
  byte bVar2;
  uint uVar3;
  undefined4 *puVar4;
  HANDLE hFile;
  int *piVar5;
  int iVar6;
  int in_ECX;
  DWORD DVar7;
  int iVar8;
  bool bVar9;
  _SECURITY_ATTRIBUTES local_20;
  DWORD local_14;
  DWORD local_10;
  uint local_c;
  char local_6;
  byte local_5;
  
  bVar9 = -1 < (char)param_4;
  local_20.nLength = 0xc;
  local_20.lpSecurityDescriptor = (LPVOID)0x0;
  if (bVar9) {
    local_5 = 0;
  }
  else {
    local_5 = 0x10;
  }
  local_20.bInheritHandle = (BOOL)bVar9;
  if (((param_4 & 0x8000) == 0) && (((param_4 & 0x4000) != 0 || (DAT_101ae25c != 0x8000)))) {
    local_5 = local_5 | 0x80;
  }
  uVar3 = param_4 & 3;
  if (uVar3 == 0) {
    local_14 = 0x80000000;
  }
  else if (uVar3 == 1) {
    local_14 = 0x40000000;
  }
  else {
    if (uVar3 != 2) goto LAB_10107b78;
    local_14 = 0xc0000000;
  }
  if (in_ECX == 0x10) {
    local_c = 0;
  }
  else if (in_ECX == 0x20) {
    local_c = 1;
  }
  else if (in_ECX == 0x30) {
    local_c = 2;
  }
  else {
    if (in_ECX != 0x40) {
LAB_10107b78:
      puVar4 = (undefined4 *)FUN_100fc216();
      *puVar4 = 0x16;
      puVar4 = (undefined4 *)FUN_100fc21f();
      *puVar4 = 0;
      return 0xffffffff;
    }
    local_c = 3;
  }
  uVar3 = param_4 & 0x700;
  if (uVar3 < 0x401) {
    if ((uVar3 == 0x400) || (uVar3 == 0)) {
      local_10 = 3;
    }
    else if (uVar3 == 0x100) {
      local_10 = 4;
    }
    else {
      if (uVar3 == 0x200) goto LAB_10107c1f;
      if (uVar3 != 0x300) goto LAB_10107c05;
      local_10 = 2;
    }
  }
  else {
    if (uVar3 != 0x500) {
      if (uVar3 == 0x600) {
LAB_10107c1f:
        local_10 = 5;
        goto LAB_10107c2f;
      }
      if (uVar3 != 0x700) {
LAB_10107c05:
        puVar4 = (undefined4 *)FUN_100fc216();
        *puVar4 = 0x16;
        puVar4 = (undefined4 *)FUN_100fc21f();
        *puVar4 = 0;
        return 0xffffffff;
      }
    }
    local_10 = 1;
  }
LAB_10107c2f:
  DVar7 = 0x80;
  if (((param_4 & 0x100) != 0) && (-1 < (char)(~(byte)DAT_101ae008 & param_5))) {
    DVar7 = 1;
  }
  if ((param_4 & 0x40) != 0) {
    local_14 = CONCAT13(local_14._3_1_,0x10000);
    DVar7 = DVar7 | 0x4000000;
    if (DAT_101ae00c == 2) {
      local_c = local_c | 4;
    }
  }
  if ((param_4 & 0x1000) != 0) {
    DVar7 = DVar7 | 0x100;
  }
  if ((param_4 & 0x20) == 0) {
    if ((param_4 & 0x10) != 0) {
      DVar7 = DVar7 | 0x10000000;
    }
  }
  else {
    DVar7 = DVar7 | 0x8000000;
  }
  uVar3 = __alloc_osfhnd();
  if (uVar3 == 0xffffffff) {
    puVar4 = (undefined4 *)FUN_100fc216();
    *puVar4 = 0x18;
    puVar4 = (undefined4 *)FUN_100fc21f();
    *puVar4 = 0;
  }
  else {
    *param_1 = 1;
    *param_2 = uVar3;
    hFile = CreateFileA(param_3,local_14,local_c,&local_20,local_10,DVar7,(HANDLE)0x0);
    if (hFile != (HANDLE)0xffffffff) {
      DVar7 = GetFileType(hFile);
      if (DVar7 != 0) {
        if (DVar7 == 2) {
          local_5 = local_5 | 0x40;
        }
        else if (DVar7 == 3) {
          local_5 = local_5 | 8;
        }
        __set_osfhnd(uVar3,(intptr_t)hFile);
        bVar2 = local_5 | 1;
        iVar8 = (uVar3 & 0x1f) * 0x24;
        local_5 = local_5 & 0x48;
        *(byte *)(iVar8 + 4 + (&DAT_1076aca0)[(int)uVar3 >> 5]) = bVar2;
        if (((local_5 == 0) && ((char)bVar2 < '\0')) && ((param_4 & 2) != 0)) {
          local_14 = __lseek_lk(uVar3,0xffffffff,2);
          if (local_14 == -1) {
            piVar5 = (int *)FUN_100fc21f();
            if (*piVar5 == 0x83) goto LAB_10107d71;
          }
          else {
            local_6 = '\0';
            iVar6 = __read_lk(uVar3,&local_6,1);
            if ((((iVar6 != 0) || (local_6 != '\x1a')) ||
                (iVar6 = __chsize_lk(uVar3,local_14), iVar6 != -1)) &&
               (iVar6 = __lseek_lk(uVar3,0,0), iVar6 != -1)) goto LAB_10107d71;
          }
          __close_lk(uVar3);
          return 0xffffffff;
        }
LAB_10107d71:
        if (local_5 != 0) {
          return uVar3;
        }
        if ((param_4 & 8) == 0) {
          return uVar3;
        }
        pbVar1 = (byte *)(iVar8 + 4 + (&DAT_1076aca0)[(int)uVar3 >> 5]);
        *pbVar1 = *pbVar1 | 0x20;
        return uVar3;
      }
      CloseHandle(hFile);
    }
    DVar7 = GetLastError();
    __dosmaperr(DVar7);
  }
  return 0xffffffff;
}


