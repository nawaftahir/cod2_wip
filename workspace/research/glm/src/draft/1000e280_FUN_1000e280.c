extern int FUN_1000e7a0();


void FUN_1000e280(unsigned int *param_1,unsigned int *param_2,void *param_3)

{
  unsigned int *puVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  
  if ((param_1 != param_2) && (puVar4 = param_1 + 1, puVar4 != param_2)) {
    puVar3 = param_1 + 2;
    do {
      iVar2 = (*param_3)(*puVar4,*param_1);
      puVar5 = param_1;
      if (iVar2 == 0) {
        iVar2 = (*param_3)(*puVar4,puVar3[-2]);
        puVar1 = puVar3 + -2;
        if (iVar2 != 0) {
          do {
            puVar5 = puVar1;
            iVar2 = (*param_3)(*puVar4,puVar5[-1]);
            puVar1 = puVar5 + -1;
          } while (iVar2 != 0);
          goto joined_r0x1000e2ee;
        }
      }
      else {
joined_r0x1000e2ee:
        if ((puVar5 != puVar4) && (puVar4 != puVar3)) {
          FUN_1000e7a0(puVar5);
        }
      }
      puVar4 = puVar4 + 1;
      puVar3 = puVar3 + 1;
    } while (puVar4 != param_2);
  }
  return;
}


