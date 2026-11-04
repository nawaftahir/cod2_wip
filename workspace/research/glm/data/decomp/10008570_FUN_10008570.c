// 10008570 size=139 FUN_10008570

void FUN_10008570(int param_1)

{
  int *piVar1;
  undefined4 *in_EAX;
  int iVar2;
  undefined4 *in_EDX;
  int unaff_EBX;
  
  if (DAT_101ce580 == 0x1000) {
    (*(code *)RI_Printf)(1,"^1Max xmodel refs (%i) exceeded\n",0x1000);
    return;
  }
  piVar1 = *(int **)(param_1 + 0x38);
  while( true ) {
    if (piVar1 == (int *)0x0) {
      iVar2 = DAT_101ce580 * 0x20;
      DAT_101ce580 = DAT_101ce580 + 1;
      *(int *)(&DAT_101ae580 + iVar2) = unaff_EBX;
      *(undefined4 *)(&DAT_101ae584 + iVar2) = *in_EDX;
      *(undefined4 *)(&DAT_101ae588 + iVar2) = in_EDX[1];
      *(undefined4 *)(&DAT_101ae58c + iVar2) = in_EDX[2];
      *(undefined4 *)(&DAT_101ae590 + iVar2) = *in_EAX;
      *(undefined4 *)(&DAT_101ae594 + iVar2) = in_EAX[1];
      *(undefined4 *)(&DAT_101ae598 + iVar2) = in_EAX[2];
      *(undefined4 *)(&DAT_101ae59c + iVar2) = *(undefined4 *)(param_1 + 0x38);
      *(undefined **)(param_1 + 0x38) = &DAT_101ae580 + iVar2;
      return;
    }
    if (*piVar1 == unaff_EBX) break;
    piVar1 = (int *)piVar1[7];
  }
  FUN_1005c800();
  return;
}


