extern int FUN_10043de0();
extern int FUN_10047d40();
extern int FUN_10047ec0();


void FUN_100477e0(int *param_1,char param_2)

{
  int iVar1;
  int *piVar2;
  unsigned int uVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  unsigned int *puVar7;
  unsigned char bVar8;
  int local_4;
  
  piVar2 = param_1;
  iVar1 = param_1[0x59];
  *(int **)(iVar1 + 0x20) = param_1;
  *(char *)(iVar1 + 0xc) = param_2;
  bVar8 = param_1[0x4d] == 0;
  if (param_1[0x4f] == 0) {
    if (bVar8) {
      *(void **)(iVar1 + 4) = FUN_10047d40;
    }
    else {
      *(void **)(iVar1 + 4) = FUN_10047ec0;
    }
  }
  else if (bVar8) {
    *(unsigned char **)(iVar1 + 4) = &LAB_100480c0;
  }
  else {
    *(unsigned char **)(iVar1 + 4) = &LAB_10048190;
    if (*(int *)(iVar1 + 0x40) == 0) {
      uVar3 = (**(void **)param_1[1])(param_1,1,1000);
      *(unsigned int *)(iVar1 + 0x40) = uVar3;
    }
  }
  if (param_2 == '\0') {
    *(unsigned char **)(iVar1 + 8) = &LAB_10048420;
  }
  else {
    *(unsigned char **)(iVar1 + 8) = &LAB_10048470;
  }
  local_4 = 0;
  if (0 < param_1[0x3b]) {
    piVar5 = param_1 + 0x3c;
    param_1 = (unsigned int *)(iVar1 + 0x24);
    do {
      iVar6 = *piVar5;
      *param_1 = 0;
      if (bVar8) {
        if (piVar2[0x4f] == 0) {
          iVar6 = *(int *)(iVar6 + 0x14);
          goto LAB_100478b3;
        }
      }
      else {
        iVar6 = *(int *)(iVar6 + 0x18);
        *(int *)(iVar1 + 0x34) = iVar6;
LAB_100478b3:
        if (param_2 == '\0') {
          FUN_10043de0(piVar2,bVar8);
        }
        else {
          if ((iVar6 < 0) || (3 < iVar6)) {
            *(unsigned int *)(*piVar2 + 0x14) = 0x32;
            *(int *)(*piVar2 + 0x18) = iVar6;
            (**(void **)*piVar2)(piVar2);
          }
          if (*(int *)(iVar1 + 0x5c + iVar6 * 4) == 0) {
            uVar3 = (**(void **)piVar2[1])(piVar2,1,0x404);
            *(unsigned int *)(iVar1 + 0x5c + iVar6 * 4) = uVar3;
          }
          puVar7 = *(unsigned int **)(iVar1 + 0x5c + iVar6 * 4);
          for (iVar4 = 0x101; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar7 = 0;
            puVar7 = puVar7 + 1;
          }
        }
      }
      local_4 = local_4 + 1;
      param_1 = param_1 + 1;
      piVar5 = piVar5 + 1;
    } while (local_4 < piVar2[0x3b]);
  }
  *(unsigned int *)(iVar1 + 0x38) = 0;
  *(unsigned int *)(iVar1 + 0x3c) = 0;
  *(unsigned int *)(iVar1 + 0x18) = 0;
  *(unsigned int *)(iVar1 + 0x1c) = 0;
  iVar6 = piVar2[0x31];
  *(unsigned int *)(iVar1 + 0x48) = 0;
  *(int *)(iVar1 + 0x44) = iVar6;
  return;
}


