// 100394a0 size=326 FUN_100394a0

void FUN_100394a0(undefined2 *param_1)

{
  byte bVar1;
  ushort uVar2;
  int in_EAX;
  int iVar3;
  int *piVar4;
  uint local_14;
  int *local_10;
  undefined4 local_c;
  int local_4;
  
  local_4 = in_EAX;
  if (0 < in_EAX) {
    do {
      switch(*param_1) {
      case 0:
        FUN_10039270(param_1[1],*(undefined4 *)(param_1 + 2),1);
        break;
      case 1:
        uVar2 = param_1[2];
        if (uVar2 < 0xbb) {
          bVar1 = *(byte *)((int)param_1 + 7);
          local_10 = &DAT_1072da00 + (uVar2 - 0x80) * 4;
        }
        else {
          local_10 = (int *)FUN_10038cf0((uint)uVar2,*(undefined1 *)(param_1 + 3),
                                         *(undefined1 *)((int)param_1 + 7));
          bVar1 = *(byte *)((int)param_1 + 7);
        }
        local_14 = (uint)bVar1;
        FUN_10039270(param_1[1],local_10,local_14);
        break;
      case 2:
        iVar3 = 0;
        if (*(ushort *)(DAT_1072d9bc + 0x36) != 0) {
          piVar4 = *(int **)(DAT_1072d9bc + 0x40);
          do {
            if (*(int *)(param_1 + 2) == *piVar4) {
              local_10 = piVar4 + 1;
              local_14 = 1;
              break;
            }
            iVar3 = iVar3 + 1;
            piVar4 = piVar4 + 5;
          } while (iVar3 < (int)(uint)*(ushort *)(DAT_1072d9bc + 0x36));
        }
        FUN_10039270(param_1[1],local_10,local_14);
        break;
      case 3:
        FUN_100389a0();
        goto LAB_100395c3;
      case 4:
        FUN_10038c00();
LAB_100395c3:
        FUN_1003d950(local_c);
      }
      param_1 = param_1 + 4;
      local_4 = local_4 + -1;
    } while (local_4 != 0);
  }
  return;
}


