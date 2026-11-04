extern unsigned int DAT_1010c228;
extern unsigned char UNK[1];


unsigned int FUN_10063776(byte *param_1,unsigned int param_2,unsigned int *param_3)

{
  byte bVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int uVar5;
  byte *pbVar6;
  byte *pbVar7;
  unsigned char bVar8;
  unsigned int local_8;
  
  uVar5 = 0;
  if (param_1 == (byte *)0x0) {
    uVar2 = 0x8876086c;
  }
  else {
    local_8 = 0x2c;
    do {
      uVar3 = local_8 + uVar5 >> 1;
      pbVar6 = *(byte **)(&UNK_1010c220 + uVar3 * 0xc);
      pbVar7 = param_1;
      do {
        bVar1 = *pbVar6;
        bVar8 = bVar1 < *pbVar7;
        if (bVar1 != *pbVar7) {
LAB_100637c6:
          iVar4 = (1 - (unsigned int)bVar8) - (unsigned int)(bVar8 != 0);
          goto LAB_100637cb;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar6[1];
        bVar8 = bVar1 < pbVar7[1];
        if (bVar1 != pbVar7[1]) goto LAB_100637c6;
        pbVar6 = pbVar6 + 2;
        pbVar7 = pbVar7 + 2;
      } while (bVar1 != 0);
      iVar4 = 0;
LAB_100637cb:
      if (iVar4 == 0) {
        iVar4 = uVar3 * 0xc;
        if ((*(unsigned int *)(&g_1010c228 + iVar4) & param_2) == param_2) {
 
	int g_1010c228 = DAT_1010c228;         if (param_3 != (unsigned int *)0x0) {
            *param_3 = *(unsigned int *)(&UNK_1010c220 + iVar4);
            param_3[1] = *(unsigned int *)(&UNK_1010c224 + iVar4);
            param_3[2] = *(unsigned int *)(&g_1010c228 + iVar4);
          }
          return 0;
        }
        break;
      }
      if (iVar4 < 0) {
        uVar5 = uVar3 + 1;
        uVar3 = local_8;
      }
      local_8 = uVar3;
    } while (uVar5 < local_8);
    uVar2 = 0x80004005;
  }
  return uVar2;
}


