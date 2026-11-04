extern int FUN_1006506e();
extern int FUN_100826bd();
extern int FUN_10082a7b();


int FUN_1009a904(int param_1,int param_2)

{
  char cVar1;
  unsigned int uVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  char local_18 [15];
  unsigned char local_9;
  
  iVar4 = param_1;
  if ((((param_1 != 0) && (*(int *)(param_1 + 4) == 3)) && (*(int *)(param_1 + 0x10) == 2)) &&
     (((param_2 != 0 && (*(int *)(param_2 + 4) == 3)) && (*(int *)(param_2 + 0x10) == 9)))) {
    iVar5 = FUN_1006506e(0x30);
    if (iVar5 == 0) {
      param_1 = 0;
    }
    else {
      param_1 = FUN_10082a7b((int *)(param_2 + 0x10));
    }
    if (param_1 != 0) {
      uVar2 = *(unsigned int *)(iVar4 + 0x18);
      pcVar3 = *(char **)(param_2 + 0x18);
      __snprintf(local_18,0x10,"%u",uVar2);
      pcVar6 = local_18;
      local_9 = 0;
      do {
        cVar1 = *pcVar6;
        pcVar6 = pcVar6 + 1;
      } while (cVar1 != '\0');
      pcVar7 = pcVar3;
      do {
        cVar1 = *pcVar7;
        pcVar7 = pcVar7 + 1;
      } while (cVar1 != '\0');
      pcVar6 = pcVar6 + (int)(pcVar7 + ((1 - (int)(pcVar3 + 1)) - (int)(local_18 + 1)));
      pcVar7 = (char *)FUN_100826bd(pcVar6,1);
      if (pcVar7 != (char *)0x0) {
        __snprintf(pcVar7,(size_t)pcVar6,"%u%s",uVar2,pcVar3);
        pcVar7[(int)(pcVar6 + -1)] = '\0';
        *(char **)(param_1 + 0x18) = pcVar7;
        return param_1;
      }
    }
  }
  return 0;
}


