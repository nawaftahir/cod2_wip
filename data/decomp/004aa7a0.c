
void FUN_004aa7a0(void)

{
  char cVar1;
  undefined2 uVar2;
  int in_EAX;
  int iVar3;
  int *piVar4;
  int *piVar5;
  uint uVar6;
  int local_c;
  int local_8;
  
  iVar3 = FUN_004aa670();
  if (iVar3 == 0) {
    piVar5 = (int *)(in_EAX + 0x10);
    local_c = 4;
    do {
      if (*piVar5 != 0) {
        local_8 = 0;
        if (0 < (short)piVar5[-1]) {
          do {
            uVar2 = *(undefined2 *)(*piVar5 + local_8 * 2);
            piVar4 = (int *)FUN_004a87b0();
            uVar6 = *piVar4 - 1U & 0xff;
            cVar1 = *(char *)(uVar6 + 4 + (int)piVar4);
            while (cVar1 != '\0') {
              iVar3 = uVar6 + 0x104;
              uVar6 = uVar6 + 0x100;
              cVar1 = *(char *)((int)piVar4 + iVar3);
            }
            iVar3 = FUN_004a87b0();
            *(short *)(iVar3 + 2) = *(short *)(iVar3 + 2) + -1;
            if (*(short *)(iVar3 + 2) == 0) {
              FUN_004a9ba0(uVar2);
            }
            local_8 = local_8 + 1;
          } while (local_8 < (short)piVar5[-1]);
        }
        *piVar5 = 0;
      }
      piVar5 = piVar5 + 5;
      local_c = local_c + -1;
    } while (local_c != 0);
  }
  return;
}

