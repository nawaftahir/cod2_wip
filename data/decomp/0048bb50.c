
void FUN_0048bb50(void)

{
  char cVar1;
  char *_Memory;
  int unaff_ESI;
  
  _Memory = *(char **)(unaff_ESI + 0x10);
  if ((_Memory != *(char **)(unaff_ESI + 8)) && (_Memory != *(char **)(unaff_ESI + 0xc))) {
    cVar1 = *_Memory;
    if (((cVar1 != '\0') && (((_Memory[1] != '\0' || (cVar1 < '0')) || ('9' < cVar1)))) &&
       ((_Memory != PTR_PTR_00592734 && (_Memory != PTR_DAT_00592738)))) {
      _free(_Memory);
    }
    *(undefined4 *)(unaff_ESI + 0x10) = 0;
    return;
  }
  *(undefined4 *)(unaff_ESI + 0x10) = 0;
  return;
}

