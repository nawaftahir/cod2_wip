
void FUN_00443ec0(void)

{
  undefined4 *puVar1;
  undefined4 *unaff_EDI;
  
  if (DAT_0109fdcc == 0) {
    FUN_0047a5b0("Undo_AddBrushList: no last undo.\n");
    return;
  }
  if (*(int *)(DAT_0109fdcc + 0x60) != DAT_0109fdcc + 0x5c) {
    FUN_0047a5b0("Undo_AddBrushList: WARNING adding brushes after entity.\n");
  }
  for (puVar1 = (undefined4 *)*unaff_EDI; puVar1 != unaff_EDI; puVar1 = (undefined4 *)*puVar1) {
    if (*(int *)(*(int *)(*(int *)(puVar1[5] + 8) + 0x50) + 8) != 0) {
      FUN_00443fd0();
    }
    FUN_00443d90();
  }
  return;
}

