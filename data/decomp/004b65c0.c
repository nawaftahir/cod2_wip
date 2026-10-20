
int __fastcall FUN_004b65c0(int param_1)

{
  int iVar1;
  int iVar2;
  
  FUN_004c40e0();
  if (*(int *)(param_1 + 0x150) == 0) {
    iVar1 = FUN_004c4870(param_1 + 0x134,param_1 + 0x140);
    if (iVar1 != 0) {
      *(undefined4 *)(param_1 + 0x150) = 0;
      FUN_004bf280(iVar1);
      FUN_004c47a0();
      return param_1 + 0x14c;
    }
    if ((((*(byte *)(param_1 + 0x168) & 8) == 0) && (iVar1 = FUN_004c0fe0("P4PASSWD"), iVar1 != 0))
       && ((*(int *)(param_1 + 0xc0) < 2 || (iVar2 = FUN_004c1010("P4PASSWD"), iVar2 == 0)))) {
      *(undefined4 *)(param_1 + 0x150) = 0;
      FUN_004bf280(iVar1);
    }
  }
  FUN_004c47a0();
  return param_1 + 0x14c;
}

