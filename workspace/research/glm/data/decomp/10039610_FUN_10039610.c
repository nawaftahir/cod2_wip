// 10039610 size=95 FUN_10039610

uint FUN_10039610(void)

{
  uint uVar1;
  uint uVar2;
  uint *in_EAX;
  uint uVar3;
  uint *in_ECX;
  int iVar4;
  uint *unaff_EBX;
  
  uVar3 = *in_EAX;
  iVar4 = 0;
  if (0 < (int)uVar3) {
    in_EAX = in_EAX + 2;
    do {
      if (((*unaff_EBX & in_EAX[-1]) == in_EAX[1]) && ((unaff_EBX[1] & *in_EAX) == in_EAX[2])) {
        uVar3 = in_EAX[5];
        uVar1 = *in_ECX;
        uVar2 = in_ECX[1];
        *in_ECX = uVar1 & uVar3;
        *in_ECX = in_EAX[3] | uVar1 & uVar3;
        uVar3 = in_EAX[6];
        in_ECX[1] = uVar2 & uVar3;
        uVar3 = in_EAX[4] | uVar2 & uVar3;
        in_ECX[1] = uVar3;
        return CONCAT31((int3)(uVar3 >> 8),1);
      }
      iVar4 = iVar4 + 1;
      in_EAX = in_EAX + 8;
    } while (iVar4 < (int)uVar3);
  }
  return (uint)in_EAX & 0xffffff00;
}


