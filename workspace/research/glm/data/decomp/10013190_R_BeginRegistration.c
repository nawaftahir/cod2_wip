// 10013190 size=26 R_BeginRegistration

void R_BeginRegistration(undefined4 *param_1)

{
  int iVar1;
  undefined4 *puVar2;
  
  FUN_10012f80();
  puVar2 = &DAT_101d4c6c;
  for (iVar1 = 0xb; iVar1 != 0; iVar1 = iVar1 + -1) {
    *param_1 = *puVar2;
    puVar2 = puVar2 + 1;
    param_1 = param_1 + 1;
  }
  return;
}


