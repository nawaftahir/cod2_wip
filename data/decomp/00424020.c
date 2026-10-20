
int * __thiscall FUN_00424020(int *param_1,undefined4 *param_2,uint param_3,undefined4 *param_4)

{
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  
  if ((param_2 != (undefined4 *)0x0) || (param_3 == 0)) {
    iVar1 = (**(code **)*param_4)(param_3,1);
    if (iVar1 == 0) {
      iVar1 = FUN_00402e20();
    }
    *param_1 = iVar1 + 0x10;
    if ((-1 < (int)param_3) && ((int)param_3 <= *(int *)(iVar1 + 8))) {
      *(uint *)(iVar1 + 4) = param_3;
      *(undefined1 *)(param_3 + *param_1) = 0;
      puVar3 = (undefined4 *)*param_1;
      for (uVar2 = param_3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *puVar3 = *param_2;
        param_2 = param_2 + 1;
        puVar3 = puVar3 + 1;
      }
      for (param_3 = param_3 & 3; param_3 != 0; param_3 = param_3 - 1) {
        *(undefined1 *)puVar3 = *(undefined1 *)param_2;
        param_2 = (undefined4 *)((int)param_2 + 1);
        puVar3 = (undefined4 *)((int)puVar3 + 1);
      }
      return param_1;
    }
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

