
void __fastcall FUN_00444110(undefined4 param_1,int param_2)

{
  int iVar1;
  int iVar2;
  
  iVar2 = DAT_0109fdcc;
  if (((DAT_0109fdcc != 0) && (*(int *)(DAT_0109fdcc + 0xc) == 0)) &&
     (param_2 != *(int *)(DAT_012334ec + 8))) {
    *(undefined4 *)(param_2 + 0x6c) = *(undefined4 *)(DAT_0109fdcc + 8);
    for (iVar1 = *(int *)(param_2 + 0xc); iVar1 != param_2 + 8; iVar1 = *(int *)(iVar1 + 4)) {
      *(undefined4 *)(iVar1 + 0x10) = *(undefined4 *)(iVar2 + 8);
    }
  }
  return;
}

