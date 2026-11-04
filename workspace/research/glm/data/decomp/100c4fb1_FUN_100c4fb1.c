// 100c4fb1 size=338 FUN_100c4fb1

undefined4 FUN_100c4fb1(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int in_ECX;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  undefined1 local_1c [4];
  uint local_18;
  int local_10;
  char *local_c;
  char *local_8;
  
  local_8 = (char *)0x0;
  local_c = (char *)0x0;
  if (*(int *)(in_ECX + 0x158) == 0) {
    return 0;
  }
  iVar2 = *(int *)(param_1 + 0x30);
  pcVar6 = (char *)0x0;
  local_10 = in_ECX;
  if (iVar2 != 0) {
    do {
      iVar1 = *(int *)(iVar2 + 8);
      pcVar7 = pcVar6;
      if (*(int *)(iVar1 + 4) == 0x11) {
        iVar4 = 0;
        if (*(int *)(iVar1 + 0x10) != 0) {
          iVar4 = *(int *)(*(int *)(iVar1 + 0x10) + 0x18);
        }
        if (*(int *)(iVar1 + 0x14) == 0) {
          pcVar5 = (char *)0x0;
        }
        else {
          pcVar5 = *(char **)(*(int *)(iVar1 + 0x14) + 0x18);
        }
        if (iVar4 == 0) {
          if ((pcVar5 != (char *)0x0) && (iVar1 = _tolower((int)*pcVar5), iVar1 == 99)) {
            local_c = pcVar5;
          }
        }
        else if (((((pcVar5 != (char *)0x0) && (iVar1 = FUN_10063776(iVar4,0,local_1c), -1 < iVar1))
                  && (iVar1 = _tolower((int)*pcVar5), iVar1 == 99)) &&
                 ((pcVar7 = pcVar5, *(uint *)(local_10 + 200) != local_18 &&
                  (pcVar7 = pcVar6, ((*(uint *)(local_10 + 200) ^ local_18) & 0xffff0000) == 0))))
                && ((short)local_18 == 0)) {
          local_8 = pcVar5;
        }
      }
      iVar2 = *(int *)(iVar2 + 0xc);
      pcVar6 = pcVar7;
    } while (iVar2 != 0);
    if (pcVar7 != (char *)0x0) goto LAB_100c5088;
  }
  pcVar7 = local_8;
  if ((local_8 == (char *)0x0) && (pcVar7 = local_c, local_c == (char *)0x0)) {
    return 0;
  }
LAB_100c5088:
  iVar2 = _tolower((int)*pcVar7);
  if (iVar2 == 99) {
    iVar2 = _isdigit((int)pcVar7[1]);
    if (iVar2 != 0) {
      pcVar6 = pcVar7 + 2;
      while (iVar2 = _isdigit((int)*pcVar6), iVar2 != 0) {
        pcVar6 = pcVar6 + 1;
      }
      if (*pcVar6 == '\0') {
        uVar3 = _atol(pcVar7 + 1);
        if (0x1fff < uVar3) {
          FUN_1008b0b5(local_10,0,0,
                       "Constant variable \'%s\' bound to register greater than 8191 (%d requested)"
                       ,pcVar7 + 2,uVar3);
          return 0x80004005;
        }
        *(ushort *)(param_2 + 10) = *(ushort *)(param_2 + 10) | (ushort)(uVar3 << 2) | 2;
      }
    }
  }
  return 0;
}


