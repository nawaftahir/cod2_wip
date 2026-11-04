// 1008085f size=664 FUN_1008085f

int FUN_1008085f(int param_1,int param_2,int param_3,undefined4 param_4)

{
  short sVar1;
  int iVar2;
  void *pvVar3;
  int iVar4;
  uint uVar5;
  code *pcVar6;
  
  pcVar6 = (code *)0x0;
  uVar5 = *(uint *)(*(int *)(param_1 + 0x10) + 8) & 0xffff0000;
  if (*(short *)(param_3 + 10) == 0) {
    if (uVar5 == 0x54580000) {
      if (*(short *)(param_2 + 4) == 2) {
        sVar1 = *(short *)(param_3 + 2);
        if (sVar1 == 0) {
          pcVar6 = FUN_1007ddd9;
        }
        else if (sVar1 == 1) {
          pcVar6 = FUN_1007de16;
        }
        else if (sVar1 == 2) {
          pcVar6 = FUN_1007de7a;
        }
        else if (sVar1 == 3) {
          pcVar6 = FUN_1007ded0;
        }
      }
      goto LAB_10080aae;
    }
    if (uVar5 == 0xfffe0000) {
      sVar1 = *(short *)(param_2 + 4);
      if (sVar1 == 0) {
        sVar1 = *(short *)(param_3 + 2);
        if (sVar1 == 0) {
          pcVar6 = FUN_1007e354;
          goto LAB_10080aae;
        }
        if (sVar1 != 1) {
          if (sVar1 == 2) {
            pcVar6 = FUN_1007e390;
          }
          else if (sVar1 == 3) {
            pcVar6 = FUN_1007e3d1;
          }
          goto LAB_10080aae;
        }
        goto LAB_10080aa9;
      }
      if (sVar1 == 1) {
        sVar1 = *(short *)(param_3 + 2);
        if (sVar1 == 0) {
          pcVar6 = FUN_1007e423;
          goto LAB_10080aae;
        }
        if (sVar1 == 1) {
          pcVar6 = FUN_1007e441;
          goto LAB_10080aae;
        }
        if (sVar1 != 2) {
          if (sVar1 == 3) {
            pcVar6 = FUN_1007e4a3;
          }
          goto LAB_10080aae;
        }
        goto LAB_100809d6;
      }
      if (sVar1 != 2) goto LAB_10080aae;
      uVar5 = (uint)*(ushort *)(param_3 + 2);
      if (uVar5 == 0) {
        pcVar6 = FUN_1007e509;
        goto LAB_10080aae;
      }
      if (uVar5 == 1) {
        pcVar6 = FUN_1007e527;
        goto LAB_10080aae;
      }
      iVar2 = uVar5 - 2;
      if (iVar2 == 0) {
        pcVar6 = FUN_1007e571;
        goto LAB_10080aae;
      }
      goto LAB_10080988;
    }
    if (uVar5 != 0xffff0000) goto LAB_10080aae;
    sVar1 = *(short *)(param_2 + 4);
    if (sVar1 == 0) {
      sVar1 = *(short *)(param_3 + 2);
      if (sVar1 == 0) {
        pcVar6 = FUN_1007e5ca;
        goto LAB_10080aae;
      }
      if (sVar1 != 1) {
        if (sVar1 == 2) {
          pcVar6 = FUN_1007e606;
        }
        else if (sVar1 == 3) {
          pcVar6 = FUN_1007e647;
        }
        goto LAB_10080aae;
      }
      goto LAB_1008094d;
    }
    if (sVar1 == 1) {
      sVar1 = *(short *)(param_3 + 2);
      if (sVar1 == 0) {
        pcVar6 = FUN_1007dc32;
        goto LAB_10080aae;
      }
      if (sVar1 == 1) {
        pcVar6 = FUN_1007dc50;
        goto LAB_10080aae;
      }
      if (sVar1 != 2) {
        if (sVar1 == 3) {
          pcVar6 = FUN_1007dcb2;
        }
        goto LAB_10080aae;
      }
      goto LAB_10080a8b;
    }
    if (sVar1 != 2) goto LAB_10080aae;
    uVar5 = (uint)*(ushort *)(param_3 + 2);
    if (uVar5 == 0) {
      pcVar6 = FUN_1007dd18;
      goto LAB_10080aae;
    }
    if (uVar5 == 1) {
      pcVar6 = FUN_1007dd36;
      goto LAB_10080aae;
    }
    iVar2 = uVar5 - 2;
    if (iVar2 == 0) {
      pcVar6 = FUN_1007dd80;
      goto LAB_10080aae;
    }
  }
  else {
    if (uVar5 == 0xfffe0000) {
      if (*(ushort *)(param_2 + 4) == 0) {
LAB_10080aa9:
        pcVar6 = FUN_1007e372;
        goto LAB_10080aae;
      }
      iVar2 = *(ushort *)(param_2 + 4) - 1;
      if (iVar2 == 0) {
LAB_100809d6:
        pcVar6 = FUN_1007e485;
        goto LAB_10080aae;
      }
LAB_10080988:
      if (iVar2 == 1) {
        pcVar6 = FUN_1007e5ac;
      }
      goto LAB_10080aae;
    }
    if (uVar5 != 0xffff0000) goto LAB_10080aae;
    if (*(ushort *)(param_2 + 4) == 0) {
LAB_1008094d:
      pcVar6 = FUN_1007e5e8;
      goto LAB_10080aae;
    }
    iVar2 = *(ushort *)(param_2 + 4) - 1;
    if (iVar2 == 0) {
LAB_10080a8b:
      pcVar6 = FUN_1007dc94;
      goto LAB_10080aae;
    }
  }
  if (iVar2 == 1) {
    pcVar6 = FUN_1007ddbb;
  }
LAB_10080aae:
  pvVar3 = operator_new(0x44);
  if (pvVar3 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_1007d869(param_1,param_2,param_3,pcVar6,param_4);
  }
  if (iVar2 != 0) {
    iVar4 = FUN_10080af7();
    if (-1 < iVar4) {
      return iVar2;
    }
    FUN_1007e2e2(1);
  }
  return 0;
}


