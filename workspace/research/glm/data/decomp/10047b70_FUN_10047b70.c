// 10047b70 size=183 FUN_10047b70

void FUN_10047b70(void)

{
  int *piVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  char *pcVar4;
  
  if (*(int *)(in_EAX + 0x38) != 0) {
    iVar2 = *(int *)(in_EAX + 0x38) >> 1;
    iVar3 = 0;
    if (iVar2 != 0) {
      do {
        iVar2 = iVar2 >> 1;
        iVar3 = iVar3 + 1;
      } while (iVar2 != 0);
      if (0xe < iVar3) {
        *(undefined4 *)(**(int **)(in_EAX + 0x20) + 0x14) = 0x28;
        (**(code **)**(undefined4 **)(in_EAX + 0x20))(*(undefined4 **)(in_EAX + 0x20));
      }
    }
    if (*(char *)(in_EAX + 0xc) == '\0') {
      FUN_100479a0(*(undefined4 *)
                    (*(int *)(in_EAX + 0x4c + *(int *)(in_EAX + 0x34) * 4) + iVar3 * 0x40));
    }
    else {
      piVar1 = (int *)(*(int *)(in_EAX + 0x5c + *(int *)(in_EAX + 0x34) * 4) + iVar3 * 0x40);
      *piVar1 = *piVar1 + 1;
    }
    if (iVar3 != 0) {
      FUN_100479a0(*(undefined4 *)(in_EAX + 0x38));
    }
    iVar2 = *(int *)(in_EAX + 0x3c);
    pcVar4 = *(char **)(in_EAX + 0x40);
    *(undefined4 *)(in_EAX + 0x38) = 0;
    if (*(char *)(in_EAX + 0xc) == '\0') {
      for (; iVar2 != 0; iVar2 = iVar2 + -1) {
        FUN_100479a0((int)*pcVar4);
        pcVar4 = pcVar4 + 1;
      }
    }
    *(undefined4 *)(in_EAX + 0x3c) = 0;
  }
  return;
}


