// 10106cf3 size=396 setSBUpLow

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _setSBUpLow
   
   Library: Visual Studio 2003 Release */

void __cdecl setSBUpLow(void)

{
  BOOL BVar1;
  uint uVar2;
  undefined1 uVar3;
  char cVar4;
  uint uVar5;
  uint uVar6;
  BYTE *pBVar7;
  undefined4 *puVar8;
  _locale_t _BError;
  ushort local_51c [256];
  undefined1 local_31c [256];
  undefined1 local_21c [256];
  undefined4 local_11c [64];
  _cpinfo local_1c;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  BVar1 = GetCPInfo((UINT)DAT_1076ab44,&local_1c);
  if (BVar1 == 1) {
    uVar2 = 0;
    do {
      *(char *)((int)local_11c + uVar2) = (char)uVar2;
      uVar2 = uVar2 + 1;
    } while (uVar2 < 0x100);
    local_11c[0]._0_1_ = 0x20;
    if (local_1c.LeadByte[0] != 0) {
      pBVar7 = local_1c.LeadByte + 1;
      do {
        uVar2 = (uint)local_1c.LeadByte[0];
        if (uVar2 <= *pBVar7) {
          uVar5 = (*pBVar7 - uVar2) + 1;
          puVar8 = (undefined4 *)((int)local_11c + uVar2);
          for (uVar6 = uVar5 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
            *puVar8 = 0x20202020;
            puVar8 = puVar8 + 1;
          }
          for (uVar5 = uVar5 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
            *(undefined1 *)puVar8 = 0x20;
            puVar8 = (undefined4 *)((int)puVar8 + 1);
          }
        }
        local_1c.LeadByte[0] = pBVar7[1];
        pBVar7 = pBVar7 + 2;
      } while (local_1c.LeadByte[0] != 0);
    }
    BVar1 = 1;
    ___crtGetStringTypeA
              ((_locale_t)0x1,(DWORD)local_11c,(LPCSTR)0x100,(int)local_51c,DAT_1076ab44,
               (int)DAT_1076aa30,0);
    _BError = DAT_1076aa30;
    ___crtLCMapStringA(DAT_1076aa30,(LPCWSTR)0x100,(DWORD)local_11c,(LPCSTR)0x100,(int)local_21c,
                       (LPSTR)0x100,(int)DAT_1076ab44,0,BVar1);
    ___crtLCMapStringA(DAT_1076aa30,(LPCWSTR)0x200,(DWORD)local_11c,(LPCSTR)0x100,(int)local_31c,
                       (LPSTR)0x100,(int)DAT_1076ab44,0,(BOOL)_BError);
    uVar2 = 0;
    do {
      if ((local_51c[uVar2] & 1) == 0) {
        if ((local_51c[uVar2] & 2) != 0) {
          (&DAT_1076aa41)[uVar2] = (&DAT_1076aa41)[uVar2] | 0x20;
          uVar3 = local_31c[uVar2];
          goto LAB_10106e05;
        }
        (&DAT_1076ab60)[uVar2] = 0;
      }
      else {
        (&DAT_1076aa41)[uVar2] = (&DAT_1076aa41)[uVar2] | 0x10;
        uVar3 = local_21c[uVar2];
LAB_10106e05:
        (&DAT_1076ab60)[uVar2] = uVar3;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < 0x100);
  }
  else {
    uVar2 = 0;
    do {
      if ((uVar2 < 0x41) || (0x5a < uVar2)) {
        if ((0x60 < uVar2) && (uVar2 < 0x7b)) {
          (&DAT_1076aa41)[uVar2] = (&DAT_1076aa41)[uVar2] | 0x20;
          cVar4 = (char)uVar2 + -0x20;
          goto LAB_10106e48;
        }
        (&DAT_1076ab60)[uVar2] = 0;
      }
      else {
        (&DAT_1076aa41)[uVar2] = (&DAT_1076aa41)[uVar2] | 0x10;
        cVar4 = (char)uVar2 + ' ';
LAB_10106e48:
        (&DAT_1076ab60)[uVar2] = cVar4;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < 0x100);
  }
  return;
}


