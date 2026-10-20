
undefined4 * __fastcall FUN_004bb130(undefined4 *param_1)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  
  iVar1 = FUN_004ff450(4);
  if (iVar1 == 0) {
    uVar2 = 0;
  }
  else {
    uVar2 = FUN_004bc5a0();
  }
  param_1[1] = uVar2;
  puVar3 = (undefined4 *)FUN_004ff450(0x10);
  if (puVar3 == (undefined4 *)0x0) {
    puVar3 = (undefined4 *)0x0;
  }
  else {
    puVar3[2] = 0;
    puVar3[1] = 0;
    *puVar3 = &DAT_00598c80;
    puVar3[3] = 0;
  }
  param_1[3] = puVar3;
  param_1[2] = 0;
  *param_1 = 2;
  FUN_004bc5f0(&PTR_s_compress1_00529a48);
  return param_1;
}

