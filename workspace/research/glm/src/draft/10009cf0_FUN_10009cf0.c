extern unsigned int DAT_101ce5ec;
extern unsigned int DAT_101d7e9c;
extern unsigned int DAT_10678500;
extern int FUN_100092b0();
extern int FUN_100093a0();
extern int FUN_10009bc0();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10009cf0(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int local_1c08;
  int local_1000 [1023];
  unsigned int uStack_4;
  
  uStack_4 = 0x10009cfa;
  iVar1 = FUN_10009bc0(param_1);
  local_1c08 = 0;
  if (0 < iVar1) {
    do {
      iVar2 = local_1000[local_1c08];
      FUN_100092b0(iVar2);
      if (DAT_101ce5ec != '\0') {
        piVar3 = *(int **)(iVar2 + 0x2c);
        for (iVar2 = *(int *)(iVar2 + 0x28); iVar2 != 0; iVar2 = iVar2 + -1) {
          if (*(int *)(DAT_101d7e9c + *piVar3 * 4) != DAT_10678500) {
            FUN_100093a0();
          }
          piVar3 = piVar3 + 1;
        }
      }
      local_1c08 = local_1c08 + 1;
    } while (local_1c08 < iVar1);
  }
  return;
}


