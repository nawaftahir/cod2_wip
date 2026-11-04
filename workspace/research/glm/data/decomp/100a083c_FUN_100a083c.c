// 100a083c size=432 FUN_100a083c

int FUN_100a083c(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  undefined4 in_ECX;
  undefined4 uVar6;
  char *pcVar7;
  undefined4 uVar8;
  int local_14;
  int local_10;
  uint local_c;
  undefined4 local_8;
  
  local_14 = 0;
  piVar3 = &local_14;
  local_8 = in_ECX;
  if (param_2 == 0) {
LAB_100a09e8:
    local_14 = 0;
  }
  else {
    do {
      if (*(int *)(param_2 + 8) == 0) goto LAB_100a09e8;
      iVar2 = FUN_1006506e(0x14);
      if (iVar2 == 0) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_10082872(0,0,"Stmts");
      }
      *piVar3 = iVar2;
      if (iVar2 == 0) goto LAB_100a09e8;
      iVar2 = FUN_1006506e(0x30);
      if (iVar2 == 0) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_10082c4b(0,0,0,0);
      }
      if (iVar2 == 0) goto LAB_100a09e8;
      *(int *)(*piVar3 + 8) = iVar2;
      piVar3 = (int *)(*piVar3 + 0xc);
      local_c = 1;
      local_10 = 0;
      if (param_1 != 0) {
        iVar4 = FUN_10082816(param_1);
        *(int *)(iVar2 + 0x18) = iVar4;
        if (iVar4 == 0) goto LAB_100a09e8;
      }
      for (iVar4 = *(int *)(param_2 + 8); *(int *)(iVar4 + 4) != 3; iVar4 = *(int *)(iVar4 + 8)) {
        iVar5 = FUN_1006506e(0x18);
        if (iVar5 == 0) {
          iVar5 = 0;
        }
        else {
          iVar5 = FUN_10082d9b();
        }
        if (iVar5 == 0) goto LAB_100a09e8;
        *(undefined4 *)(iVar5 + 0x10) = *(undefined4 *)(iVar2 + 0x18);
        *(int *)(iVar2 + 0x18) = iVar5;
        piVar1 = (int *)(iVar5 + 0x14);
        if (*(int *)(iVar4 + 0xc) == 0) {
          local_10 = 0xc00;
LAB_100a093d:
          *piVar1 = 1;
        }
        else {
          iVar5 = FUN_100a07e3(*(int *)(iVar4 + 0xc),piVar1);
          if (iVar5 < 0) {
            local_10 = 0xbf2;
            goto LAB_100a093d;
          }
        }
        local_c = *piVar1 * local_c;
      }
      iVar5 = FUN_10082816(iVar4);
      *(int *)(iVar2 + 0x14) = iVar5;
      if (iVar5 == 0) goto LAB_100a09e8;
      if (local_10 == 0xbf2) {
        uVar8 = *(undefined4 *)(iVar4 + 0x18);
        pcVar7 = "\'%s\': array dimensions must be literal scalar expressions";
        uVar6 = 0xbf2;
LAB_100a09dc:
        FUN_100994dd(local_8,iVar4 + 0x10,uVar6,pcVar7,uVar8);
        goto LAB_100a09e8;
      }
      if (local_10 == 0xc00) {
        uVar8 = *(undefined4 *)(iVar4 + 0x18);
        pcVar7 = "\'%s\': array dimensions of type must be explicit";
        uVar6 = 0xc00;
        goto LAB_100a09dc;
      }
      if ((local_c == 0) || (0x10000 < local_c)) {
        uVar8 = *(undefined4 *)(iVar4 + 0x18);
        pcVar7 = "\'%s\': array dimension must be between 1 and 65536";
        uVar6 = 0xbf3;
        goto LAB_100a09dc;
      }
      iVar2 = FUN_1009ab7f(iVar2,1);
      if (iVar2 < 0) goto LAB_100a09e8;
      param_2 = *(int *)(param_2 + 0xc);
    } while (param_2 != 0);
  }
  return local_14;
}


