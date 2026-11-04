// 10098c39 size=922 FUN_10098c39

int FUN_10098c39(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int in_ECX;
  undefined4 uVar6;
  undefined1 local_80 [100];
  int local_1c;
  int local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x88),3,0x20400);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x8c),6,0x401);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x90),10,0x4401);
  if (iVar4 < 0) {
    return iVar4;
  }
  uVar5 = *(uint *)(in_ECX + 200) & 0xffff0000;
  if (((uVar5 == 0x46580000) || (uVar5 == 0x54580000)) &&
     (iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x88),2,0x31028), iVar4 < 0)) {
    return iVar4;
  }
  if (((*(uint *)(in_ECX + 200) & 0xffff0000) != 0xfffe0000) &&
     (iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x80),0x10,0x200), iVar4 < 0)) {
    return iVar4;
  }
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x84),0x20,0x42000);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0xb4),0x2020,0x40000);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0xb8),0x40020,0x2000);
  if (iVar4 < 0) {
    return iVar4;
  }
  if (((*(uint *)(in_ECX + 200) & 0xffff0000) != 0xffff0000) &&
     (iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x94),0x80,0), iVar4 < 0)) {
    return iVar4;
  }
  if (*(int *)(in_ECX + 0x30) != 0) {
    iVar4 = FUN_1009298d(local_80,*(undefined4 *)(in_ECX + 0x8c),*(int *)(in_ECX + 0x30));
    if (iVar4 < 0) {
      return iVar4;
    }
    iVar4 = FUN_10093058(local_80,0);
    if (iVar4 < 0) {
      iVar4 = FUN_10089f75(*(undefined4 *)(in_ECX + 0x88),2,0x30028);
      if (iVar4 < 0) goto LAB_10098dbc;
    }
    else {
      FUN_10093058(local_80,1);
    }
    iVar4 = FUN_1008a66c(local_80);
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  iVar4 = FUN_1009298d(local_80,*(undefined4 *)(in_ECX + 0x88),*(undefined4 *)(in_ECX + 0x2c));
  if (((((-1 < iVar4) && (iVar4 = FUN_10093058(local_80,1), -1 < iVar4)) &&
       (iVar4 = FUN_1008a66c(local_80), -1 < iVar4)) &&
      ((iVar4 = FUN_1009298d(local_80,*(undefined4 *)(in_ECX + 0x90),*(undefined4 *)(in_ECX + 0x34))
       , -1 < iVar4 && (iVar4 = FUN_10093058(local_80,1), -1 < iVar4)))) &&
     (iVar4 = FUN_1008a66c(local_80), -1 < iVar4)) {
    if ((*(byte *)(in_ECX + 0xcc) & 4) == 0) {
      local_14 = 0;
      FUN_1008af0b();
      local_c = 0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        do {
          puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
          if ((*puVar1 & 0xfff00000) == 0x10000000) {
            local_10 = 0;
            local_8 = 0;
            if (puVar1[3] != 0) {
              do {
                local_1c = local_8 * 4;
                local_18 = *(int *)(puVar1[4] + local_1c);
                iVar4 = *(int *)(local_1c + puVar1[2]);
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + local_18 * 4);
                iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                if ((((*(int *)(iVar2 + 4) == *(int *)(iVar3 + 4)) &&
                     (*(int *)(iVar2 + 8) == *(int *)(iVar3 + 8))) &&
                    ((*(int *)(iVar2 + 0xc) == *(int *)(iVar3 + 0xc) &&
                     (((*(int *)(iVar2 + 0x10) == *(int *)(iVar3 + 0x10) &&
                       (*(int *)(iVar2 + 0x14) == *(int *)(iVar3 + 0x14))) &&
                      (*(int *)(iVar2 + 0x18) == *(int *)(iVar3 + 0x18))))))) &&
                   ((*(int *)(iVar2 + 0x3c) == 0 && (*(int *)(iVar3 + 0x3c) == 0)))) {
                  uVar6 = 0xffffffff;
                  if (iVar4 != -1) {
                    uVar6 = *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x30);
                  }
                  *(undefined4 *)(iVar2 + 0x30) = uVar6;
                }
                else {
                  *(int *)(puVar1[4] + local_10 * 4) = local_18;
                  *(undefined4 *)(puVar1[2] + local_10 * 4) = *(undefined4 *)(puVar1[2] + local_1c);
                  local_10 = local_10 + 1;
                }
                local_8 = local_8 + 1;
              } while (local_8 < puVar1[3]);
            }
            if (local_10 != puVar1[3]) {
              *puVar1 = -(uint)(local_10 != 0) & (local_10 & 0xfffff | 0x10000000);
              puVar1[1] = local_10;
              puVar1[3] = local_10;
              local_14 = 1;
            }
          }
          local_c = local_c + 1;
        } while (local_c < *(uint *)(in_ECX + 0xc));
        if (local_14 != 0) {
          iVar4 = FUN_1008af24();
          if (iVar4 < 0) {
            return iVar4;
          }
          iVar4 = FUN_1008d525();
          if (iVar4 < 0) {
            return iVar4;
          }
          iVar4 = FUN_10086eae();
          if (iVar4 < 0) {
            return iVar4;
          }
        }
      }
    }
    return 0;
  }
LAB_10098dbc:
  FUN_1008a66c(local_80);
  return iVar4;
}


