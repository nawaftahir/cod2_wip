// 1001a920 size=217 FUN_1001a920

undefined1 FUN_1001a920(ushort *param_1,undefined4 param_2,undefined4 *param_3)

{
  byte bVar1;
  undefined1 uVar2;
  int iVar3;
  undefined4 uVar4;
  int *unaff_EBP;
  int unaff_ESI;
  int *local_4;
  
  iVar3 = FUN_10063884(*(undefined4 *)(unaff_ESI + 4),&local_4);
  if (iVar3 < 0) {
    uVar4 = FUN_100efe3c(iVar3,iVar3);
    FUN_1005f360("Couldn\'t get the constant table: %s (%08x)\n",uVar4);
    return 0;
  }
  iVar3 = (**(code **)(*local_4 + 0xc))(local_4);
  bVar1 = *(byte *)(iVar3 + 0xc);
  *param_1 = (ushort)bVar1;
  if (bVar1 == 0) {
    *param_3 = 0;
    iVar3 = FUN_1005faf0(&DAT_10195818,1);
    if (iVar3 != 0) {
      iVar3 = FUN_1005faf0(&DAT_101950c4,1);
      if (iVar3 != 0) {
        (**(code **)(*unaff_EBP + 8))(unaff_EBP);
        return 1;
      }
    }
    (**(code **)(*unaff_EBP + 8))(unaff_EBP);
    return 0;
  }
  uVar4 = (*(code *)RI_Hunk_AllocInternal)((uint)(ushort)bVar1 << 3);
  *param_3 = uVar4;
  uVar2 = FUN_1001a160();
  (**(code **)(*unaff_EBP + 8))(unaff_EBP);
  return uVar2;
}


