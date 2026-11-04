
void __thiscall FUN_004a0380(int *param_1,int param_2,char param_3)

{
  char cVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  
  if (*param_1 == 0) {
    puVar3 = (undefined4 *)FUN_004ff450(0x10);
    if (puVar3 == (undefined4 *)0x0) {
      puVar3 = (undefined4 *)0x0;
    }
    else {
      *puVar3 = 0;
      puVar3[1] = 0;
      puVar3[2] = 0;
      puVar3[3] = 0;
    }
    *param_1 = (int)puVar3;
  }
  FUN_004a02b0();
  iVar2 = *(int *)(*param_1 + 0xc);
  if (param_2 < iVar2) {
    return;
  }
  if (param_2 == 0) {
    if (DAT_0124a62a == '\0') {
      iVar4 = FUN_0047d980("amount","\\trees\\cod2src\\src\\universal\\splines\\util_str.cpp",0x168,
                           0,1);
      if (iVar4 == 0) {
        DebugBreak();
      }
      else if (iVar4 == 2) {
        DAT_0124a62a = '\x01';
      }
    }
  }
  else if (param_2 == 1) {
    *(undefined4 *)(*param_1 + 0xc) = 1;
    goto LAB_004a041b;
  }
  if (param_2 % 0x14 != 0) {
    param_2 = (param_2 - param_2 % 0x14) + 0x14;
  }
  *(int *)(*param_1 + 0xc) = param_2;
LAB_004a041b:
  pcVar5 = (char *)FUN_004ff450(*(undefined4 *)(*param_1 + 0xc));
  if ((iVar2 != 0) && (param_3 != '\0')) {
    pcVar6 = *(char **)(*param_1 + 8);
    pcVar7 = pcVar5;
    do {
      cVar1 = *pcVar6;
      pcVar6 = pcVar6 + 1;
      *pcVar7 = cVar1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
  }
  if (*(void **)(*param_1 + 8) != (void *)0x0) {
    _free(*(void **)(*param_1 + 8));
  }
  *(char **)(*param_1 + 8) = pcVar5;
  return;
}

