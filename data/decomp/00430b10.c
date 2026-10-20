
void FUN_00430b10(void)

{
  int in_EAX;
  int *piVar1;
  int iVar2;
  int iVar3;
  int *unaff_EBX;
  int *piVar4;
  int *piVar5;
  int local_c;
  int *local_8;
  
  if (2 < *unaff_EBX) {
    iVar2 = *unaff_EBX + -1;
    *unaff_EBX = iVar2;
    if ((in_EAX != iVar2) && (in_EAX < iVar2)) {
      local_8 = unaff_EBX + in_EAX * 0xe0 + 9;
      local_c = in_EAX;
      do {
        iVar2 = 0;
        piVar1 = local_8;
        if (0 < unaff_EBX[1]) {
          do {
            piVar4 = piVar1 + 0xe0;
            piVar5 = piVar1;
            for (iVar3 = 0xe; iVar3 != 0; iVar3 = iVar3 + -1) {
              *piVar5 = *piVar4;
              piVar4 = piVar4 + 1;
              piVar5 = piVar5 + 1;
            }
            iVar2 = iVar2 + 1;
            piVar1 = piVar1 + 0xe;
          } while (iVar2 < unaff_EBX[1]);
        }
        local_c = local_c + 1;
        local_8 = local_8 + 0xe0;
      } while (local_c < *unaff_EBX);
    }
  }
  return;
}

