// 1000a840 size=129 FUN_1000a840

void FUN_1000a840(int param_1)

{
  undefined1 uVar1;
  float *pfVar2;
  int iVar3;
  int unaff_EBX;
  float *pfVar4;
  int iVar5;
  
  iVar5 = 0;
  if (0 < DAT_10678514) {
    pfVar4 = (float *)&DAT_10678520;
    do {
      iVar3 = 0;
      if (0 < unaff_EBX) {
        pfVar2 = (float *)(param_1 + 4);
        do {
          if (*pfVar4 * *pfVar2 + pfVar2[1] * pfVar4[1] + pfVar2[-1] * pfVar4[-1] + pfVar2[2] <
              -pfVar4[2]) {
            uVar1 = 1;
            goto LAB_1000a89c;
          }
          iVar3 = iVar3 + 1;
          pfVar2 = pfVar2 + 5;
        } while (iVar3 < unaff_EBX);
      }
      uVar1 = 0;
LAB_1000a89c:
      (&DAT_10678a98)[iVar5] = uVar1;
      iVar5 = iVar5 + 1;
      pfVar4 = pfVar4 + 0xb;
    } while (iVar5 < DAT_10678514);
  }
  return;
}


