
void FUN_0040fc10(void)

{
  int *piVar1;
  int iVar2;
  undefined4 *puVar3;
  CDialog *unaff_ESI;
  
  puVar3 = (undefined4 *)(*(int *)(unaff_ESI + 0x78) + -0x10);
  piVar1 = (int *)(*(int *)(unaff_ESI + 0x78) + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 + -1 < 1) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  puVar3 = (undefined4 *)(*(int *)(unaff_ESI + 0x74) + -0x10);
  piVar1 = (int *)(*(int *)(unaff_ESI + 0x74) + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  CDialog::~CDialog(unaff_ESI);
  return;
}

