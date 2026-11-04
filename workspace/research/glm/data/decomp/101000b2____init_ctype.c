// 101000b2 size=490 ___init_ctype

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    ___init_ctype
   
   Library: Visual Studio 2003 Release */

int __cdecl ___init_ctype(threadlocinfo *_LocInfo)

{
  BYTE *pBVar1;
  byte bVar2;
  int iVar3;
  BOOL BVar4;
  BYTE *pBVar5;
  uint uVar6;
  undefined2 *puVar7;
  void *unaff_ESI;
  void *local_28;
  undefined4 *local_24;
  void *local_20;
  _cpinfo local_1c;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  local_20 = (void *)0x0;
  if (DAT_101ae198 == 0) {
    PTR_DAT_101a5090 = &DAT_1017d080;
    DAT_1076ac80 = (undefined2 *)0x0;
    DAT_1076ac84 = (undefined4 *)0x0;
    return 0;
  }
  if ((DAT_101ae1a8 != 0) ||
     (iVar3 = ___getlocaleinfo((_locale_t)0x0,(uint)DAT_101ae1c0,(LPCWSTR)0x1004,0x101ae1a8,
                               unaff_ESI), iVar3 == 0)) {
    local_24 = _malloc(4);
    local_28 = _malloc(0x300);
    local_20 = _malloc(0x101);
    if ((local_24 != (undefined4 *)0x0) && ((local_28 != (void *)0x0 && (local_20 != (void *)0x0))))
    {
      *local_24 = 0;
      iVar3 = 0;
      do {
        *(char *)(iVar3 + (int)local_20) = (char)iVar3;
        iVar3 = iVar3 + 1;
      } while (iVar3 < 0x100);
      BVar4 = GetCPInfo(DAT_101ae1a8,&local_1c);
      if ((BVar4 != 0) && (local_1c.MaxCharSize < 6)) {
        DAT_101a50e0 = local_1c.MaxCharSize & 0xffff;
        if ((1 < DAT_101a50e0) && (local_1c.LeadByte[0] != '\0')) {
          pBVar5 = local_1c.LeadByte + 1;
          do {
            bVar2 = *pBVar5;
            if (bVar2 == 0) break;
            for (uVar6 = (uint)pBVar5[-1]; (int)uVar6 <= (int)(uint)bVar2; uVar6 = uVar6 + 1) {
              *(undefined1 *)(uVar6 + (int)local_20) = 0;
              bVar2 = *pBVar5;
            }
            pBVar1 = pBVar5 + 1;
            pBVar5 = pBVar5 + 2;
          } while (*pBVar1 != 0);
        }
        BVar4 = ___crtGetStringTypeA
                          ((_locale_t)0x1,(DWORD)local_20,(LPCSTR)0x100,(int)local_28 + 0x100,
                           (LPWORD)0x0,0,0);
        if (BVar4 != 0) {
          *(undefined2 *)((int)local_28 + 0xfe) = 0;
          if ((1 < (int)DAT_101a50e0) && (local_1c.LeadByte[0] != '\0')) {
            pBVar5 = local_1c.LeadByte + 1;
            do {
              if (*pBVar5 == 0) break;
              uVar6 = (uint)pBVar5[-1];
              if (uVar6 <= *pBVar5) {
                puVar7 = (undefined2 *)((int)local_28 + uVar6 * 2 + 0x100);
                do {
                  *puVar7 = 0x8000;
                  uVar6 = uVar6 + 1;
                  puVar7 = puVar7 + 1;
                } while ((int)uVar6 <= (int)(uint)*pBVar5);
              }
              pBVar1 = pBVar5 + 1;
              pBVar5 = pBVar5 + 2;
            } while (*pBVar1 != 0);
          }
          _memcpy(local_28,(void *)((int)local_28 + 0x200),0xfe);
          iVar3 = 0;
          PTR_DAT_101a5090 = (undefined *)((int)local_28 + 0x100);
          DAT_1076ac80 = (undefined2 *)((int)local_28 + 0xfe);
          DAT_1076ac84 = local_24;
          goto LAB_10100252;
        }
      }
    }
  }
  _free(local_24);
  _free(local_28);
  iVar3 = 1;
LAB_10100252:
  _free(local_20);
  return iVar3;
}


