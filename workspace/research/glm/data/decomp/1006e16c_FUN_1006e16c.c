// 1006e16c size=131 FUN_1006e16c

int FUN_1006e16c(int param_1,double *param_2)

{
  byte *pbVar1;
  int iVar2;
  int in_ECX;
  double local_14;
  double local_c;
  
  pbVar1 = *(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + param_1 * 4);
  if ((*pbVar1 & 0x80) == 0) {
    iVar2 = FUN_1006c8ca(param_1,&local_14);
    if (iVar2 < 0) {
      return iVar2;
    }
    if (local_14 != local_c) {
      return -0x7fffbffb;
    }
    iVar2 = FUN_100f8c58(local_14);
    if (iVar2 == 0) {
      return -0x7fffbffb;
    }
    if (param_2 == (double *)0x0) {
      return 0;
    }
  }
  else {
    iVar2 = FUN_100f8c58(*(undefined8 *)(pbVar1 + 0x20));
    if (iVar2 == 0) {
      return -0x7fffbffb;
    }
    if (param_2 == (double *)0x0) {
      return 0;
    }
    local_14 = *(double *)(pbVar1 + 0x20);
  }
  *param_2 = local_14;
  return 0;
}


