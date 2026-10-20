
void FUN_0048d9b0(undefined4 *param_1)

{
  undefined4 *puVar1;
  int in_EAX;
  
  switch(*(undefined1 *)(in_EAX + 6)) {
  case 2:
    puVar1 = *(undefined4 **)(in_EAX + 0xc);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    return;
  case 3:
    puVar1 = *(undefined4 **)(in_EAX + 0xc);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    return;
  case 4:
    puVar1 = *(undefined4 **)(in_EAX + 0xc);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    puVar1[3] = param_1[3];
    return;
  default:
    *(undefined4 **)(in_EAX + 0xc) = param_1;
    return;
  case 7:
    FUN_0048bb00();
    FUN_0048bc40();
    return;
  }
}

