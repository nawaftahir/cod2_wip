// 10047c30 size=259 FUN_10047c30

void FUN_10047c30(char param_1)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  undefined4 *puVar3;
  
  FUN_10047b70();
  if (*(char *)(in_EAX + 0xc) == '\0') {
    FUN_100479a0(0x7f);
    *(undefined4 *)(in_EAX + 0x18) = 0;
    *(undefined4 *)(in_EAX + 0x1c) = 0;
    **(undefined1 **)(in_EAX + 0x10) = 0xff;
    iVar2 = *(int *)(in_EAX + 0x14) + -1;
    *(int *)(in_EAX + 0x10) = *(int *)(in_EAX + 0x10) + 1;
    *(int *)(in_EAX + 0x14) = iVar2;
    if (iVar2 == 0) {
      puVar3 = *(undefined4 **)(*(int *)(in_EAX + 0x20) + 0x20);
      cVar1 = (*(code *)puVar3[3])(*(int *)(in_EAX + 0x20));
      if (cVar1 == '\0') {
        *(undefined4 *)(**(int **)(in_EAX + 0x20) + 0x14) = 0x18;
        (**(code **)**(undefined4 **)(in_EAX + 0x20))(*(undefined4 **)(in_EAX + 0x20));
      }
      *(undefined4 *)(in_EAX + 0x10) = *puVar3;
      *(undefined4 *)(in_EAX + 0x14) = puVar3[1];
    }
    **(char **)(in_EAX + 0x10) = param_1 + -0x30;
    iVar2 = *(int *)(in_EAX + 0x14) + -1;
    *(int *)(in_EAX + 0x10) = *(int *)(in_EAX + 0x10) + 1;
    *(int *)(in_EAX + 0x14) = iVar2;
    if (iVar2 == 0) {
      puVar3 = *(undefined4 **)(*(int *)(in_EAX + 0x20) + 0x20);
      cVar1 = (*(code *)puVar3[3])(*(int *)(in_EAX + 0x20));
      if (cVar1 == '\0') {
        *(undefined4 *)(**(int **)(in_EAX + 0x20) + 0x14) = 0x18;
        (**(code **)**(undefined4 **)(in_EAX + 0x20))(*(undefined4 **)(in_EAX + 0x20));
      }
      *(undefined4 *)(in_EAX + 0x10) = *puVar3;
      *(undefined4 *)(in_EAX + 0x14) = puVar3[1];
    }
  }
  if (*(int *)(*(int *)(in_EAX + 0x20) + 0x134) == 0) {
    iVar2 = 0;
    if (0 < *(int *)(*(int *)(in_EAX + 0x20) + 0xec)) {
      puVar3 = (undefined4 *)(in_EAX + 0x24);
      do {
        *puVar3 = 0;
        iVar2 = iVar2 + 1;
        puVar3 = puVar3 + 1;
      } while (iVar2 < *(int *)(*(int *)(in_EAX + 0x20) + 0xec));
      return;
    }
  }
  else {
    *(undefined4 *)(in_EAX + 0x38) = 0;
    *(undefined4 *)(in_EAX + 0x3c) = 0;
  }
  return;
}


