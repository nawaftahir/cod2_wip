// 1005eaf0 size=282 FUN_1005eaf0

void FUN_1005eaf0(undefined4 *param_1,undefined4 *param_2,uint param_3)

{
  undefined4 uVar1;
  uint uVar2;
  uint uVar3;
  
  uVar2 = param_3;
  if (0x1000 < (int)param_3) {
    uVar2 = 0x1000;
  }
  for (uVar2 = uVar2 + 0x1f >> 5; uVar2 != 0; uVar2 = uVar2 - 1) {
  }
  if (param_3 != 0) {
    if (0x1f < (int)param_3) {
      uVar2 = param_3 & 0xffffffe0;
      do {
        uVar3 = uVar2 - 0x20;
        uVar1 = *(undefined4 *)((int)param_2 + (uVar2 - 0x1c));
        *(undefined4 *)((int)param_1 + uVar3) = *(undefined4 *)((int)param_2 + uVar3);
        *(undefined4 *)((int)param_1 + (uVar2 - 0x1c)) = uVar1;
        uVar1 = *(undefined4 *)((int)param_2 + (uVar2 - 0x14));
        *(undefined4 *)((int)param_1 + (uVar2 - 0x18)) =
             *(undefined4 *)((int)param_2 + (uVar2 - 0x18));
        *(undefined4 *)((int)param_1 + (uVar2 - 0x14)) = uVar1;
        uVar1 = *(undefined4 *)((int)param_2 + (uVar2 - 0xc));
        *(undefined4 *)((int)param_1 + (uVar2 - 0x10)) =
             *(undefined4 *)((int)param_2 + (uVar2 - 0x10));
        *(undefined4 *)((int)param_1 + (uVar2 - 0xc)) = uVar1;
        uVar1 = *(undefined4 *)((int)param_2 + (uVar2 - 4));
        *(undefined4 *)((int)param_1 + (uVar2 - 8)) = *(undefined4 *)((int)param_2 + (uVar2 - 8));
        *(undefined4 *)((int)param_1 + (uVar2 - 4)) = uVar1;
        uVar2 = uVar3;
      } while (0x1f < (int)uVar3);
      param_2 = (undefined4 *)((int)param_2 + (param_3 & 0xffffffe0));
      param_1 = (undefined4 *)((int)param_1 + (param_3 & 0xffffffe0));
      param_3 = param_3 & 0x1f;
      if (param_3 == 0) {
        return;
      }
    }
    if (0xf < (int)param_3) {
      *param_1 = *param_2;
      param_1[1] = param_2[1];
      param_1[2] = param_2[2];
      param_1[3] = param_2[3];
      param_3 = param_3 - 0x10;
      param_2 = param_2 + 4;
      param_1 = param_1 + 4;
    }
    if (7 < (int)param_3) {
      *param_1 = *param_2;
      param_3 = param_3 - 8;
      param_1[1] = param_2[1];
      param_2 = param_2 + 2;
      param_1 = param_1 + 2;
    }
    if (3 < (int)param_3) {
      uVar1 = *param_2;
      param_2 = param_2 + 1;
      param_3 = param_3 - 4;
      *param_1 = uVar1;
      param_1 = param_1 + 1;
    }
    if ((int)param_3 < 2) {
      if (0 < (int)param_3) {
        *(undefined1 *)param_1 = *(undefined1 *)param_2;
      }
    }
    else {
      *(undefined2 *)param_1 = *(undefined2 *)param_2;
      if (2 < (int)param_3) {
        *(undefined1 *)((int)param_1 + 2) = *(undefined1 *)((int)param_2 + 2);
      }
    }
  }
  return;
}


