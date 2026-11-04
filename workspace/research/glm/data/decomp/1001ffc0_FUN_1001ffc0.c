// 1001ffc0 size=484 FUN_1001ffc0

void FUN_1001ffc0(int param_1)

{
  LONG *Destination;
  int *in_EAX;
  LONG LVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  uint auStack_33c [4];
  undefined1 auStack_32c [44];
  undefined1 auStack_300 [256];
  undefined1 auStack_200 [512];
  
  Destination = (LONG *)(param_1 + 0xc);
  if (1 < *Destination) {
    return;
  }
  LVar1 = InterlockedCompareExchange(Destination,1,0);
  uVar3 = DAT_101d7e10;
  if (LVar1 == 0) {
    if (*in_EAX == 0) {
      uVar3 = *(undefined4 *)(param_1 + 4);
    }
    else {
      (*(code *)RI_DObjGetModel)(DAT_101d7e10,*(undefined4 *)(param_1 + 4));
    }
    iVar2 = (*(code *)RI_XModelGetBasePoseBone)(uVar3);
    if (iVar2 == 0) {
      iVar2 = FUN_1001d9f0(auStack_300,auStack_33c,auStack_32c);
      if (iVar2 != 0) {
        if (*(int *)(param_1 + 8) != 0) {
          (*(code *)RI_DObjCreateSkel)(*(int *)(param_1 + 8),uVar3,auStack_33c);
        }
        iVar2 = (*(code *)RI_RI_unk120)(uVar3);
        if (iVar2 != 0) {
          (*(code *)RI_DObjGetPartBits)(uVar3,auStack_200);
          iVar2 = (*(code *)RI_DObjGetSurfaces)(uVar3);
          iVar4 = 0;
          if (0 < iVar2) {
            do {
              if ((auStack_33c[iVar4 >> 5] & 1 << ((byte)iVar4 & 0x1f)) != 0) {
                FUN_1001d660();
                FUN_1001fdd0();
              }
              iVar4 = iVar4 + 1;
            } while (iVar4 < iVar2);
          }
          FUN_1005c8c0();
          *Destination = 2;
          return;
        }
        FUN_1001fda0();
        *Destination = 2;
        return;
      }
    }
    else if (*(int *)(DAT_101ce7d8 + 8) != 0) {
      FUN_1001da80(param_1);
      FUN_1001de60(param_1);
    }
    *(int *)(param_1 + 0x14) = in_EAX[0xf];
    *(int *)(param_1 + 0x18) = in_EAX[0x10];
    *(int *)(param_1 + 0x1c) = in_EAX[0x11];
    *(int *)(param_1 + 0x20) = in_EAX[0xf];
    *(int *)(param_1 + 0x24) = in_EAX[0x10];
    *(int *)(param_1 + 0x28) = in_EAX[0x11];
    *Destination = 2;
    return;
  }
  do {
  } while (*Destination < 2);
  return;
}


