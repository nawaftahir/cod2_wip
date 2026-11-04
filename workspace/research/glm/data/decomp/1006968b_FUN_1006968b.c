// 1006968b size=181 FUN_1006968b

uint FUN_1006968b(int param_1)

{
  char *pcVar1;
  uint uVar2;
  char cVar3;
  undefined4 *in_ECX;
  undefined4 *puVar4;
  char *pcVar5;
  undefined4 *local_8;
  
  pcVar1 = *(char **)(param_1 + 8);
  uVar2 = 0;
  if ((pcVar1 == (char *)0x0) || (cVar3 = *pcVar1, pcVar5 = pcVar1, local_8 = in_ECX, cVar3 == '\0')
     ) {
    uVar2 = 0xf0000;
  }
  else {
    do {
      if (cVar3 < 'x') {
        if ((cVar3 == 'w') || (cVar3 == 'a')) {
          puVar4 = (undefined4 *)0x3;
          uVar2 = uVar2 | 0x80000;
        }
        else {
          if (cVar3 != 'b') {
            if (cVar3 == 'g') goto LAB_10069708;
            if (cVar3 != 'r') goto LAB_10069712;
            goto LAB_100696cd;
          }
LAB_100696fe:
          puVar4 = (undefined4 *)0x2;
          uVar2 = uVar2 | 0x40000;
        }
      }
      else if (cVar3 == 'x') {
LAB_100696cd:
        puVar4 = (undefined4 *)0x0;
        uVar2 = uVar2 | 0x10000;
      }
      else {
        if (cVar3 != 'y') {
          if (cVar3 != 'z') goto LAB_10069712;
          goto LAB_100696fe;
        }
LAB_10069708:
        puVar4 = (undefined4 *)0x1;
        uVar2 = uVar2 | 0x20000;
      }
      if ((pcVar5 != pcVar1) && (puVar4 <= local_8)) {
LAB_10069712:
        FUN_10067c3e(*in_ECX,param_1,0x7d3,"invalid mask \'%s\'",pcVar1);
        in_ECX[0x13] = 1;
        return 0;
      }
      cVar3 = pcVar5[1];
      pcVar5 = pcVar5 + 1;
      local_8 = puVar4;
    } while (cVar3 != '\0');
  }
  return uVar2;
}


