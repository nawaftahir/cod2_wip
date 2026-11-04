// 10108afe size=214 __putwc_lk

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __putwc_lk
   
   Library: Visual Studio 2003 Release */

uint __putwc_lk(uint param_1,FILE *param_2)

{
  int *piVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 *puVar4;
  uint uVar5;
  int iVar6;
  char local_10 [8];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  if ((param_2->_flag & 0x40) == 0) {
    uVar5 = param_2->_file;
    if (uVar5 == 0xffffffff) {
      puVar2 = &DAT_101a4e60;
    }
    else {
      puVar2 = (undefined *)((&DAT_1076aca0)[(int)uVar5 >> 5] + (uVar5 & 0x1f) * 0x24);
    }
    if ((puVar2[4] & 0x80) != 0) {
      iVar3 = _wctomb(local_10,(wchar_t)param_1);
      if (iVar3 == -1) {
        puVar4 = (undefined4 *)FUN_100fc216();
        *puVar4 = 0x2a;
        return 0xffff;
      }
      iVar6 = 0;
      if (0 < iVar3) {
        do {
          piVar1 = &param_2->_cnt;
          *piVar1 = *piVar1 + -1;
          if (*piVar1 < 0) {
            uVar5 = __flsbuf((int)local_10[iVar6],param_2);
          }
          else {
            *param_2->_ptr = local_10[iVar6];
            uVar5 = (uint)(byte)*param_2->_ptr;
            param_2->_ptr = param_2->_ptr + 1;
          }
          if (uVar5 == 0xffffffff) {
            return 0xffff;
          }
          iVar6 = iVar6 + 1;
        } while (iVar6 < iVar3);
      }
      return param_1 & 0xffff;
    }
  }
  piVar1 = &param_2->_cnt;
  *piVar1 = *piVar1 + -2;
  if (*piVar1 < 0) {
    param_1 = __flswbuf(param_1 & 0xffff,param_2);
  }
  else {
    *(wchar_t *)param_2->_ptr = (wchar_t)param_1;
    param_2->_ptr = param_2->_ptr + 2;
  }
  return param_1;
}


