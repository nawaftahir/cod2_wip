
void FUN_0041ed40(void)

{
  int in_EAX;
  undefined4 *puVar1;
  int iVar2;
  
  iVar2 = 0;
  if (0 < *(int *)(in_EAX + 0x14)) {
    do {
      puVar1 = (undefined4 *)FUN_0041e950();
      _free((void *)*puVar1);
      iVar2 = iVar2 + 1;
    } while (iVar2 < *(int *)(in_EAX + 0x14));
  }
  if (*(void **)(in_EAX + 0x20) != (void *)0x0) {
    _free(*(void **)(in_EAX + 0x20));
  }
  *(undefined4 *)(in_EAX + 0x20) = 0;
  *(int *)(in_EAX + 0x14) = 0;
  *(undefined4 *)(in_EAX + 0x18) = 0;
  return;
}

