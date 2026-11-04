
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0046ca50(void)

{
  int iVar1;
  undefined *puVar2;
  int iVar3;
  undefined1 local_552c [4];
  undefined1 local_5528 [21792];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  (*DAT_0059c468)(&DAT_0053dc64,local_552c);
  iVar3 = 1;
  iVar1 = 0;
  if (1 < DAT_010a4910) {
    puVar2 = &DAT_010a4924;
    do {
      iVar1 = FUN_0040be50(puVar2 + -0xc,puVar2,local_552c,4,iVar1,0x552);
      iVar3 = iVar3 + 1;
      puVar2 = puVar2 + 0xc;
    } while (iVar3 < DAT_010a4910);
    if (iVar1 != 0) {
      (*DAT_0059c460)(iVar1 / 2,4,local_5528);
    }
  }
  return;
}

