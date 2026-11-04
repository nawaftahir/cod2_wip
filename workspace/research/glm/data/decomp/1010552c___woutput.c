// 1010552c size=2064 __woutput

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __woutput
   
   Library: Visual Studio 2003 Release */

int __woutput(undefined4 param_1,ushort *param_2,wchar_t *param_3)

{
  ushort uVar1;
  wchar_t wVar2;
  short *psVar3;
  ushort *puVar4;
  wchar_t *pwVar5;
  uint uVar6;
  wchar_t *pwVar7;
  int extraout_ECX;
  int iVar8;
  uint uVar9;
  ushort uVar10;
  int iVar11;
  wchar_t *pwVar12;
  bool bVar13;
  longlong lVar14;
  uint local_45c;
  uint local_458;
  int local_450;
  uint local_44c;
  undefined4 local_448;
  int local_444;
  int local_440;
  size_t local_43c;
  int local_438;
  wchar_t *local_434;
  char local_430;
  undefined1 local_42f;
  undefined2 local_42c;
  short local_42a;
  int local_428;
  uint local_424;
  int local_420;
  int local_41c;
  wchar_t *local_418;
  size_t local_414;
  uint local_410;
  uint local_40c;
  wchar_t local_408 [255];
  undefined2 local_209;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar10 = *param_2;
  local_444 = 0;
  local_414 = 0;
  local_41c = 0;
  local_434 = (wchar_t *)0x0;
  puVar4 = param_2;
  pwVar7 = param_3;
  do {
    if (uVar10 == 0) {
      return local_41c;
    }
    param_2 = puVar4 + 1;
    if (local_41c < 0) {
      return local_41c;
    }
    if ((uVar10 < 0x20) || (0x78 < uVar10)) {
      uVar6 = 0;
    }
    else {
      uVar6 = (int)(char)(&DAT_1017c6e8)[uVar10] & 0xf;
    }
    local_444 = (int)(char)(&DAT_1017c708)[uVar6 * 8 + local_444] >> 4;
    param_3 = pwVar7;
    switch(local_444) {
    case 0:
switchD_101055b7_caseD_0:
      local_428 = 1;
      write_char(uVar10);
      break;
    case 1:
      local_410 = 0xffffffff;
      local_448 = 0;
      local_438 = 0;
      local_424 = 0;
      local_420 = 0;
      local_40c = 0;
      local_428 = 0;
      break;
    case 2:
      if (uVar10 == 0x20) {
        local_40c = local_40c | 2;
      }
      else if (uVar10 == 0x23) {
        local_40c = local_40c | 0x80;
      }
      else if (uVar10 == 0x2b) {
        local_40c = local_40c | 1;
      }
      else if (uVar10 == 0x2d) {
        local_40c = local_40c | 4;
      }
      else if (uVar10 == 0x30) {
        local_40c = local_40c | 8;
      }
      break;
    case 3:
      if (uVar10 == 0x2a) {
        local_424 = *(uint *)pwVar7;
        param_3 = pwVar7 + 2;
        if ((int)local_424 < 0) {
          local_40c = local_40c | 4;
          local_424 = -local_424;
        }
      }
      else {
        local_424 = (uVar10 - 0x30) + local_424 * 10;
      }
      break;
    case 4:
      local_410 = 0;
      break;
    case 5:
      if (uVar10 == 0x2a) {
        local_410 = *(uint *)pwVar7;
        param_3 = pwVar7 + 2;
        if ((int)local_410 < 0) {
          local_410 = 0xffffffff;
        }
      }
      else {
        local_410 = (uVar10 - 0x30) + local_410 * 10;
      }
      break;
    case 6:
      if (uVar10 == 0x49) {
        uVar1 = *param_2;
        if ((uVar1 == 0x36) && (puVar4[2] == 0x34)) {
          param_2 = puVar4 + 3;
          local_40c = local_40c | 0x8000;
        }
        else if ((uVar1 == 0x33) && (puVar4[2] == 0x32)) {
          param_2 = puVar4 + 3;
          local_40c = local_40c & 0xffff7fff;
        }
        else if (((((uVar1 != 100) && (uVar1 != 0x69)) && (uVar1 != 0x6f)) &&
                 ((uVar1 != 0x75 && (uVar1 != 0x78)))) && (uVar1 != 0x58)) {
          local_444 = 0;
          goto switchD_101055b7_caseD_0;
        }
      }
      else if (uVar10 == 0x68) {
        local_40c = local_40c | 0x20;
      }
      else if (uVar10 == 0x6c) {
        local_40c = local_40c | 0x10;
      }
      else if (uVar10 == 0x77) {
        local_40c = local_40c | 0x800;
      }
      break;
    case 7:
      if (uVar10 < 0x68) {
        if (uVar10 < 0x65) {
          if (uVar10 < 0x59) {
            if (uVar10 != 0x58) {
              if (uVar10 == 0x43) {
                if ((local_40c & 0x830) == 0) {
                  local_40c = local_40c | 0x20;
                }
                goto LAB_10105881;
              }
              if ((uVar10 != 0x45) && (uVar10 != 0x47)) {
                if (uVar10 == 0x53) {
                  if ((local_40c & 0x830) == 0) {
                    local_40c = local_40c | 0x20;
                  }
                  goto LAB_101057df;
                }
                goto LAB_10105bfa;
              }
              local_448 = 1;
              uVar10 = uVar10 + 0x20;
              goto LAB_10105856;
            }
LAB_10105aa0:
            local_440 = 7;
LAB_10105aa3:
            local_414 = 0x10;
            if ((local_40c & 0x80) != 0) {
              local_42a = (short)local_440 + 0x51;
              local_42c = 0x30;
              local_420 = 2;
            }
            goto LAB_101058e3;
          }
          if (uVar10 == 0x5a) {
            param_3 = pwVar7 + 2;
            psVar3 = *(short **)pwVar7;
            pwVar7 = (wchar_t *)PTR_DAT_101a4890;
            pwVar5 = (wchar_t *)PTR_DAT_101a4890;
            if ((psVar3 == (short *)0x0) ||
               (local_418 = *(wchar_t **)(psVar3 + 2), pwVar5 = (wchar_t *)PTR_DAT_101a4890,
               local_418 == (wchar_t *)0x0)) goto LAB_10105a20;
            local_414 = (size_t)*psVar3;
            if ((local_40c & 0x800) == 0) {
              local_428 = 0;
            }
            else {
              local_414 = (int)local_414 / 2;
              local_428 = 1;
            }
          }
          else if (uVar10 == 99) {
LAB_10105881:
            wVar2 = *pwVar7;
            local_44c = (uint)(ushort)wVar2;
            local_428 = 1;
            if ((local_40c & 0x20) == 0) {
              local_408[0] = wVar2;
            }
            else {
              local_430 = (char)wVar2;
              local_42f = 0;
              iVar11 = _mbtowc(local_408,&local_430,DAT_101a50e0);
              if (iVar11 < 0) {
                local_438 = 1;
              }
            }
            local_414 = 1;
            param_3 = pwVar7 + 2;
            local_418 = local_408;
          }
          else if (uVar10 == 100) goto LAB_101058d8;
        }
        else {
LAB_10105856:
          local_40c = local_40c | 0x40;
          pwVar12 = local_408;
          pwVar5 = local_408;
          if ((int)local_410 < 0) {
            local_410 = 6;
          }
          else if (local_410 == 0) {
            if (uVar10 == 0x67) {
              local_410 = 1;
            }
          }
          else {
            if (0x200 < (int)local_410) {
              local_410 = 0x200;
            }
            if ((0xa3 < (int)local_410) &&
               (local_418 = local_408, local_434 = _malloc(local_410 + 0x15d), pwVar12 = local_434,
               pwVar5 = local_434, local_434 == (wchar_t *)0x0)) {
              local_410 = 0xa3;
              pwVar12 = local_408;
              pwVar5 = local_418;
            }
          }
          local_418 = pwVar5;
          local_45c = *(uint *)pwVar7;
          param_3 = pwVar7 + 4;
          local_458 = *(uint *)(pwVar7 + 2);
          (*(code *)PTR___fptrap_101a4fb0)(&local_45c,pwVar12,(int)(char)uVar10,local_410,local_448)
          ;
          uVar6 = local_40c & 0x80;
          if ((uVar6 != 0) && (local_410 == 0)) {
            (*(code *)PTR___fptrap_101a4fbc)(pwVar12);
          }
          if ((uVar10 == 0x67) && (uVar6 == 0)) {
            (*(code *)PTR___fptrap_101a4fb4)(pwVar12);
          }
          pwVar7 = pwVar12;
          pwVar5 = local_418;
          if ((byte)*pwVar12 == 0x2d) {
            local_40c = local_40c | 0x100;
            pwVar7 = (wchar_t *)((int)pwVar12 + 1);
            pwVar5 = (wchar_t *)((int)pwVar12 + 1);
          }
LAB_10105a20:
          local_418 = pwVar5;
          local_414 = _strlen((char *)pwVar7);
        }
LAB_10105bfa:
        if (local_438 == 0) {
          if ((local_40c & 0x40) != 0) {
            if ((local_40c & 0x100) == 0) {
              if ((local_40c & 1) == 0) {
                if ((local_40c & 2) == 0) goto LAB_10105c35;
                local_42c = 0x20;
              }
              else {
                local_42c = 0x2b;
              }
            }
            else {
              local_42c = 0x2d;
            }
            local_420 = 1;
          }
LAB_10105c35:
          iVar11 = (local_424 - local_420) - local_414;
          if ((local_40c & 0xc) == 0) {
            write_multi_char(0x20,iVar11,param_1);
          }
          write_string(local_420);
          if (((local_40c & 8) != 0) && ((local_40c & 4) == 0)) {
            write_multi_char(0x30,iVar11,param_1);
          }
          if ((local_428 == 0) && (0 < (int)local_414)) {
            local_43c = local_414;
            pwVar7 = local_418;
            do {
              local_43c = local_43c - 1;
              local_450 = _mbtowc((wchar_t *)&local_44c,(char *)pwVar7,DAT_101a50e0);
              if (local_450 < 1) break;
              write_char(local_44c);
              pwVar7 = (wchar_t *)((int)pwVar7 + local_450);
            } while (0 < (int)local_43c);
          }
          else {
            write_string(local_414);
          }
          if ((local_40c & 4) != 0) {
            write_multi_char(0x20,iVar11,param_1);
          }
        }
      }
      else {
        if (uVar10 == 0x69) {
LAB_101058d8:
          local_40c = local_40c | 0x40;
LAB_101058dc:
          local_414 = 10;
LAB_101058e3:
          if ((local_40c & 0x8000) == 0) {
            param_3 = pwVar7 + 2;
            if ((local_40c & 0x20) == 0) {
              uVar6 = *(uint *)pwVar7;
              if ((local_40c & 0x40) == 0) {
                uVar9 = 0;
                goto LAB_10105b44;
              }
            }
            else if ((local_40c & 0x40) == 0) {
              uVar6 = (uint)(ushort)*pwVar7;
            }
            else {
              uVar6 = (uint)*pwVar7;
            }
            uVar9 = (int)uVar6 >> 0x1f;
          }
          else {
            uVar6 = *(uint *)pwVar7;
            uVar9 = *(uint *)(pwVar7 + 2);
            param_3 = pwVar7 + 4;
          }
LAB_10105b44:
          if ((((local_40c & 0x40) != 0) && ((int)uVar9 < 1)) && ((int)uVar9 < 0)) {
            bVar13 = uVar6 != 0;
            uVar6 = -uVar6;
            uVar9 = -(uVar9 + bVar13);
            local_40c = local_40c | 0x100;
          }
          if ((local_40c & 0x8000) == 0) {
            uVar9 = 0;
          }
          lVar14 = CONCAT44(uVar9,uVar6);
          if ((int)local_410 < 0) {
            local_410 = 1;
          }
          else {
            local_40c = local_40c & 0xfffffff7;
            if (0x200 < (int)local_410) {
              local_410 = 0x200;
            }
          }
          if (uVar6 == 0 && uVar9 == 0) {
            local_420 = 0;
          }
          pwVar7 = &local_209;
          while( true ) {
            iVar11 = (int)lVar14;
            uVar6 = local_410 - 1;
            if (((int)local_410 < 1) && (lVar14 == 0)) break;
            local_410 = uVar6;
            lVar14 = __aulldvrm(lVar14,local_414,(int)local_414 >> 0x1f);
            iVar8 = extraout_ECX + 0x30;
            if (0x39 < iVar8) {
              iVar8 = iVar8 + local_440;
            }
            *(byte *)pwVar7 = (byte)iVar8;
            pwVar7 = (wchar_t *)((int)pwVar7 + -1);
            local_450 = iVar11;
          }
          local_414 = (int)&local_209 + -(int)pwVar7;
          local_418 = (wchar_t *)((int)pwVar7 + 1);
          local_410 = uVar6;
          if (((local_40c & 0x200) != 0) && ((*(byte *)local_418 != 0x30 || (local_414 == 0)))) {
            *(byte *)pwVar7 = 0x30;
            local_414 = (int)&local_209 + -(int)pwVar7 + 1;
            local_418 = pwVar7;
          }
          goto LAB_10105bfa;
        }
        if (uVar10 != 0x6e) {
          if (uVar10 == 0x6f) {
            local_414 = 8;
            if ((local_40c & 0x80) != 0) {
              local_40c = local_40c | 0x200;
            }
            goto LAB_101058e3;
          }
          if (uVar10 == 0x70) {
            local_410 = 8;
            goto LAB_10105aa0;
          }
          if (uVar10 == 0x73) {
LAB_101057df:
            uVar6 = local_410;
            if (local_410 == 0xffffffff) {
              uVar6 = 0x7fffffff;
            }
            param_3 = pwVar7 + 2;
            local_418 = *(wchar_t **)pwVar7;
            if ((local_40c & 0x20) == 0) {
              if (local_418 == (wchar_t *)0x0) {
                local_418 = (wchar_t *)PTR_DAT_101a4894;
              }
              local_428 = 1;
              for (pwVar7 = local_418; (uVar6 != 0 && (uVar6 = uVar6 - 1, *pwVar7 != L'\0'));
                  pwVar7 = pwVar7 + 1) {
              }
              local_414 = (int)pwVar7 - (int)local_418 >> 1;
            }
            else {
              if (local_418 == (wchar_t *)0x0) {
                local_418 = (wchar_t *)PTR_DAT_101a4890;
              }
              local_414 = 0;
              pwVar7 = local_418;
              if (0 < (int)uVar6) {
                do {
                  if ((byte)*pwVar7 == 0) break;
                  if ((PTR_DAT_101a5090[(uint)(byte)*pwVar7 * 2 + 1] & 0x80) != 0) {
                    pwVar7 = (wchar_t *)((int)pwVar7 + 1);
                  }
                  pwVar7 = (wchar_t *)((int)pwVar7 + 1);
                  local_414 = local_414 + 1;
                } while ((int)local_414 < (int)uVar6);
              }
            }
            goto LAB_10105bfa;
          }
          if (uVar10 != 0x75) {
            if (uVar10 != 0x78) goto LAB_10105bfa;
            local_440 = 0x27;
            goto LAB_10105aa3;
          }
          goto LAB_101058dc;
        }
        param_3 = pwVar7 + 2;
        if ((local_40c & 0x20) == 0) {
          **(int **)pwVar7 = local_41c;
        }
        else {
          *(undefined2 *)*(int **)pwVar7 = (undefined2)local_41c;
        }
        local_438 = 1;
      }
      if (local_434 != (wchar_t *)0x0) {
        _free(local_434);
        local_434 = (wchar_t *)0x0;
      }
    }
    uVar10 = *param_2;
    puVar4 = param_2;
    pwVar7 = param_3;
  } while( true );
}


