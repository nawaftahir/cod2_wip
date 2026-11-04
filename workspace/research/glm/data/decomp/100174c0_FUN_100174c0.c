// 100174c0 size=87 FUN_100174c0

void FUN_100174c0(void)

{
  int iVar1;
  int *piVar2;
  undefined *puVar3;
  int *piVar4;
  int local_4;
  
  piVar2 = &DAT_101d7fcc;
  local_4 = 0x20;
  do {
    if (*piVar2 != 0) {
      piVar4 = piVar2 + 2;
      puVar3 = &DAT_1018eac8;
      do {
        iVar1 = FUN_100165c0(*piVar2,piVar2[1],puVar3);
        *piVar4 = iVar1;
        puVar3 = puVar3 + 0x15;
        piVar4 = piVar4 + 1;
      } while ((int)puVar3 < 0x1018eb1c);
    }
    piVar2 = piVar2 + 6;
    local_4 = local_4 + -1;
  } while (local_4 != 0);
  return;
}


