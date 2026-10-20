
void __thiscall FUN_00402b30(int *param_1,undefined4 *param_2,uint param_3)

{
  int iVar1;
  uint uVar2;
  undefined4 *_Dst;
  
  if (param_3 == 0) {
    FUN_00402be0();
    return;
  }
  if (param_2 != (undefined4 *)0x0) {
    iVar1 = *param_1;
    uVar2 = *(uint *)(iVar1 + -0xc);
    if ((int)(1U - *(int *)(iVar1 + -4) | *(int *)(iVar1 + -8) - param_3) < 0) {
      FUN_00402d30(param_3);
    }
    _Dst = (undefined4 *)*param_1;
    if (uVar2 < (uint)((int)param_2 - iVar1)) {
      for (uVar2 = param_3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *_Dst = *param_2;
        param_2 = param_2 + 1;
        _Dst = _Dst + 1;
      }
      for (uVar2 = param_3 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(undefined1 *)_Dst = *(undefined1 *)param_2;
        param_2 = (undefined4 *)((int)param_2 + 1);
        _Dst = (undefined4 *)((int)_Dst + 1);
      }
    }
    else {
      _memmove(_Dst,(undefined1 *)((int)_Dst + ((int)param_2 - iVar1)),param_3);
    }
    if ((-1 < (int)param_3) && ((int)param_3 <= *(int *)(*param_1 + -8))) {
      *(uint *)(*param_1 + -0xc) = param_3;
      *(undefined1 *)(param_3 + *param_1) = 0;
      return;
    }
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

