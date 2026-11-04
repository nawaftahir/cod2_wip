extern int FUN_1000bc70();
extern int FUN_1002e850();


void FUN_10032400(unsigned int param_1,unsigned int param_2,unsigned int param_3,float param_4,
                 unsigned int param_5,float param_6,float param_7)

{
  int iVar1;
  
  iVar1 = (*(void *)RI_Milliseconds)();
  if (((int)(iVar1 + (iVar1 >> 0x1f & 0xffU)) >> 8 & 1U) == 0) {
    iVar1 = FUN_1000bc70(param_5);
    FUN_1002e850(param_3,(float)(int)*(char *)(iVar1 + 3) * param_7 + param_4,
                 (float)*(byte *)(iVar1 + 5) * param_6,(float)*(byte *)(iVar1 + 6) * param_7,
                 *(unsigned int *)(iVar1 + 8),*(unsigned int *)(iVar1 + 0xc),
                 *(unsigned int *)(iVar1 + 0x10),*(unsigned int *)(iVar1 + 0x14));
  }
  return;
}


