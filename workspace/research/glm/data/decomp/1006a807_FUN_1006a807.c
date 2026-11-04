// 1006a807 size=143 FUN_1006a807

void FUN_1006a807(int param_1)

{
  undefined4 *in_ECX;
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  
  iVar2 = 7;
  puVar3 = in_ECX;
  for (iVar1 = iVar2; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = in_ECX + 7;
  for (iVar1 = iVar2; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = in_ECX + 0xe;
  for (iVar1 = iVar2; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = in_ECX + 0x15;
  for (iVar1 = iVar2; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = in_ECX + 0x1c;
  for (; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  in_ECX[0x23] = 0;
  in_ECX[0x24] = 0;
  in_ECX[0x25] = 0;
  in_ECX[0x26] = 0;
  in_ECX[0x2b] = 0;
  in_ECX[0x27] = 0;
  in_ECX[0x28] = 0;
  in_ECX[0x29] = 0;
  in_ECX[0x2a] = 0;
  in_ECX[0x2d] = param_1;
  in_ECX[0x2c] = 0;
  if ((3 < param_1) && (param_1 < 6)) {
    in_ECX[0x2c] = 1;
  }
  return;
}


