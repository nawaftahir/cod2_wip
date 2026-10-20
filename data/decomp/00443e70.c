
void FUN_00443e70(void)

{
  int in_EAX;
  
  if (DAT_0109fdcc == 0) {
    FUN_0047a5b0("Undo_AddBrush: no last undo.\n");
    return;
  }
  if (*(int *)(DAT_0109fdcc + 0x60) != DAT_0109fdcc + 0x5c) {
    FUN_0047a5b0("Undo_AddBrush: WARNING adding brushes after entity.\n");
  }
  if (*(int *)(*(int *)(*(int *)(in_EAX + 8) + 0x50) + 8) != 0) {
    FUN_00443fd0();
  }
  FUN_00443d90();
  return;
}

