// 1006709e size=838 FUN_1006709e

uint FUN_1006709e(int *param_1)

{
  uint uVar1;
  int in_ECX;
  int iVar2;
  int iVar3;
  int *piVar4;
  char *pcVar5;
  int *piVar6;
  char *pcVar7;
  bool bVar8;
  int local_c;
  int local_8;
  
  local_c = in_ECX;
  local_8 = in_ECX;
LAB_10067304:
  do {
    if (*(int *)(in_ECX + 0x48) != 0) {
      uVar1 = 0x80004005;
LAB_10067317:
      param_1[4] = *(int *)(*(int *)(in_ECX + 0x26c) + 0x18);
      param_1[5] = *(int *)(*(int *)(in_ECX + 0x26c) + 0x1c);
      *param_1 = 0xd;
      return uVar1;
    }
    if ((*(int *)(in_ECX + 0x68) != 0) && (*(int *)(*(int *)(in_ECX + 0x68) + 8) == 0)) {
      uVar1 = 0;
      goto LAB_10067317;
    }
    iVar3 = *(int *)(in_ECX + 100);
    if (iVar3 == 0) {
      uVar1 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),param_1);
      if ((int)uVar1 < 0) {
        return uVar1;
      }
    }
    else {
      piVar4 = (int *)(iVar3 + 0x10);
      piVar6 = param_1;
      for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
        *piVar6 = *piVar4;
        piVar4 = piVar4 + 1;
        piVar6 = piVar6 + 1;
      }
      *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(*(int *)(in_ECX + 100) + 0xc);
      *(undefined4 *)(iVar3 + 0xc) = 0;
      param_1[4] = *(int *)(*(int *)(in_ECX + 0x26c) + 0x18);
      param_1[5] = *(int *)(*(int *)(in_ECX + 0x26c) + 0x1c);
      *(undefined4 *)(in_ECX + 0x40) = 0;
    }
    if (*param_1 != 1) {
LAB_10067259:
      if (*param_1 == 0xd) {
        if (*(int *)(*(int *)(in_ECX + 0x268) + 0x38) != 0) {
          FUN_10067c3e(in_ECX + 0x18,param_1,0x5de,"unexpected end of file");
        }
        iVar3 = *(int *)(in_ECX + 0x268);
        if (*(int *)(iVar3 + 0x6c) == 0) {
          return 0;
        }
        *(undefined4 *)(in_ECX + 0x268) = *(undefined4 *)(iVar3 + 0x6c);
        *(undefined4 *)(iVar3 + 0x6c) = 0;
        FUN_10063b25(1);
        *(undefined4 *)(in_ECX + 0x26c) = *(undefined4 *)(in_ECX + 0x268);
        *param_1 = 0xc;
        *(undefined4 *)(in_ECX + 0x40) = 1;
        return 0;
      }
      if (((*param_1 != 9) || (iVar3 = FUN_10064fd0(param_1[2],&local_c,&local_8), iVar3 == 0)) ||
         (iVar3 = FUN_1006541e(param_1,local_c,local_8), iVar3 == 0)) {
        if (*param_1 == 9) {
          iVar3 = 9;
          bVar8 = true;
          pcVar5 = (char *)param_1[2];
          pcVar7 = "__FILE__";
          do {
            if (iVar3 == 0) break;
            iVar3 = iVar3 + -1;
            bVar8 = *pcVar5 == *pcVar7;
            pcVar5 = pcVar5 + 1;
            pcVar7 = pcVar7 + 1;
          } while (bVar8);
          if (bVar8) {
            *param_1 = 10;
            iVar3 = *(int *)(*(int *)(in_ECX + 0x26c) + 0x18);
            param_1[2] = iVar3;
            if (iVar3 == 0) {
              param_1[2] = (int)&DAT_1019166e;
            }
          }
          else {
            iVar3 = 9;
            bVar8 = true;
            pcVar5 = (char *)param_1[2];
            pcVar7 = "__LINE__";
            do {
              if (iVar3 == 0) break;
              iVar3 = iVar3 + -1;
              bVar8 = *pcVar5 == *pcVar7;
              pcVar5 = pcVar5 + 1;
              pcVar7 = pcVar7 + 1;
            } while (bVar8);
            if (bVar8) {
              *param_1 = 2;
              param_1[2] = *(int *)(*(int *)(in_ECX + 0x26c) + 0x1c);
            }
          }
        }
        *(uint *)(in_ECX + 0x40) = (uint)(*param_1 == 0xc);
        if (*(int *)(in_ECX + 0x50) != 0) {
          iVar3 = *(int *)(in_ECX + 0x68);
          if ((iVar3 != 0) && (*(int *)(iVar3 + 4) != 0)) {
            if ((*param_1 == 1) && (*(char *)((int)param_1 + 9) == '\0')) {
              if ((char)param_1[2] == '{') {
                *(int *)(iVar3 + 8) = *(int *)(iVar3 + 8) + 1;
              }
              if (((char)param_1[2] == '}') && (*(int *)(*(int *)(in_ECX + 0x68) + 8) != 0)) {
                piVar4 = (int *)(*(int *)(in_ECX + 0x68) + 8);
                *piVar4 = *piVar4 + -1;
              }
            }
            if (*(int *)(*(int *)(in_ECX + 0x68) + 8) == 0) {
              *param_1 = 0xd;
            }
          }
          return 0;
        }
      }
      goto LAB_10067304;
    }
    iVar3 = 2;
    bVar8 = true;
    pcVar5 = "#";
    piVar4 = param_1 + 2;
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar8 = *pcVar5 == (char)*piVar4;
      pcVar5 = pcVar5 + 1;
      piVar4 = (int *)((int)piVar4 + 1);
    } while (bVar8);
    if ((!bVar8) || (*(int *)(in_ECX + 0x40) == 0)) goto LAB_10067259;
    DAT_101abd78 = in_ECX;
    *(undefined4 *)(in_ECX + 0x40) = 0;
    *(undefined4 *)(in_ECX + 0x44) = 0;
    *(undefined4 *)(in_ECX + 0x4c) = 1;
    *(undefined4 *)(in_ECX + 0x54) = *(undefined4 *)(in_ECX + 0x50);
    iVar3 = FUN_10066a19();
    if (iVar3 != 0) {
      *(undefined4 *)(in_ECX + 0x44) = 1;
    }
    *(undefined4 *)(in_ECX + 0x5c) = 0;
    if ((*(int *)(in_ECX + 0x40) == 0) && (*(int *)(in_ECX + 0x44) == 0)) {
      uVar1 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),(int *)(in_ECX + 0x278));
      if ((int)uVar1 < 0) {
        return uVar1;
      }
      iVar3 = *(int *)(in_ECX + 0x278);
      if ((iVar3 == 0xc) || (iVar3 == 0xd)) {
        *(undefined4 *)(in_ECX + 0x40) = 1;
      }
      else {
        if (*(int *)(in_ECX + 0x50) != 0) {
          FUN_10067c3e(in_ECX + 0x18,param_1,0x5dd,
                       "unexpected tokens following preprocessor directive");
        }
        *(undefined4 *)(in_ECX + 0x44) = 1;
      }
    }
    if (*(int *)(in_ECX + 0x40) == 0) {
      FUN_10067789();
      *(undefined4 *)(in_ECX + 100) = 0;
      uVar1 = FUN_100686c0(*(undefined4 *)(in_ECX + 0x298),in_ECX + 0x278);
      if ((int)uVar1 < 0) {
        return uVar1;
      }
      *(undefined4 *)(in_ECX + 0x40) = 1;
    }
    *(undefined4 *)(in_ECX + 0x26c) = *(undefined4 *)(in_ECX + 0x268);
    *(int *)(in_ECX + 0x50) = *(int *)(in_ECX + 0x54);
    if (*(int *)(in_ECX + 0x54) != 0) {
      piVar4 = (int *)(in_ECX + 0x278);
      piVar6 = param_1;
      for (iVar3 = 8; iVar3 != 0; iVar3 = iVar3 + -1) {
        *piVar6 = *piVar4;
        piVar4 = piVar4 + 1;
        piVar6 = piVar6 + 1;
      }
      if (*(int *)(*(int *)(in_ECX + 0x268) + 0x6c) != 0) {
        *param_1 = 0xc;
      }
      return -(uint)(*(int *)(in_ECX + 0x48) != 0) & 0x80004005;
    }
  } while( true );
}


