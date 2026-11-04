
undefined4 FUN_004810e0(int *param_1,int *param_2)

{
  char cVar1;
  char cVar2;
  char *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  
  pcVar3 = "          ";
  iVar6 = 10;
  do {
    cVar1 = pcVar3[*param_1 + -0x5511e8];
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
    if (iVar6 == 0) break;
    if (cVar1 != cVar2) {
      if ((char)((cVar2 <= cVar1) * '\x02') != '\x01') goto LAB_004811c2;
      break;
    }
    iVar6 = iVar6 + -1;
  } while (cVar1 != '\0');
  pcVar3 = "          ";
  iVar6 = 10;
  do {
    cVar1 = pcVar3[*param_2 + -0x5511e8];
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
    if (iVar6 == 0) break;
    if (cVar1 != cVar2) {
      if ((char)((cVar2 <= cVar1) * '\x02') != '\x01') goto LAB_004811c2;
      break;
    }
    iVar6 = iVar6 + -1;
  } while (cVar1 != '\0');
  uVar4 = FUN_00481040();
  uVar5 = FUN_00481040();
  iVar6 = FUN_004965d0(uVar4,"english");
  if (iVar6 == 0) {
    iVar6 = FUN_004965d0(uVar5,"english");
    if (iVar6 != 0) {
      return 0xffffffff;
    }
  }
  else {
    iVar6 = FUN_004965d0(uVar5,"english");
    if (iVar6 == 0) {
      return 1;
    }
  }
LAB_004811c2:
  uVar4 = FUN_00480e50();
  return uVar4;
}

