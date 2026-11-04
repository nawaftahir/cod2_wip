// 100a4f03 size=458 FUN_100a4f03

int FUN_100a4f03(void)

{
  uint *puVar1;
  uint uVar2;
  bool bVar3;
  int iVar4;
  int *in_ECX;
  uint uVar5;
  uint local_c;
  
  if (in_ECX[0x17] != 0) {
    bVar3 = false;
    in_ECX[0x3f] = 0;
    if (in_ECX[3] != 0) {
      do {
        puVar1 = *(uint **)(in_ECX[6] + in_ECX[0x3f] * 4);
        in_ECX[0x40] = (int)puVar1;
        if ((*puVar1 & 0xfff00000) == 0x20800000) {
          iVar4 = FUN_100bad10();
          if (iVar4 < 0) {
            return iVar4;
          }
          bVar3 = (bool)(bVar3 | iVar4 == 0);
        }
        in_ECX[0x3f] = in_ECX[0x3f] + 1;
      } while ((uint)in_ECX[0x3f] < (uint)in_ECX[3]);
      if (bVar3) {
        FUN_100ba843();
      }
    }
  }
  if (in_ECX[0xc] != 0) {
    local_c = 0;
    do {
      if (0xf < local_c) goto LAB_100a4fff;
      uVar2 = in_ECX[3];
      uVar5 = 0;
      bVar3 = true;
      if (uVar2 != 0) {
        do {
          in_ECX[0x40] = *(int *)(in_ECX[6] + uVar5 * 4);
          iVar4 = FUN_100bb1c6();
          if (iVar4 < 0) {
            return iVar4;
          }
          if (iVar4 == 0) {
            bVar3 = false;
          }
          iVar4 = FUN_10086292(in_ECX[0x40]);
          if (iVar4 < 0) {
            return iVar4;
          }
          *(undefined4 *)in_ECX[0x40] = 0;
          uVar5 = uVar5 + 1;
        } while (uVar5 < uVar2);
      }
      iVar4 = FUN_10086eae();
      if (iVar4 < 0) {
        return iVar4;
      }
      local_c = local_c + 1;
    } while (!bVar3);
    if (0xf < local_c) {
LAB_100a4fff:
      uVar2 = in_ECX[3];
      uVar5 = 0;
      bVar3 = true;
      if (uVar2 != 0) {
        do {
          in_ECX[0x40] = *(int *)(in_ECX[6] + uVar5 * 4);
          iVar4 = FUN_100bb1c6();
          if (iVar4 < 0) {
            return iVar4;
          }
          if (iVar4 == 0) {
            FUN_1008b0b5();
            bVar3 = false;
          }
          iVar4 = FUN_10086292(in_ECX[0x40]);
          if (iVar4 < 0) {
            return iVar4;
          }
          *(undefined4 *)in_ECX[0x40] = 0;
          uVar5 = uVar5 + 1;
        } while (uVar5 < uVar2);
      }
      iVar4 = FUN_10086eae();
      if (iVar4 < 0) {
        return iVar4;
      }
      if (!bVar3) {
        return -0x7fffbffb;
      }
    }
  }
  if (((*(byte *)(in_ECX + 0x1c) & 0x40) == 0) &&
     (iVar4 = (**(code **)(*in_ECX + 0x98))(), iVar4 < 0)) {
    return iVar4;
  }
  if (in_ECX[0x18] != 0) {
    iVar4 = FUN_100c7816();
    if (iVar4 < 0) {
      return iVar4;
    }
    FUN_100ba843();
    iVar4 = FUN_1008d525();
    if (iVar4 < 0) {
      return iVar4;
    }
    iVar4 = FUN_100c2e40();
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  return 0;
}


