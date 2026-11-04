// 100821c3 size=168 FUN_100821c3

int FUN_100821c3(undefined4 *param_1)

{
  uint uVar1;
  int iVar2;
  undefined4 *puVar3;
  void *pvVar4;
  int iVar5;
  undefined4 uVar6;
  int in_ECX;
  uint uVar7;
  undefined4 *puVar8;
  int *piVar9;
  
  uVar1 = FUN_10062e9a(param_1);
  if (uVar1 == 0) {
    iVar2 = -0x7789f4a7;
  }
  else {
    puVar8 = (undefined4 *)(in_ECX + 8);
    iVar2 = FUN_10081e27(uVar1,puVar8);
    if (-1 < iVar2) {
      puVar3 = (undefined4 *)(**(code **)(*(int *)*puVar8 + 0xc))((int *)*puVar8);
      for (uVar7 = uVar1 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
        *puVar3 = *param_1;
        param_1 = param_1 + 1;
        puVar3 = puVar3 + 1;
      }
      for (uVar1 = uVar1 & 3; uVar1 != 0; uVar1 = uVar1 - 1) {
        *(undefined1 *)puVar3 = *(undefined1 *)param_1;
        param_1 = (undefined4 *)((int)param_1 + 1);
        puVar3 = (undefined4 *)((int)puVar3 + 1);
      }
      pvVar4 = operator_new(0x20);
      if (pvVar4 == (void *)0x0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_10080e16();
      }
      if (iVar5 == 0) {
        iVar2 = -0x7ff8fff2;
      }
      else {
        piVar9 = (int *)*puVar8;
        uVar6 = (**(code **)(*piVar9 + 0xc))(piVar9,in_ECX + 0xc);
        iVar2 = FUN_10080e37(uVar6,piVar9);
        if (iVar2 < 0) {
          FUN_100636bc(1);
        }
        else {
          *(int *)(in_ECX + 0x10) = iVar5;
          iVar2 = 0;
        }
      }
    }
  }
  return iVar2;
}


