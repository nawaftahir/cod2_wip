// 10025570 size=286 FUN_10025570

void FUN_10025570(undefined4 *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *unaff_EBX;
  undefined4 *puVar3;
  
  puVar1 = param_1;
  puVar3 = unaff_EBX;
  for (iVar2 = 0x53; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  unaff_EBX[0xc] = *param_1;
  unaff_EBX[0xd] = param_1[1];
  unaff_EBX[0xe] = param_1[2];
  unaff_EBX[0xf] = param_1[3];
  unaff_EBX[0x10] = 0;
  unaff_EBX[0x11] = 0x3f800000;
  *unaff_EBX = param_1[6];
  unaff_EBX[1] = param_1[7];
  unaff_EBX[2] = param_1[8];
  unaff_EBX[3] = param_1[9];
  unaff_EBX[4] = param_1[10];
  unaff_EBX[5] = param_1[0xb];
  unaff_EBX[6] = param_1[0xc];
  unaff_EBX[7] = param_1[0xd];
  unaff_EBX[8] = param_1[0xe];
  unaff_EBX[9] = param_1[0xf];
  unaff_EBX[10] = param_1[0x10];
  unaff_EBX[0xb] = param_1[0x11];
  FUN_1005bcb0();
  if ((float)param_1[0x13] <= 0.0) {
    param_1 = *(undefined4 **)(DAT_101ce814 + 8);
    if (0.0 <= 0.01 - (float)param_1) {
      param_1 = (undefined4 *)0x3c23d70a;
    }
  }
  else {
    param_1 = (undefined4 *)param_1[0x13];
  }
  FUN_1005bbe0(puVar1[4],puVar1[5],param_1);
  unaff_EBX[0x52] = *(undefined4 *)(DAT_101ce678 + 8);
  FUN_1005a880();
  FUN_1005ad00();
  return;
}


