
void __thiscall FUN_004075e0(int *param_1,char *param_2,va_list param_3)

{
  int iVar1;
  
  if (param_2 != (char *)0x0) {
    iVar1 = __vscprintf(param_2,param_3);
    if ((int)(1U - *(int *)(*param_1 + -4) | *(int *)(*param_1 + -8) - iVar1) < 0) {
      FUN_00402d30(iVar1);
    }
    _vsprintf((char *)*param_1,param_2,param_3);
    if ((-1 < iVar1) && (iVar1 <= *(int *)(*param_1 + -8))) {
      *(int *)(*param_1 + -0xc) = iVar1;
      *(undefined1 *)(iVar1 + *param_1) = 0;
      return;
    }
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

