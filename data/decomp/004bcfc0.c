
void FUN_004bcfc0(int param_1,byte param_2,int param_3)

{
  undefined2 uVar1;
  int *piVar2;
  
  piVar2 = (int *)0x0;
  if ((param_2 & 1) != 0) {
    piVar2 = (int *)Ordinal_51(param_1 + 4,4,2);
  }
  *(undefined4 *)(param_3 + 4) = 0;
  if ((piVar2 == (int *)0x0) || (*piVar2 == 0)) {
    FUN_004bf340(*(undefined1 *)(param_1 + 4));
    FUN_004bf280(&DAT_00553f10);
    FUN_004bf340(*(undefined1 *)(param_1 + 5));
    FUN_004bf280(&DAT_00553f10);
    FUN_004bf340(*(undefined1 *)(param_1 + 6));
    FUN_004bf280(&DAT_00553f10);
    FUN_004bf340(*(undefined1 *)(param_1 + 7));
  }
  else {
    FUN_004bf280(*piVar2);
  }
  if ((param_2 & 2) != 0) {
    FUN_004bf280(&DAT_0054c264);
    uVar1 = Ordinal_15(*(undefined2 *)(param_1 + 2));
    FUN_004bf340(uVar1);
  }
  return;
}

