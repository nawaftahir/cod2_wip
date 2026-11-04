// 1007ddd9 size=61 FUN_1007ddd9

undefined4
FUN_1007ddd9(int *param_1,int param_2,undefined4 *param_3,undefined4 param_4,uint param_5)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  
  iVar1 = (**(code **)(*param_1 + 0xc))(param_1);
  puVar3 = (undefined4 *)(iVar1 + param_2 * 0x10);
  for (iVar2 = (param_5 & 0xfffffff) << 2; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = *param_3;
    param_3 = param_3 + 1;
    puVar3 = puVar3 + 1;
  }
  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
    *(undefined1 *)puVar3 = *(undefined1 *)param_3;
    param_3 = (undefined4 *)((int)param_3 + 1);
    puVar3 = (undefined4 *)((int)puVar3 + 1);
  }
  return 0;
}


