// 10001940 size=118 FUN_10001940

int FUN_10001940(void)

{
  int *piVar1;
  int iVar2;
  int *in_EAX;
  int in_EDX;
  int unaff_EBX;
  
  piVar1 = (int *)(*in_EAX + 8 + in_EDX * 8);
  if (in_EAX[2] < *piVar1 + piVar1[1]) {
    FUN_100138c0(1,&DAT_10191ac4,DAT_101ae288);
  }
  if (piVar1[1] < 4) {
    FUN_100138c0(1,&DAT_10191aa0,DAT_101ae288);
  }
  iVar2 = *piVar1;
  if ((iVar2 < 0) || ((iVar2 / unaff_EBX) * unaff_EBX - iVar2 != 0)) {
    FUN_100138c0(1,&DAT_10191a80,DAT_101ae288);
  }
  return iVar2 / unaff_EBX;
}


