// 1000c250 size=280 FUN_1000c250

int FUN_1000c250(int param_1,int *param_2,float *param_3,undefined4 *param_4)

{
  ushort uVar1;
  ushort uVar2;
  char *pcVar3;
  undefined4 uVar4;
  float *in_EDX;
  float *unaff_EBX;
  int iVar5;
  undefined1 *unaff_EDI;
  
  *in_EDX = 1.0;
  *param_3 = 1.0;
  *param_4 = 0;
  if (unaff_EDI != (undefined1 *)0x0) {
    *unaff_EDI = 0;
  }
  iVar5 = 0;
  if (0 < *param_2) {
    do {
      uVar1 = *(ushort *)(param_1 + iVar5 * 2);
      uVar2 = uVar1 & 0xff;
      switch(uVar1 >> 8) {
      case 0xd:
        if (unaff_EBX != (float *)0x0) {
          *unaff_EBX = (float)uVar2 * 0.003921569;
        }
        break;
      case 0xe:
        if (unaff_EBX != (float *)0x0) {
          unaff_EBX[1] = (float)uVar2 * 0.003921569;
        }
        break;
      case 0xf:
        if (unaff_EBX != (float *)0x0) {
          unaff_EBX[2] = (float)uVar2 * 0.003921569;
        }
        break;
      case 0x10:
        *in_EDX = (float)uVar2 * *in_EDX * 0.03125;
        break;
      case 0x11:
        *param_3 = (float)uVar2 * *param_3 * 0.03125;
        break;
      case 0x12:
        pcVar3 = (char *)(*(code *)RI_RI_unk168)(uVar2);
        uVar4 = DAT_101d1b2c;
        if (*pcVar3 != '\0') {
          uVar4 = FUN_10017100(7);
        }
        *param_4 = uVar4;
        *param_2 = *param_2 - (iVar5 + 1);
        return param_1 + (iVar5 + 1) * 2;
      case 0x13:
        *in_EDX = (float)uVar2 * *in_EDX * 0.03125;
        if (unaff_EDI != (undefined1 *)0x0) {
          *unaff_EDI = 1;
        }
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < *param_2);
  }
  return 0;
}


