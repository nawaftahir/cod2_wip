// 10045ac0 size=70 FUN_10045ac0

void FUN_10045ac0(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x154);
  FUN_10044e40(0xd8);
  *(undefined4 *)(iVar1 + 0x1c) = 0;
  if (*(char *)(param_1 + 0xcc) != '\0') {
    FUN_100456b0();
  }
  if (*(char *)(param_1 + 0xd4) != '\0') {
    FUN_100458d0();
    return;
  }
  return;
}


