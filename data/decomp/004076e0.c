
void FUN_004076e0(void)

{
  int iVar1;
  undefined4 *puVar2;
  int *unaff_EBX;
  int iVar3;
  
  iVar1 = unaff_EBX[1];
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      puVar2 = (undefined4 *)FUN_00407730();
      (**(code **)(*unaff_EBX + 0x14))(*puVar2);
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
  }
  return;
}

