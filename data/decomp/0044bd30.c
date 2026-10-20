
void __thiscall FUN_0044bd30(int param_1,uint param_2)

{
  int iVar1;
  uint *puVar2;
  int *piVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005267d8;
  local_10 = ExceptionList;
  if (((CMenu *)(param_1 + 0xe0) != (CMenu *)0x0) && (*(int *)(param_1 + 0xe4) != 0)) {
    ExceptionList = &local_10;
    local_14 = param_1;
    piVar3 = (int *)FUN_004ff4c3();
    local_14 = (**(code **)(*piVar3 + 0xc))();
    local_14 = local_14 + 0x10;
    local_8 = 0;
    CMenu::GetMenuStringA
              ((CMenu *)(param_1 + 0xe0),param_2,
               (CStringT<char,StrTraitMFC<char,ATL::ChTraitsCRT<char>_>_> *)&local_14,0);
    for (puVar2 = *(uint **)(param_1 + 0xf0); puVar2 != (uint *)0x0; puVar2 = (uint *)puVar2[2]) {
      if (*puVar2 == param_2) {
        uVar5 = *(undefined4 *)(param_1 + 0x11c);
        uVar4 = *(undefined4 *)(param_1 + 0x118);
        goto LAB_0044bdbc;
      }
    }
    uVar5 = *(undefined4 *)(param_1 + 0x11c);
    uVar4 = *(undefined4 *)(param_1 + 0x118);
LAB_0044bdbc:
    FUN_0044bb80(uVar4,uVar5);
    local_8 = 0xffffffff;
    DAT_0123348c = 0xffffffff;
    piVar3 = (int *)(local_14 + -4);
    LOCK();
    iVar1 = *piVar3;
    *piVar3 = *piVar3 + -1;
    UNLOCK();
    if (iVar1 == 1 || iVar1 + -1 < 0) {
      (**(code **)(**(int **)(local_14 + -0x10) + 4))((undefined4 *)(local_14 + -0x10));
    }
  }
  ExceptionList = local_10;
  return;
}

