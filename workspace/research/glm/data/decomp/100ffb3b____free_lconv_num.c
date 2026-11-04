// 100ffb3b size=95 ___free_lconv_num

/* Library Function - Single Match
    ___free_lconv_num
   
   Library: Visual Studio 2003 Release */

void ___free_lconv_num(undefined4 *param_1)

{
  undefined *puVar1;
  
  if (param_1 != (undefined4 *)0x0) {
    puVar1 = (undefined *)*param_1;
    if ((puVar1 != *(undefined **)PTR_PTR_101a50cc) && (puVar1 != PTR_DAT_101a509c)) {
      _free(puVar1);
    }
    puVar1 = (undefined *)param_1[1];
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 4)) && (puVar1 != PTR_DAT_101a50a0)) {
      _free(puVar1);
    }
    puVar1 = (undefined *)param_1[2];
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 8)) && (puVar1 != PTR_DAT_101a50a4)) {
      _free(puVar1);
    }
  }
  return;
}


