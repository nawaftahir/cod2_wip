
void __fastcall FUN_004b5690(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_004b6580();
  uVar2 = FUN_004b64f0();
  FUN_004be2c0("client",uVar2);
  uVar2 = FUN_004b60e0();
  FUN_004be2c0(&PTR_DAT_00528ae8,uVar2);
  uVar2 = FUN_004b6110();
  FUN_004be2c0(&DAT_00528ae0,uVar2);
  if (*(int *)(iVar1 + 4) != 0) {
    FUN_004be2c0("language",iVar1);
  }
  uVar2 = FUN_004b61a0();
  FUN_004be2c0(&DAT_00528adc,uVar2);
  uVar2 = FUN_004b6230();
  FUN_004be2c0(&DAT_00555d44,uVar2);
  if (*(int *)(param_1 + 0x16c) != 0) {
    FUN_004be150("unicode");
  }
  return;
}

