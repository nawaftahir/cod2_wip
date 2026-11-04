// 100393b0 size=226 FUN_100393b0

void FUN_100393b0(void)

{
  ushort uVar1;
  int *in_EAX;
  int iVar2;
  int *piVar3;
  short *in_ECX;
  int *piVar4;
  short sVar5;
  int *piVar6;
  int *piVar7;
  int *local_4;
  
  piVar3 = in_EAX;
  local_4 = in_EAX;
  if (0 < (int)in_EAX) {
    do {
      sVar5 = *in_ECX;
      if (sVar5 == 0) {
        piVar6 = *(int **)(in_ECX + 2);
        piVar7 = (int *)0x1;
LAB_10039470:
        sVar5 = in_ECX[1];
LAB_10039475:
        FUN_10039130(sVar5,piVar6,piVar7);
      }
      else {
        if (sVar5 == 1) {
          uVar1 = in_ECX[2];
          if (uVar1 < 0xbb) {
            in_EAX = (int *)(uint)*(byte *)((int)in_ECX + 7);
            sVar5 = in_ECX[1];
            piVar3 = &DAT_1072da00 + (uVar1 - 0x80) * 4;
            piVar6 = piVar3;
            piVar7 = in_EAX;
          }
          else {
            piVar3 = (int *)FUN_10038cf0(uVar1,(char)in_ECX[3],*(undefined1 *)((int)in_ECX + 7));
            in_EAX = (int *)(uint)*(byte *)((int)in_ECX + 7);
            sVar5 = in_ECX[1];
            piVar6 = piVar3;
            piVar7 = in_EAX;
          }
          goto LAB_10039475;
        }
        if (sVar5 == 2) {
          iVar2 = 0;
          piVar6 = piVar3;
          piVar7 = in_EAX;
          if (*(ushort *)(DAT_1072d9bc + 0x36) != 0) {
            piVar4 = *(int **)(DAT_1072d9bc + 0x40);
            do {
              if (*(int *)(in_ECX + 2) == *piVar4) {
                piVar3 = piVar4 + 1;
                in_EAX = (int *)0x1;
                piVar6 = piVar3;
                piVar7 = in_EAX;
                break;
              }
              iVar2 = iVar2 + 1;
              piVar4 = piVar4 + 5;
            } while (iVar2 < (int)(uint)*(ushort *)(DAT_1072d9bc + 0x36));
          }
          goto LAB_10039470;
        }
      }
      in_ECX = in_ECX + 4;
      local_4 = (int *)((int)local_4 + -1);
    } while (local_4 != (int *)0x0);
  }
  return;
}


