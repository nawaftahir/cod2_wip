// 1000bdc0 size=340 R_Material_Duplicate

void R_Material_Duplicate(int *param_1,char *param_2)

{
  char cVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  int iVar7;
  int iStack_4;
  
  iVar6 = 0;
  iStack_4 = 0;
  if (DAT_1076a82c < 1) {
LAB_1000be81:
    if (DAT_1076a82c < 0x10) {
      piVar3 = (int *)(*(code *)RI_Hunk_AllocInternal)(0x14);
      *piVar3 = *param_1;
      piVar3[1] = param_1[1];
      piVar3[2] = param_1[2];
      piVar3[3] = param_1[3];
      piVar3[4] = param_1[4];
      pcVar5 = param_2;
      do {
        cVar1 = *pcVar5;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      iVar7 = (*(code *)RI_Hunk_AllocInternal)(pcVar5 + (1 - (int)(param_2 + 1)));
      iVar2 = iVar7 - (int)param_2;
      do {
        cVar1 = *param_2;
        param_2[iVar2] = cVar1;
        param_2 = param_2 + 1;
      } while (cVar1 != '\0');
      *piVar3 = iVar7;
      (&DAT_101ce840)[iVar6] = piVar3;
      DAT_1076a82c = DAT_1076a82c + 1;
      return;
    }
    FUN_100138c0();
    return;
  }
LAB_1000bde0:
  piVar3 = (int *)(&DAT_101ce840)[iStack_4];
  pcVar5 = (char *)*piVar3;
  iVar7 = (int)param_2 - (int)pcVar5;
  iVar6 = 0x7fffffff;
  do {
    iVar2 = (int)pcVar5[iVar7];
    iVar4 = (int)*pcVar5;
    pcVar5 = pcVar5 + 1;
    if (iVar6 == 0) goto LAB_1000be28;
    if (iVar2 != iVar4) {
      if ((0x60 < iVar2) && (iVar2 < 0x7b)) {
        iVar2 = iVar2 + -0x20;
      }
      if ((0x60 < iVar4) && (iVar4 < 0x7b)) {
        iVar4 = iVar4 + -0x20;
      }
      if (iVar2 != iVar4) break;
    }
    iVar6 = iVar6 + -1;
    if (iVar2 == 0) goto LAB_1000be28;
  } while( true );
  if ((char)((iVar4 <= iVar2) * '\x02') == '\x01') {
LAB_1000be28:
    iVar6 = *piVar3;
    *piVar3 = *param_1;
    piVar3[1] = param_1[1];
    piVar3[2] = param_1[2];
    piVar3[3] = param_1[3];
    piVar3[4] = param_1[4];
    *piVar3 = iVar6;
    return;
  }
  iVar6 = iStack_4 + 1;
  iStack_4 = iVar6;
  if (DAT_1076a82c <= iVar6) goto LAB_1000be81;
  goto LAB_1000bde0;
}


