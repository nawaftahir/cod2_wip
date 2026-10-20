
void __thiscall FUN_00464b50(int *param_1,undefined1 param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = *param_1;
  iVar3 = *(int *)(iVar2 + -0xc);
  iVar1 = iVar3 + 1;
  if ((int)(1U - *(int *)(iVar2 + -4) | *(int *)(iVar2 + -8) - iVar1) < 0) {
    FUN_00402d30(iVar1);
  }
  *(undefined1 *)(iVar3 + *param_1) = param_2;
  if ((-1 < iVar1) && (iVar1 <= *(int *)(*param_1 + -8))) {
    *(int *)(*param_1 + -0xc) = iVar1;
    *(undefined1 *)(iVar1 + *param_1) = 0;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

