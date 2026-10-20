
void FUN_00468d10(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *puVar5;
  
  FUN_0047a5b0("Map_New\n");
  FUN_00467e60();
  FUN_00468100();
  puVar2 = (undefined4 *)FUN_004ff450(0x7c);
  puVar5 = puVar2;
  for (iVar4 = 0x1f; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = 0;
    puVar5 = puVar5 + 1;
  }
  puVar5 = puVar2 + 2;
  puVar2[3] = puVar5;
  *puVar5 = puVar5;
  FUN_00465bf0(puVar2,"classname","worldspawn");
  uVar3 = FUN_00464770(1);
  puVar2[0x14] = uVar3;
  FUN_00466110();
  DAT_012334ec = FUN_00467770(puVar2,&DAT_010a43d0,&DAT_010a44dc);
  iVar1 = DAT_01233488;
  *(undefined4 *)(*(int *)(DAT_01233488 + 0x78c) + 0x70) = 0;
  *(undefined4 *)(*(int *)(iVar1 + 0x78c) + 0x6c) = 0;
  iVar4 = *(int *)(iVar1 + 0x78c);
  *(undefined4 *)(iVar4 + 0x60) = 0;
  *(undefined4 *)(iVar4 + 100) = 0;
  *(undefined4 *)(iVar4 + 0x68) = 0;
  *(undefined4 *)(*(int *)(iVar1 + 0x78c) + 0x68) = 0x42400000;
  iVar4 = *(int *)(iVar1 + 0x788);
  *(undefined4 *)(iVar4 + 0x70) = 0;
  *(undefined4 *)(iVar4 + 0x74) = 0;
  *(undefined4 *)(iVar4 + 0x78) = 0;
  if ((*(int *)(iVar1 + 0x7e0) != 0) && (DAT_012334f4 != '\0')) {
    FUN_00452f50(*(int *)(iVar1 + 0x7e0));
  }
  DAT_012334f4 = 0;
  DAT_010a4908 = 0;
  DAT_0123348c = 0xffffffff;
  return;
}

