
void FUN_0041ecf0(void)

{
  int in_EAX;
  undefined4 *puVar1;
  int iVar2;
  
  iVar2 = 0;
  if (0 < *(int *)(in_EAX + 4)) {
    do {
      puVar1 = (undefined4 *)FUN_0041e950();
      _free((void *)*puVar1);
      iVar2 = iVar2 + 1;
    } while (iVar2 < *(int *)(in_EAX + 4));
  }
  if (*(void **)(in_EAX + 0x10) != (void *)0x0) {
    _free(*(void **)(in_EAX + 0x10));
  }
  *(undefined4 *)(in_EAX + 0x10) = 0;
  *(int *)(in_EAX + 4) = 0;
  *(undefined4 *)(in_EAX + 8) = 0;
  return;
}

