// 1007d7ee size=65 FUN_1007d7ee

undefined4 FUN_1007d7ee(uint param_1)

{
  char *in_EAX;
  undefined4 uVar1;
  int unaff_EBX;
  int iVar2;
  uint uVar3;
  bool bVar4;
  
  uVar3 = 0;
  bVar4 = param_1 == 0;
  if (param_1 != 0) {
    iVar2 = unaff_EBX - (int)in_EAX;
    do {
      if (in_EAX[iVar2] < *in_EAX) {
        return 0xffffffff;
      }
      if (*in_EAX < in_EAX[iVar2]) goto LAB_1007d81d;
      uVar3 = uVar3 + 1;
      in_EAX = in_EAX + 1;
    } while (uVar3 < param_1);
    bVar4 = uVar3 == param_1;
  }
  if ((bVar4) && (*(char *)(uVar3 + unaff_EBX) != '\0')) {
LAB_1007d81d:
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


