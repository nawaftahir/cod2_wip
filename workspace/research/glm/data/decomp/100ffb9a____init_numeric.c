// 100ffb9a size=461 ___init_numeric

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    ___init_numeric
   
   Library: Visual Studio 2003 Release */

int __cdecl ___init_numeric(threadlocinfo *_LocInfo)

{
  char *pcVar1;
  char cVar2;
  int *_Memory;
  int iVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  undefined **_Memory_00;
  undefined4 *puVar7;
  uint _Lc_type;
  char *pcVar8;
  void *unaff_EDI;
  undefined **ppuVar9;
  void *_Address;
  void *_Address_00;
  
  if ((DAT_101ae1a0 == 0) && (DAT_101ae19c == 0)) {
    if (((DAT_1076ac8c != (int *)0x0) && (*DAT_1076ac8c == 0)) &&
       (DAT_1076ac8c != *(int **)(PTR_DAT_101a4684 + 0x2c))) {
      _free(DAT_1076ac8c);
      _free(DAT_101ae168);
    }
    DAT_1076ac90 = (undefined4 *)0x0;
    DAT_1076ac8c = (int *)0x0;
    _Memory_00 = &PTR_DAT_101a509c;
    DAT_101ae168 = (undefined **)0x0;
    ppuVar9 = DAT_101ae168;
    _Memory = DAT_1076ac8c;
LAB_100ffd47:
    DAT_1076ac8c = _Memory;
    DAT_101ae168 = ppuVar9;
    DAT_101a50e4 = **_Memory_00;
    _DAT_101a50e8 = 1;
    iVar6 = 0;
    PTR_PTR_101a50cc = (undefined *)_Memory_00;
  }
  else {
    _Memory_00 = _calloc(1,0x30);
    if (_Memory_00 != (undefined **)0x0) {
      puVar7 = (undefined4 *)PTR_PTR_101a50cc;
      ppuVar9 = _Memory_00;
      for (iVar6 = 0xc; iVar6 != 0; iVar6 = iVar6 + -1) {
        *ppuVar9 = (undefined *)*puVar7;
        puVar7 = puVar7 + 1;
        ppuVar9 = ppuVar9 + 1;
      }
      _Memory = _malloc(4);
      if (_Memory != (int *)0x0) {
        *_Memory = 0;
        if (DAT_101ae1a0 == 0) {
          DAT_1076ac90 = (undefined4 *)0x0;
          *_Memory_00 = PTR_DAT_101a509c;
          _Memory_00[1] = PTR_DAT_101a50a0;
          _Memory_00[2] = PTR_DAT_101a50a4;
        }
        else {
          DAT_1076ac90 = _malloc(4);
          if (DAT_1076ac90 == (undefined4 *)0x0) {
            iVar6 = 1;
LAB_100ffca5:
            _free(_Memory_00);
            _free(_Memory);
            return iVar6;
          }
          *DAT_1076ac90 = 0;
          _Lc_type = (uint)DAT_101ae1ce;
          _Address_00 = (void *)0x1;
          iVar6 = ___getlocaleinfo((_locale_t)0x1,_Lc_type,(LPCWSTR)0xe,(LCTYPE)_Memory_00,unaff_EDI
                                  );
          _Address = (void *)0x1;
          iVar3 = ___getlocaleinfo((_locale_t)0x1,_Lc_type,(LPCWSTR)0xf,(LCTYPE)(_Memory_00 + 1),
                                   _Address_00);
          iVar4 = ___getlocaleinfo((_locale_t)0x1,_Lc_type,(LPCWSTR)0x10,(LCTYPE)(_Memory_00 + 2),
                                   _Address);
          if (iVar4 != 0 || (iVar6 != 0 || iVar3 != 0)) {
            ___free_lconv_num(_Memory_00);
            iVar6 = -1;
            goto LAB_100ffca5;
          }
          pcVar5 = _Memory_00[2];
          while (*pcVar5 != '\0') {
            cVar2 = *pcVar5;
            if ((cVar2 < '0') || ('9' < cVar2)) {
              pcVar8 = pcVar5;
              if (cVar2 != ';') goto LAB_100ffcd1;
              do {
                pcVar1 = pcVar8 + 1;
                *pcVar8 = *pcVar1;
                pcVar8 = pcVar1;
              } while (*pcVar1 != '\0');
            }
            else {
              *pcVar5 = cVar2 + -0x30;
LAB_100ffcd1:
              pcVar5 = pcVar5 + 1;
            }
          }
        }
        ppuVar9 = _Memory_00;
        if (((DAT_1076ac8c != (int *)0x0) && (*DAT_1076ac8c == 0)) &&
           (DAT_1076ac8c != *(int **)(PTR_DAT_101a4684 + 0x2c))) {
          _free(DAT_1076ac8c);
          _free(DAT_101ae168);
        }
        goto LAB_100ffd47;
      }
      _free(_Memory_00);
    }
    iVar6 = 1;
  }
  return iVar6;
}


