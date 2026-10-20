
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047a330(void)

{
  int iVar1;
  undefined4 *puVar2;
  char local_6c;
  undefined4 local_6b;
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  local_6c = '\0';
  puVar2 = &local_6b;
  for (iVar1 = 0x18; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  *(undefined2 *)puVar2 = 0;
  *(undefined1 *)((int)puVar2 + 2) = 0;
  _sprintf(&local_6c,"Brushes: %d Entities: %d",DAT_010bcd24,DAT_010bcd20);
  FUN_00402a70(&local_6c);
  FUN_00417cf0();
  return;
}

