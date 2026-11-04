// 100843e6 size=251 FUN_100843e6

int FUN_100843e6(undefined4 *param_1,short *param_2,undefined4 *param_3)

{
  short *psVar1;
  int *in_ECX;
  int iVar2;
  int *piVar3;
  undefined4 *puVar4;
  short **ppsVar5;
  undefined8 uVar6;
  undefined4 uVar7;
  char *pcVar8;
  short *local_24 [8];
  
  psVar1 = param_2;
  puVar4 = param_1;
  ppsVar5 = local_24;
  for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
    *ppsVar5 = (short *)*puVar4;
    puVar4 = puVar4 + 1;
    ppsVar5 = ppsVar5 + 1;
  }
  local_24[2] = param_2 + 1;
  local_24[0] = (short *)0xa;
  iVar2 = FUN_1009e0fb(1,local_24,0,0,in_ECX[1],2,&param_2,0);
  if (iVar2 == 0) {
    uVar6 = FUN_10084323(*(undefined4 *)(param_2 + 0x10),param_3,0);
    piVar3 = (int *)((ulonglong)uVar6 >> 0x20);
    if ((int)uVar6 < 0) {
      return (int)uVar6;
    }
    if (*psVar1 == 0x5f62) {
      if (((*piVar3 != 1) || (iVar2 = *(int *)(param_2 + 0x10), *(int *)(iVar2 + 4) != 9)) ||
         ((*(int *)(iVar2 + 0x10) != 0 || (*(int *)(iVar2 + 0x14) != 0)))) {
        pcVar8 = "boolean constant register \'%s\' must be defined as a variable of type bool only";
        uVar7 = 0xb54;
LAB_100844c3:
        FUN_10067c3e(*(int *)(*in_ECX + 4) + 0x18,param_1,uVar7,pcVar8,psVar1);
        return -0x7fffbffb;
      }
    }
    else if ((*psVar1 == 0x5f69) &&
            ((((*piVar3 != 1 || (iVar2 = *(int *)(param_2 + 0x10), *(int *)(iVar2 + 4) != 9)) ||
              (*(int *)(iVar2 + 0x10) != 1)) ||
             ((*(int *)(iVar2 + 0x14) != 4 || (*(uint *)(iVar2 + 0x1c) < 3)))))) {
      pcVar8 = 
      "integer constant register \'%s\' must be defined as a variable of type int3 or int4 only";
      uVar7 = 0xb55;
      goto LAB_100844c3;
    }
  }
  else {
    *param_3 = 0;
  }
  return 0;
}


