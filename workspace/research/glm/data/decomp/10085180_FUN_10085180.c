// 10085180 size=82 FUN_10085180

void FUN_10085180(undefined4 *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *in_ECX;
  int iVar1;
  undefined4 *puVar2;
  
  FUN_100827bb(0x12);
  *in_ECX = &PTR_FUN_101103e0;
  puVar2 = in_ECX + 4;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_1;
    param_1 = param_1 + 1;
    puVar2 = puVar2 + 1;
  }
  in_ECX[0xc] = param_2;
  in_ECX[0xd] = param_3;
  in_ECX[0xe] = param_4;
  in_ECX[0xf] = 0;
  in_ECX[0x10] = 0;
  in_ECX[0x15] = 0;
  in_ECX[0x16] = 0;
  in_ECX[0x11] = 0;
  in_ECX[0x12] = 0;
  in_ECX[0x13] = 0;
  in_ECX[0x14] = 0;
  return;
}


