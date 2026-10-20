
undefined4 FUN_00455e20(void)

{
  int *piVar1;
  int iVar2;
  char cVar3;
  int in_EAX;
  int *piVar4;
  int *piVar5;
  int local_c;
  int local_8;
  
  iVar2 = *(int *)(in_EAX + 0x38);
  local_8 = 0;
  if (0 < iVar2) {
    piVar1 = (int *)(*(int *)(in_EAX + 0x3c) + 0xa0);
    piVar4 = piVar1;
    do {
      if ((*piVar4 != 0) && (local_c = 0, piVar5 = piVar1, 0 < iVar2)) {
        do {
          if ((local_8 != local_c) &&
             ((*piVar5 != 0 &&
              (cVar3 = FUN_004481e0(piVar4 + -8,(float)*(double *)(piVar4 + -4),
                                    (float)*(double *)(piVar5 + -4)), cVar3 != '\0')))) {
            return 0;
          }
          local_c = local_c + 1;
          piVar5 = piVar5 + 0x2a;
        } while (local_c < iVar2);
      }
      local_8 = local_8 + 1;
      piVar4 = piVar4 + 0x2a;
    } while (local_8 < iVar2);
  }
  return 1;
}

