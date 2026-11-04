// 10032400 size=144 FUN_10032400

void FUN_10032400(undefined4 param_1,undefined4 param_2,undefined4 param_3,float param_4,
                 undefined4 param_5,float param_6,float param_7)

{
  int iVar1;
  
  iVar1 = (*(code *)RI_Milliseconds)();
  if (((int)(iVar1 + (iVar1 >> 0x1f & 0xffU)) >> 8 & 1U) == 0) {
    iVar1 = FUN_1000bc70(param_5);
    FUN_1002e850(param_3,(float)(int)*(char *)(iVar1 + 3) * param_7 + param_4,
                 (float)*(byte *)(iVar1 + 5) * param_6,(float)*(byte *)(iVar1 + 6) * param_7,
                 *(undefined4 *)(iVar1 + 8),*(undefined4 *)(iVar1 + 0xc),
                 *(undefined4 *)(iVar1 + 0x10),*(undefined4 *)(iVar1 + 0x14));
  }
  return;
}


