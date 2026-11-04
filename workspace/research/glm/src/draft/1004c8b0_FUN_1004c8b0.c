


unsigned int FUN_1004c8b0(unsigned int *param_1,unsigned int param_2,int param_3,int param_4)

{
  int *piVar1;
  char cVar2;
  unsigned int uVar3;
  byte *pbVar4;
  int iVar5;
  
  piVar1 = (int *)param_1[4];
  pbVar4 = (byte *)*param_1;
  iVar5 = param_1[1];
  if (piVar1[0x61] == 0) {
    for (; param_3 < 0x19; param_3 = param_3 + 8) {
      if (iVar5 == 0) {
        cVar2 = (**(void **)(piVar1[8] + 0xc))(piVar1);
        if (cVar2 == '\0') {
          return 0;
        }
        pbVar4 = *(byte **)piVar1[8];
        iVar5 = ((unsigned int *)piVar1[8])[1];
      }
      uVar3 = (unsigned int)*pbVar4;
      iVar5 = iVar5 + -1;
      pbVar4 = pbVar4 + 1;
      if (uVar3 == 0xff) {
        do {
          if (iVar5 == 0) {
            cVar2 = (**(void **)(piVar1[8] + 0xc))(piVar1);
            if (cVar2 == '\0') {
              return 0;
            }
            pbVar4 = *(byte **)piVar1[8];
            iVar5 = ((unsigned int *)piVar1[8])[1];
          }
          uVar3 = (unsigned int)*pbVar4;
          iVar5 = iVar5 + -1;
          pbVar4 = pbVar4 + 1;
        } while (uVar3 == 0xff);
        if (uVar3 != 0) {
          piVar1[0x61] = uVar3;
          goto LAB_1004c961;
        }
        uVar3 = 0xff;
      }
      param_2 = param_2 << 8 | uVar3;
    }
  }
  else {
LAB_1004c961:
    if (param_3 < param_4) {
      if (*(char *)(piVar1[0x68] + 8) == '\0') {
        *(unsigned int *)(*piVar1 + 0x14) = 0x75;
        (**(void **)(*piVar1 + 4))(piVar1,0xffffffff);
        *(unsigned char *)(piVar1[0x68] + 8) = 1;
      }
      param_2 = param_2 << (0x19U - (char)param_3 & 0x1f);
      param_3 = 0x19;
    }
  }
  param_1[1] = iVar5;
  *param_1 = pbVar4;
  param_1[3] = param_3;
  param_1[2] = param_2;
  return 1;
}


