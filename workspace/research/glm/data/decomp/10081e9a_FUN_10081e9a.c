// 10081e9a size=64 FUN_10081e9a

void FUN_10081e9a(void)

{
  int *piVar1;
  undefined4 *in_ECX;
  
  piVar1 = (int *)in_ECX[2];
  *in_ECX = &PTR_FUN_1010ff58;
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    in_ECX[2] = 0;
  }
  piVar1 = (int *)in_ECX[3];
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    in_ECX[3] = 0;
  }
  piVar1 = (int *)in_ECX[4];
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    in_ECX[4] = 0;
  }
  return;
}


