
/* WARNING: Removing unreachable block (ram,0x004b5b2b) */

void __thiscall FUN_004b5a60(int param_1,undefined *param_2,int param_3)

{
  uint uVar1;
  
  *(int *)(param_1 + 200 + *(int *)(param_1 + 0xdc) * 4) = param_3;
  if (param_3 != 0) {
    *(int *)(param_3 + 4) = param_1;
    *(undefined4 *)(param_3 + 8) = *(undefined4 *)(param_1 + 0x164);
  }
  if (param_2 == (undefined *)0x0) {
    param_2 = &DAT_00528b0c;
  }
  FUN_004bf280("user-");
  FUN_004bf280(param_2);
  FUN_004b5690();
  FUN_004bb840(&DAT_00598c80);
  uVar1 = *(int *)(param_1 + 0xdc) + 1U & 0x80000003;
  if ((int)uVar1 < 0) {
    uVar1 = (uVar1 - 1 | 0xfffffffc) + 1;
  }
  if (uVar1 == *(uint *)(param_1 + 0xd8)) {
    FUN_004b55c0(*(undefined4 *)(param_1 + 200 + *(uint *)(param_1 + 0xd8) * 4));
  }
  *(uint *)(param_1 + 0xdc) = uVar1;
  if (*(int *)(param_1 + 0xe0) == 0) {
    FUN_004b55c0(0);
  }
  return;
}

