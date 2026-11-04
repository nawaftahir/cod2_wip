// 10041a00 size=114 FUN_10041a00

void FUN_10041a00(undefined4 param_1,int param_2)

{
  int iVar1;
  code *pcVar2;
  int *unaff_ESI;
  
  if ((unaff_ESI[0x36] != 0) ||
     (((iVar1 = unaff_ESI[5], iVar1 != 0x65 && (iVar1 != 0x66)) && (iVar1 != 0x67)))) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  (**(code **)(unaff_ESI[0x55] + 0x14))();
  pcVar2 = *(code **)(unaff_ESI[0x55] + 0x18);
  for (; param_2 != 0; param_2 = param_2 + -1) {
    (*pcVar2)();
  }
  return;
}


