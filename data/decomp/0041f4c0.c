
void __thiscall FUN_0041f4c0(int *param_1,int param_2)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  
  if (param_2 == -1) {
    pcVar3 = (char *)*param_1;
    param_2 = 0;
    if (pcVar3 != (char *)0x0) {
      pcVar1 = pcVar3 + 1;
      do {
        cVar2 = *pcVar3;
        pcVar3 = pcVar3 + 1;
      } while (cVar2 != '\0');
      param_2 = (int)pcVar3 - (int)pcVar1;
      goto LAB_0041f4de;
    }
  }
  else {
LAB_0041f4de:
    if (param_2 < 0) goto LAB_0041f4f7;
  }
  if (param_2 <= *(int *)(*param_1 + -8)) {
    *(int *)(*param_1 + -0xc) = param_2;
    *(undefined1 *)(param_2 + *param_1) = 0;
    return;
  }
LAB_0041f4f7:
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

