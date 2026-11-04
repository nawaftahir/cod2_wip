// 10005980 size=93 R_LightingFromCubemapShots

void R_LightingFromCubemapShots(undefined4 *param_1,uint param_2,int param_3)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  
  iVar1 = DAT_101da9c8;
  if (param_1 != (undefined4 *)0x0) {
    if (*(int *)(DAT_101da9c8 + 0x249d3c) == 0) {
      uVar2 = (*(code *)RI_Z_MallocInternal)(param_3 << 7);
      *(undefined4 *)(iVar1 + 0x249d3c) = uVar2;
    }
    puVar4 = *(undefined4 **)(iVar1 + 0x249d3c);
    for (iVar3 = (param_2 & 0x1ffffff) << 5; iVar3 != 0; iVar3 = iVar3 + -1) {
      *puVar4 = *param_1;
      param_1 = param_1 + 1;
      puVar4 = puVar4 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar4 = *(undefined1 *)param_1;
      param_1 = (undefined4 *)((int)param_1 + 1);
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
    *(uint *)(iVar1 + 0x249d40) = param_2;
    return;
  }
  *(uint *)(DAT_101da9c8 + 0x249d40) = param_2;
  return;
}


