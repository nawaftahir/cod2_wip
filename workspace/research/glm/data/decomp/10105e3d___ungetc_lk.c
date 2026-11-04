// 10105e3d size=108 __ungetc_lk

/* Library Function - Single Match
    __ungetc_lk
   
   Library: Visual Studio 2003 Release */

uint __ungetc_lk(uint param_1,FILE *param_2)

{
  uint uVar1;
  char *pcVar2;
  
  if (param_1 != 0xffffffff) {
    uVar1 = param_2->_flag;
    if (((uVar1 & 1) != 0) || (((char)uVar1 < '\0' && ((uVar1 & 2) == 0)))) {
      if (param_2->_base == (char *)0x0) {
        __getbuf(param_2);
      }
      if (param_2->_ptr == param_2->_base) {
        if (param_2->_cnt != 0) {
          return 0xffffffff;
        }
        param_2->_ptr = param_2->_ptr + 1;
      }
      param_2->_ptr = param_2->_ptr + -1;
      pcVar2 = param_2->_ptr;
      if ((param_2->_flag & 0x40) == 0) {
        *pcVar2 = (char)param_1;
      }
      else if (*pcVar2 != (char)param_1) {
        param_2->_ptr = pcVar2 + 1;
        return 0xffffffff;
      }
      param_2->_cnt = param_2->_cnt + 1;
      param_2->_flag = param_2->_flag & 0xffffffefU | 1;
      return param_1 & 0xff;
    }
  }
  return 0xffffffff;
}


