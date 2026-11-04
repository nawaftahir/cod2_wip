// 1000c0f0 size=345 FUN_1000c0f0

int FUN_1000c0f0(int param_1,int *param_2,undefined1 *param_3)

{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  ushort uVar4;
  float *in_EAX;
  undefined1 *unaff_EBX;
  int iVar5;
  int iVar6;
  int iVar7;
  int local_c;
  
  if (0x3ff < *param_2) {
    *param_2 = 0x3ff;
  }
  *unaff_EBX = 0;
  iVar7 = 0;
  *param_3 = 0;
  iVar6 = 0;
  iVar5 = -1;
  uVar4 = 7;
  local_c = 0;
  if (0 < *param_2) {
    do {
      uVar2 = *(ushort *)(param_1 + iVar7 * 2);
      uVar3 = uVar2 >> 8;
      if (uVar3 == uVar4) {
LAB_1000c1e6:
        cVar1 = *(char *)(param_1 + iVar7 * 2);
        unaff_EBX[iVar6] = cVar1;
        if (cVar1 == ' ') {
          if (iVar5 == -1) {
            iVar5 = iVar6;
          }
        }
        else {
          iVar5 = -1;
        }
        iVar6 = iVar6 + 1;
      }
      else {
        if ((((uVar3 == 0xd) || (uVar3 == 0x10)) || (uVar3 == 0x11)) || (uVar3 == 0x12)) {
          local_c = param_1 + iVar7 * 2;
          iVar5 = -1;
          *param_3 = 1;
          break;
        }
        if (uVar3 == 10) {
          if (in_EAX != (float *)0x0) {
            *in_EAX = (float)(uVar2 & 0xff) * 0.003921569;
          }
        }
        else if (uVar3 == 0xb) {
          if (in_EAX != (float *)0x0) {
            in_EAX[1] = (float)(uVar2 & 0xff) * 0.003921569;
          }
        }
        else {
          if (uVar3 != 0xc) {
            unaff_EBX[iVar6] = 0x5e;
            unaff_EBX[iVar6 + 1] = (char)(uVar2 >> 8) + '0';
            iVar6 = iVar6 + 2;
            uVar4 = uVar3;
            goto LAB_1000c1e6;
          }
          if (in_EAX != (float *)0x0) {
            in_EAX[2] = (float)(uVar2 & 0xff) * 0.003921569;
          }
        }
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < *param_2);
  }
  unaff_EBX[iVar6] = 0;
  if (-1 < iVar5) {
    unaff_EBX[iVar5] = 0;
  }
  *param_2 = *param_2 - iVar7;
  return local_c;
}


