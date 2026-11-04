// 100c5264 size=564 FUN_100c5264

uint FUN_100c5264(ushort *param_1,int param_2)

{
  short *psVar1;
  short sVar2;
  undefined4 uVar3;
  short *psVar4;
  int iVar5;
  uint uVar6;
  int *in_ECX;
  undefined1 local_20c [512];
  int local_c;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(param_1 + 0x34) == 0) {
    *(byte *)((int)param_1 + 3) = *(byte *)((int)param_1 + 3) | 0x40;
    uVar3 = (**(code **)(*in_ECX + 0x50))(0,0);
    *(undefined4 *)(param_1 + 0x36) = uVar3;
    return 0;
  }
  local_c = *(int *)(in_ECX[4] + *(int *)(param_1 + 2) * 4);
  psVar1 = *(short **)(*(int *)(param_1 + 0x34) + 0x18);
  if (in_ECX[0x56] != 0) {
    psVar4 = psVar1;
    do {
      sVar2 = *psVar4;
      psVar4 = (short *)((int)psVar4 + 1);
    } while ((char)sVar2 != '\0');
    if ((2 < (uint)((int)psVar4 - (int)((int)psVar1 + 1))) && (*psVar1 == 0x5f72)) {
      uVar6 = *(uint *)(param_1 + 0x38);
      if (4 < uVar6) {
        FUN_1008b0b5();
      }
      local_8 = (uint)(4 < uVar6);
      iVar5 = FUN_10068bc6(psVar1);
      if (iVar5 == 0) {
        uVar6 = FUN_1006a777(psVar1,in_ECX[0x74],1);
        if ((int)uVar6 < 0) {
          return uVar6;
        }
        iVar5 = in_ECX[0x74];
        in_ECX[0x74] = iVar5 + 1;
      }
      else {
        iVar5 = *(int *)(iVar5 + 4);
      }
      uVar3 = (**(code **)(*in_ECX + 0x50))(0xffff,iVar5);
      *(undefined4 *)(param_1 + 0x36) = uVar3;
      goto LAB_100c5350;
    }
  }
  if (((*(int *)(param_1 + 0x36) == -1) || ((*(byte *)((int)param_1 + 3) & 0x40) == 0)) ||
     (param_2 != 0)) {
    uVar6 = *(uint *)(local_c + 4);
    if ((*(byte *)(in_ECX + 0x1c) & 0x40) == 0) {
      if (((uVar6 & 0x10) != 0) && ((uVar6 & 0x200) == 0)) {
        uVar6 = FUN_100ba898(param_1,in_ECX[0x3d],1,&local_8);
        if ((int)uVar6 < 0) {
          return uVar6;
        }
        if ((in_ECX[10] == 2) &&
           (iVar5 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x36)), iVar5 == 0xb)) {
          *param_1 = *param_1 | 0x114;
          param_1[0x10] = 0;
          param_1[0x11] = 0;
          param_1[0x12] = 0;
          param_1[0x13] = 0;
          param_1[0x14] = 0;
          param_1[0x15] = 0;
          param_1[0x16] = 0;
          param_1[0x17] = 0x3ff0;
        }
        goto LAB_100c5350;
      }
      if ((uVar6 & 0x20) == 0) goto LAB_100c5350;
      uVar3 = 1;
      iVar5 = in_ECX[0x3e];
    }
    else {
      if (((uVar6 & 0x10) != 0) && ((uVar6 & 0x200) == 0)) {
        uVar6 = FUN_100ba898(param_1,in_ECX[0x3c],2,&local_8);
        if ((int)uVar6 < 0) {
          return uVar6;
        }
        if ((*(int *)(param_1 + 0x36) != 10) || (*(int *)(param_1 + 8) != 0)) goto LAB_100c5350;
        FUN_100862e1(param_1);
        goto LAB_100c5398;
      }
      if ((uVar6 & 0x20) == 0) goto LAB_100c5350;
      uVar3 = 2;
      iVar5 = in_ECX[0x3d];
    }
    uVar6 = FUN_100ba898(param_1,iVar5,uVar3,&local_8);
    if ((int)uVar6 < 0) {
      return uVar6;
    }
  }
  else {
    FUN_10086472(param_1,local_20c,0x200);
LAB_100c5398:
    FUN_1008b0b5();
    local_8 = 1;
  }
LAB_100c5350:
  return -(uint)(local_8 != 0) & 0x80004005;
}


