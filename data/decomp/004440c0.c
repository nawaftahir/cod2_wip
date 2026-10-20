
void FUN_004440c0(void)

{
  int iVar1;
  int in_EAX;
  
  if (DAT_0109fdcc == 0) {
    FUN_0047a5b0("Undo_AddEntity: no last undo.\n");
    return;
  }
  FUN_00443fd0();
  if (in_EAX != *(int *)(DAT_012334ec + 8)) {
    for (iVar1 = *(int *)(in_EAX + 0xc); iVar1 != in_EAX + 8; iVar1 = *(int *)(iVar1 + 4)) {
      FUN_00443d90();
    }
  }
  return;
}

