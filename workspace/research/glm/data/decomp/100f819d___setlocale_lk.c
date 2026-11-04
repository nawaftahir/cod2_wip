// 100f819d size=473 __setlocale_lk

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __setlocale_lk
   
   Library: Visual Studio 2003 Release */

undefined4 __setlocale_lk(void)

{
  bool bVar1;
  undefined4 uVar2;
  char *pcVar3;
  size_t sVar4;
  int iVar5;
  size_t sVar6;
  char *in_ECX;
  int in_EDX;
  undefined4 *puVar7;
  undefined **ppuVar8;
  int local_98;
  int local_90;
  char local_8c [132];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  if (in_EDX != 0) {
    if (in_ECX == (char *)0x0) {
      return (&DAT_101a47c4)[in_EDX * 3];
    }
    uVar2 = __setlocale_set_cat();
    return uVar2;
  }
  bVar1 = true;
  local_90 = 0;
  if (in_ECX != (char *)0x0) {
    if (((*in_ECX == 'L') && (in_ECX[1] == 'C')) && (in_ECX[2] == '_')) {
      do {
        pcVar3 = _strpbrk(in_ECX,"=;");
        if (((pcVar3 == (char *)0x0) || (sVar4 = (int)pcVar3 - (int)in_ECX, sVar4 == 0)) ||
           (*pcVar3 == ';')) {
          return 0;
        }
        local_98 = 1;
        ppuVar8 = &PTR_s_LC_COLLATE_101a47cc;
        do {
          iVar5 = _strncmp(*ppuVar8,in_ECX,sVar4);
          if ((iVar5 == 0) && (sVar6 = _strlen(*ppuVar8), sVar4 == sVar6)) break;
          local_98 = local_98 + 1;
          ppuVar8 = ppuVar8 + 3;
        } while ((int)ppuVar8 < 0x101a47fd);
        pcVar3 = pcVar3 + 1;
        sVar4 = _strcspn(pcVar3,";");
        if ((sVar4 == 0) && (*pcVar3 != ';')) {
          return 0;
        }
        if (local_98 < 6) {
          _strncpy(local_8c,pcVar3,sVar4);
          local_8c[sVar4] = '\0';
          iVar5 = __setlocale_set_cat(local_8c);
          if (iVar5 != 0) {
            local_90 = local_90 + 1;
          }
        }
      } while ((pcVar3[sVar4] != '\0') && (in_ECX = pcVar3 + sVar4 + 1, *in_ECX != '\0'));
      if (local_90 == 0) {
        return 0;
      }
    }
    else {
      iVar5 = __expandlocale();
      if (iVar5 == 0) {
        return 0;
      }
      puVar7 = &DAT_101a47c4;
      do {
        if ((void **)puVar7 != &DAT_101a47c4) {
          iVar5 = _strcmp(local_8c,(char *)*puVar7);
          if ((iVar5 == 0) || (iVar5 = __setlocale_set_cat(local_8c), iVar5 != 0)) {
            local_90 = local_90 + 1;
          }
          else {
            bVar1 = false;
          }
        }
        puVar7 = puVar7 + 3;
      } while ((int)puVar7 < 0x101a4801);
      if (bVar1) {
        uVar2 = FUN_100f7cf3();
        _free(DAT_101a47c4);
        DAT_101a47c4 = (void *)0x0;
        return uVar2;
      }
      if (local_90 == 0) {
        return 0;
      }
    }
  }
  uVar2 = FUN_100f7cf3();
  return uVar2;
}


