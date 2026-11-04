// 10069740 size=188 FUN_10069740

uint FUN_10069740(int param_1)

{
  uint uVar1;
  char cVar2;
  char *pcVar3;
  char *pcVar4;
  undefined4 *in_ECX;
  int iVar5;
  uint local_c;
  uint local_8;
  
  pcVar3 = *(char **)(param_1 + 8);
  iVar5 = 0;
  local_c = 0;
  if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
    local_c = 0xe40000;
  }
  else {
    local_8 = 0x10;
    pcVar4 = pcVar3;
    do {
      cVar2 = *pcVar4;
      if (cVar2 != '\0') {
        if (cVar2 < 'x') {
          if ((cVar2 == 'w') || (cVar2 == 'a')) {
            iVar5 = 3;
          }
          else {
            if (cVar2 != 'b') {
              if (cVar2 == 'g') goto LAB_100697e6;
              if (cVar2 == 'r') goto LAB_10069793;
              goto LAB_100697af;
            }
LAB_100697e2:
            iVar5 = 2;
          }
        }
        else if (cVar2 == 'x') {
LAB_10069793:
          iVar5 = 0;
        }
        else {
          if (cVar2 != 'y') {
            if (cVar2 == 'z') goto LAB_100697e2;
            goto LAB_100697af;
          }
LAB_100697e6:
          iVar5 = 1;
        }
        pcVar4 = pcVar4 + 1;
      }
      uVar1 = local_8 + 2;
      local_c = local_c | iVar5 << ((byte)local_8 & 0x1f);
      local_8 = uVar1;
    } while (uVar1 < 0x18);
    if (*pcVar4 != '\0') {
LAB_100697af:
      FUN_10067c3e(*in_ECX,param_1,0x7d4,"invalid swizzle \'%s\'",pcVar3);
      in_ECX[0x13] = 1;
      local_c = 0;
    }
  }
  return local_c;
}


