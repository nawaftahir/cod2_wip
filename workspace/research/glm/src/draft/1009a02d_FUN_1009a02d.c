extern unsigned int DAT_10114878;
extern unsigned int DAT_1011487c;


unsigned int FUN_1009a02d(int param_1,int param_2,int *param_3)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  int iVar5;
  int iVar6;
  unsigned int uVar7;
  unsigned char bVar8;
  unsigned char bVar9;
  
  if ((((param_1 == 0) || (*(int *)(param_1 + 4) != 9)) || (param_2 == 0)) ||
     (*(int *)(param_2 + 4) != 9)) {
LAB_1009a1cb:
    uVar4 = 0x80004005;
  }
  else {
    iVar1 = *(int *)(param_1 + 0x14);
    iVar2 = *(int *)(param_2 + 0x14);
    if (iVar1 == iVar2) {
      *param_3 = iVar1;
    }
    else {
      uVar7 = *(unsigned int *)(&g_10114878 + iVar2 * 8);
 
	int g_10114878 = DAT_10114878;     if (*(unsigned int *)(&g_10114878 + iVar2 * 8) < *(unsigned int *)(&g_10114878 + iVar1 * 8)) {
        uVar7 = *(unsigned int *)(&g_10114878 + iVar1 * 8);
      }
      uVar3 = *(unsigned int *)(&g_1011487c + iVar1 * 8) & *(unsigned int *)(&g_1011487c + iVar2 * 8);
   
	int g_1011487c = DAT_1011487c;   iVar6 = 1;
      if ((uVar3 & 1) == 0) {
        if ((uVar3 & 4) == 0) {
          if ((uVar3 & 2) == 0) {
            if ((uVar3 & 8) == 0) {
              if ((uVar3 & 0x10) != 0) {
                uVar7 = 0;
                do {
                  iVar6 = iVar2;
                  iVar5 = iVar1;
                  if (uVar7 == 0) {
                    iVar6 = iVar1;
                    iVar5 = iVar2;
                  }
                  if (iVar5 == 0xd) {
LAB_1009a1d7:
                    *param_3 = iVar6;
                    goto LAB_1009a1dc;
                  }
                  if (iVar5 == 0xf) {
                    if (0xe < iVar6) {
                      bVar9 = SBORROW4(iVar6,0x13);
                      iVar5 = -0x13;
                      bVar8 = iVar6 == 0x13;
LAB_1009a1c3:
                      if (bVar8 || bVar9 != iVar6 + iVar5 < 0) goto LAB_1009a1d7;
                    }
                  }
                  else if ((iVar5 == 0x14) && (0x13 < iVar6)) {
                    bVar9 = SBORROW4(iVar6,0x18);
                    iVar5 = -0x18;
                    bVar8 = iVar6 == 0x18;
                    goto LAB_1009a1c3;
                  }
                  uVar7 = uVar7 + 1;
                } while (uVar7 < 2);
              }
              goto LAB_1009a1cb;
            }
            if (uVar7 == 0) {
              *param_3 = 9;
            }
            else if ((uVar7 == 8) || (uVar7 == 0x10)) {
              *param_3 = 10;
            }
            else if (uVar7 == 0x20) {
              *param_3 = 0xb;
            }
            else if (uVar7 == 0x40) {
              *param_3 = 0xc;
            }
          }
          else if (uVar7 == 0) {
LAB_1009a0cc:
            *param_3 = iVar6;
          }
          else if (uVar7 == 8) {
            *param_3 = 2;
          }
          else if (uVar7 == 0x10) {
            *param_3 = 3;
          }
          else if ((uVar7 == 0x20) || (uVar7 == 0x40)) {
            *param_3 = 4;
          }
        }
        else if (uVar7 == 0) {
          *param_3 = 5;
        }
        else {
          iVar6 = 8;
          if (uVar7 == 8) {
            *param_3 = 6;
          }
          else if (uVar7 == 0x10) {
            *param_3 = 7;
          }
          else if ((uVar7 == 0x20) || (uVar7 == 0x40)) goto LAB_1009a0cc;
        }
      }
      else {
        *param_3 = 0;
      }
    }
LAB_1009a1dc:
    uVar4 = 0;
  }
  return uVar4;
}


