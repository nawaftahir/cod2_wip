// 1001f520 size=135 FUN_1001f520

void FUN_1001f520(undefined4 *param_1)

{
  int *piVar1;
  undefined4 *puVar2;
  int *piVar3;
  undefined1 auStack_50 [80];
  
  puVar2 = param_1;
  FUN_1001d720();
  piVar1 = param_1 + 1;
  piVar3 = (int *)*param_1;
  param_1 = (undefined4 *)0x0;
  if (0 < *piVar1) {
    do {
      if (*piVar3 == 5) {
LAB_1001f58c:
        piVar3 = piVar3 + 4;
      }
      else {
        if (*piVar3 != 4) {
          FUN_1001f030();
          goto LAB_1001f58c;
        }
        FUN_1001ee70(auStack_50 + *(short *)(piVar3[1] + 6),*(undefined4 *)(puVar2[2] + 0x38));
        piVar3 = piVar3 + 0xe;
      }
      param_1 = (undefined4 *)((int)param_1 + 1);
    } while ((int)param_1 < (int)puVar2[1]);
  }
  return;
}


