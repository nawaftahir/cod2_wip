
void __thiscall FUN_004b55c0(int param_1,int *param_2)

{
  int *piVar1;
  uint uVar2;
  
  if (*(int *)(param_1 + 0xd8) != *(int *)(param_1 + 0xdc)) {
    do {
      FUN_004bb240(0,*(undefined4 *)(*(int *)(param_1 + 4) + 4));
      *(undefined4 *)(param_1 + 0xe0) = 1;
      piVar1 = *(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4);
      (**(code **)(*piVar1 + 0x44))();
      uVar2 = *(int *)(param_1 + 0xd8) + 1U & 0x80000003;
      if ((int)uVar2 < 0) {
        uVar2 = (uVar2 - 1 | 0xfffffffc) + 1;
      }
      *(uint *)(param_1 + 0xd8) = uVar2;
    } while ((param_2 != piVar1) && (uVar2 != *(uint *)(param_1 + 0xdc)));
  }
  return;
}

