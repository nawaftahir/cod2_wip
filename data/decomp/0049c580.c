
void FUN_0049c580(undefined4 param_1)

{
  int in_EAX;
  int *piVar1;
  
  piVar1 = (int *)(in_EAX + 0x2c);
  if (*(int *)(in_EAX + 0x38) == 0) {
    FUN_0049f580();
  }
  if (*piVar1 == *(int *)(in_EAX + 0x30)) {
    FUN_0049f580();
  }
  *(undefined4 *)(*(int *)(in_EAX + 0x38) + *piVar1 * 4) = param_1;
  *piVar1 = *piVar1 + 1;
  return;
}

