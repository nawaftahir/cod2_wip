// 1006a8ce size=871 FUN_1006a8ce

int FUN_1006a8ce(void)

{
  char cVar1;
  short sVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  uint uVar6;
  char *in_EAX;
  int iVar7;
  int iVar8;
  int in_ECX;
  short *unaff_EBX;
  int unaff_EBP;
  int *piVar9;
  char *pcVar10;
  
  pcVar10 = in_EAX + 1;
  do {
    cVar1 = *in_EAX;
    in_EAX = in_EAX + 1;
  } while (cVar1 != '\0');
  if ((uint)((int)in_EAX - (int)pcVar10) < 3) {
    FUN_10067c3e(*(undefined4 *)(unaff_EBP + 8),*(undefined4 *)(unaff_EBP + 0x10),0x7d5,
                 "invalid register, input, or constant name \'%s\'");
    return -0x7fffbffb;
  }
  puVar3 = *(undefined4 **)(unaff_EBP + 0x20);
  puVar4 = *(undefined4 **)(unaff_EBP + 0x1c);
  *puVar4 = 0;
  *puVar3 = 0;
  **(undefined4 **)(unaff_EBP + 0x24) = 0;
  if (*unaff_EBX != 0x5f76) {
    if (*unaff_EBX == 0x5f72) {
      *puVar4 = 0;
      iVar7 = FUN_10068bc6(unaff_EBX);
      if (iVar7 == 0) {
        piVar9 = (int *)(in_ECX + 0xa4);
        **(int **)(unaff_EBP + 0x24) = *piVar9;
        FUN_1006a777(unaff_EBX,*piVar9,1);
        *piVar9 = *piVar9 + 1;
      }
      else {
        **(int **)(unaff_EBP + 0x24) = *(int *)(iVar7 + 4);
      }
      if (*(int *)(unaff_EBP + 0x18) == 0) {
        return 0;
      }
      pcVar10 = "addressing operations not allowed on temporary registers \'%s\'";
    }
    else {
      sVar2 = *unaff_EBX;
      if ((((sVar2 == 0x5f63) || (sVar2 == 0x5f62)) || (sVar2 == 0x5f69)) || (sVar2 == 0x5f73)) {
        if (*unaff_EBX == 0x5f62) {
          *puVar4 = 0xe;
          iVar7 = 0;
        }
        else if (*unaff_EBX == 0x5f69) {
          *puVar4 = 7;
          iVar7 = 1;
        }
        else if (*unaff_EBX == 0x5f73) {
          *puVar4 = 10;
          iVar7 = 2;
        }
        else {
          *puVar4 = 2;
          iVar7 = 3;
        }
        iVar8 = FUN_10068bc6(unaff_EBX);
        if (iVar8 == 0) {
          iVar8 = FUN_100843e6(*(undefined4 *)(unaff_EBP + 0x10),unaff_EBX,unaff_EBP + 0x20);
          if (iVar8 < 0) {
            return iVar8;
          }
          if (*(int *)(unaff_EBP + 0x20) == 0) {
            FUN_10067c3e(*(undefined4 *)(unaff_EBP + 8),*(undefined4 *)(unaff_EBP + 0x10),0x7d5,
                         "constant register \'%s\' must be defined as a variable \'%s\'");
            return -0x7fffbffb;
          }
          uVar5 = *(undefined4 *)(unaff_EBP + 0x20);
          piVar9 = (int *)(in_ECX + 0x8c + iVar7 * 4);
          **(int **)(unaff_EBP + 0x24) = *piVar9;
          FUN_1006a777(unaff_EBX,*piVar9,uVar5);
          *piVar9 = *piVar9 + *(int *)(unaff_EBP + 0x20);
          *(int *)(in_ECX + 0xac) = *(int *)(in_ECX + 0xac) + 1;
          piVar9 = *(int **)(unaff_EBP + 0x24);
        }
        else {
          piVar9 = *(int **)(unaff_EBP + 0x24);
          *piVar9 = *(int *)(iVar8 + 4);
          *(undefined4 *)(unaff_EBP + 0x20) = *(undefined4 *)(iVar8 + 8);
        }
        if (*(int *)(unaff_EBP + 0x18) == 0) {
          return 0;
        }
        uVar6 = *(uint *)(*(int *)(unaff_EBP + 0x18) + 0x18);
        if (*(uint *)(unaff_EBP + 0x20) < uVar6) {
          FUN_10067c3e(*(undefined4 *)(unaff_EBP + 8),*(undefined4 *)(unaff_EBP + 0x10),0x7d5,
                       "constant register address out of bounds on constant \'%s\', size %d, offset %d"
                      );
          return -0x7fffbffb;
        }
        *piVar9 = *piVar9 + uVar6;
        return 0;
      }
      if ((*(int *)(in_ECX + 0xb0) == 0) || (sVar2 != 0x5f6f)) {
        pcVar10 = 
        "\'%s\' is not a valid register name.  Registers must start with v_, r_, c_, b_, or i_ depending on the register type. (o_ for vs_3_0 only)"
        ;
      }
      else {
        *puVar4 = 6;
        iVar7 = FUN_10068bc6(unaff_EBX);
        if (iVar7 == 0) {
          iVar7 = FUN_10068883(unaff_EBX + 1,unaff_EBP + 0x1f,unaff_EBP + 0x17);
          if (iVar7 < 0) {
            pcVar10 = "Invalid output register \'%s\' specified";
            goto LAB_1006a953;
          }
          piVar9 = (int *)(in_ECX + 0xa0);
          **(int **)(unaff_EBP + 0x24) = *piVar9;
          FUN_1006a777(unaff_EBX,*piVar9,1);
          *piVar9 = *piVar9 + 1;
        }
        else {
          **(undefined4 **)(unaff_EBP + 0x24) = *(undefined4 *)(iVar7 + 4);
        }
        if (*(int *)(unaff_EBP + 0x18) == 0) {
          return 0;
        }
        pcVar10 = "addressing operations are not allowed on output registers \'%s\'";
      }
    }
    goto LAB_1006a953;
  }
  if ((*(int *)(in_ECX + 0xb4) < 10) || (0xc < *(int *)(in_ECX + 0xb4))) {
    *puVar4 = 1;
    iVar7 = FUN_10068bc6(unaff_EBX);
    if (iVar7 == 0) {
      iVar7 = FUN_10068883(unaff_EBX + 1,unaff_EBP + 0x1f,unaff_EBP + 0x17);
      if (iVar7 < 0) goto LAB_1006a94d;
      piVar9 = (int *)(in_ECX + 0x9c);
      **(int **)(unaff_EBP + 0x24) = *piVar9;
      FUN_1006a777(unaff_EBX,*piVar9,1);
      *piVar9 = *piVar9 + 1;
    }
    else {
      **(undefined4 **)(unaff_EBP + 0x24) = *(undefined4 *)(iVar7 + 4);
    }
    if (*(int *)(unaff_EBP + 0x18) == 0) {
      return 0;
    }
    pcVar10 = "addressing operations are not allowed on input registers \'%s\'";
  }
  else {
    iVar7 = FUN_10068883(unaff_EBX + 1,unaff_EBP + 0x1b,unaff_EBP + 0x17);
    if (-1 < iVar7) {
      if (*(char *)(unaff_EBP + 0x1b) == '\x05') {
        *puVar4 = 3;
      }
      else {
        if (*(char *)(unaff_EBP + 0x1b) != '\n') {
          pcVar10 = "Invalid pixel shader input register \'%s\' specified";
          goto LAB_1006a953;
        }
        *puVar4 = 1;
      }
      **(uint **)(unaff_EBP + 0x24) = (uint)*(byte *)(unaff_EBP + 0x17);
      return 0;
    }
LAB_1006a94d:
    pcVar10 = "Invalid input register \'%s\' specified";
  }
LAB_1006a953:
  FUN_10067c3e(*(undefined4 *)(unaff_EBP + 8),*(undefined4 *)(unaff_EBP + 0x10),0x7d5,pcVar10);
  return -0x7fffbffb;
}


