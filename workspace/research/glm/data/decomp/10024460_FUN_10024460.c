// 10024460 size=70 FUN_10024460

void FUN_10024460(void)

{
  uint uVar1;
  uint uVar2;
  uint *puVar3;
  uint *puVar4;
  uint *in_EAX;
  uint *unaff_EDI;
  
  for (; puVar3 = unaff_EDI, puVar4 = unaff_EDI, unaff_EDI < in_EAX; in_EAX = in_EAX + -2) {
    while (puVar4 = puVar4 + 2, puVar4 <= in_EAX) {
      if (*puVar3 < *puVar4) {
        puVar3 = puVar4;
      }
    }
    uVar1 = *puVar3;
    uVar2 = puVar3[1];
    *puVar3 = *in_EAX;
    puVar3[1] = in_EAX[1];
    *in_EAX = uVar1;
    in_EAX[1] = uVar2;
  }
  return;
}


