
void __fastcall FUN_004941f0(int param_1,int param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  double *pdVar3;
  double *unaff_ESI;
  double local_1c [3];
  
  iVar2 = 0;
  pdVar3 = (double *)(param_1 + 0x10);
  do {
    iVar1 = iVar2 * 8;
    iVar2 = iVar2 + 1;
    *(double *)(&stack0xffffffdc + iVar2 * 8) =
         *pdVar3 * unaff_ESI[2] +
         pdVar3[-1] * unaff_ESI[1] + (pdVar3[-2] * *unaff_ESI - *(double *)(param_2 + iVar1));
    pdVar3 = pdVar3 + 3;
  } while (iVar2 < 3);
  FUN_00494000(param_3,local_1c);
  *unaff_ESI = *unaff_ESI - local_1c[0];
  unaff_ESI[1] = unaff_ESI[1] - local_1c[1];
  unaff_ESI[2] = unaff_ESI[2] - local_1c[2];
  return;
}

