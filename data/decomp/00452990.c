
void FUN_00452990(void)

{
  char cVar1;
  undefined *puVar2;
  int unaff_ESI;
  undefined1 local_2c [4];
  undefined1 *local_28;
  
  if (DAT_0109fe5e == '\0') {
    return;
  }
  local_28 = local_2c;
  FUN_00449c90();
  cVar1 = DAT_0109fe5c;
  if (*(int *)(DAT_01233b64 + 0x2d8) == 0) {
    if (*(int *)(unaff_ESI + 0xf4) != 1) goto LAB_004529d0;
  }
  else if (*(int *)(unaff_ESI + 0xf4) == 1) goto LAB_004529d0;
  cVar1 = DAT_0109fe5c == '\0';
LAB_004529d0:
  puVar2 = &DAT_0109fe30;
  if (cVar1 == '\0') {
    puVar2 = &DAT_0109fe08;
  }
  if (*(undefined **)(puVar2 + 4) != puVar2) {
    FUN_00449ff0(puVar2);
    FUN_00449c60();
    FUN_00449c60();
    FUN_0046fb30();
    FUN_00449ff0(local_2c);
    FUN_0044abf0();
    DAT_0109fe5d = 0;
    DAT_0123348c = 0xffffffff;
  }
  return;
}

