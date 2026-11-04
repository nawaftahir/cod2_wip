extern int FUN_100181b0();


void FUN_10017c90(unsigned int *param_1,unsigned int *param_2,void *param_3)

{
  unsigned int *puVar1;
  char cVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  
  if ((param_1 != param_2) && (puVar4 = param_1 + 1, puVar4 != param_2)) {
    puVar3 = param_1 + 2;
    do {
      cVar2 = (*param_3)(*puVar4,*param_1);
      puVar5 = param_1;
      if (cVar2 == '\0') {
        cVar2 = (*param_3)(*puVar4,puVar3[-2]);
        puVar1 = puVar3 + -2;
        if (cVar2 != '\0') {
          do {
            puVar5 = puVar1;
            cVar2 = (*param_3)(*puVar4,puVar5[-1]);
            puVar1 = puVar5 + -1;
          } while (cVar2 != '\0');
          goto joined_r0x10017cfe;
        }
      }
      else {
joined_r0x10017cfe:
        if ((puVar5 != puVar4) && (puVar4 != puVar3)) {
          FUN_100181b0(puVar5);
        }
      }
      puVar4 = puVar4 + 1;
      puVar3 = puVar3 + 1;
    } while (puVar4 != param_2);
  }
  return;
}


