// 1005ec20 size=170 FUN_1005ec20

void FUN_1005ec20(int *param_1,uint param_2,uint param_3)

{
  undefined1 uVar1;
  int iVar2;
  uint uVar3;
  undefined2 *puVar4;
  
  uVar1 = (undefined1)param_2;
  if ((int)param_3 < 8) {
    iVar2 = (uint)CONCAT11(uVar1,uVar1) * 0x10000 + (uint)CONCAT11(uVar1,uVar1);
    if (3 < (int)param_3) {
      *param_1 = iVar2;
      param_1 = param_1 + 1;
      param_3 = param_3 - 4;
    }
    if (1 < (int)param_3) {
      *(short *)param_1 = (short)iVar2;
      param_1 = (int *)((int)param_1 + 2);
      param_3 = param_3 - 2;
    }
    if (param_3 != 0) {
      *(char *)param_1 = (char)iVar2;
    }
    return;
  }
  param_2 = param_2 << 8 | param_2;
  FUN_1005ea60(param_1,param_2 | param_2 << 0x10,(int)(param_3 + ((int)param_3 >> 0x1f & 3U)) >> 2);
  uVar3 = param_3 & 3;
  if (uVar3 != 0) {
    puVar4 = (undefined2 *)((int)param_1 + (param_3 & 0xfffffffc));
    if (uVar3 < 2) {
      if (uVar3 != 0) {
        *(undefined1 *)puVar4 = uVar1;
      }
    }
    else {
      *puVar4 = (short)param_2;
      if (uVar3 != 2) {
        *(undefined1 *)(puVar4 + 1) = uVar1;
      }
    }
  }
  return;
}


