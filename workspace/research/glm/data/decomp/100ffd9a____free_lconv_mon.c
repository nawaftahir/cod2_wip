// 100ffd9a size=217 ___free_lconv_mon

/* Library Function - Single Match
    ___free_lconv_mon
   
   Library: Visual Studio 2003 Release */

void ___free_lconv_mon(int param_1)

{
  undefined *puVar1;
  
  if (param_1 != 0) {
    puVar1 = *(undefined **)(param_1 + 0xc);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0xc)) && (puVar1 != PTR_DAT_101a50a8)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x10);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x10)) && (puVar1 != PTR_DAT_101a50ac)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x14);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x14)) && (puVar1 != PTR_DAT_101a50b0)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x18);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x18)) && (puVar1 != PTR_DAT_101a50b4)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x1c);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x1c)) && (puVar1 != PTR_DAT_101a50b8)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x20);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x20)) && (puVar1 != PTR_DAT_101a50bc)) {
      _free(puVar1);
    }
    puVar1 = *(undefined **)(param_1 + 0x24);
    if ((puVar1 != *(undefined **)(PTR_PTR_101a50cc + 0x24)) && (puVar1 != PTR_DAT_101a50c0)) {
      _free(puVar1);
    }
  }
  return;
}


