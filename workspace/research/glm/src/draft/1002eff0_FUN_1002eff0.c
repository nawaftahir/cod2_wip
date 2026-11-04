extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9c0;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072debd;
extern int FUN_1002e380();
extern int FUN_1003a5f0();
extern int FUN_1003a8d0();
extern int FUN_100410b0();


void FUN_1002eff0(int *param_1)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int local_80 [15];
  unsigned int local_44;
  unsigned int local_40;
  unsigned int local_3c;
  unsigned int local_2c;
  unsigned int local_28;
  unsigned int local_1c;
  unsigned int local_18;
  unsigned int local_10;
  
  iVar1 = *param_1;
  if (DAT_1072debd != '\0') {
    FUN_1002e380();
  }
  if ((DAT_1072d9bc != *(int *)(iVar1 + 4)) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  local_3c = *(unsigned int *)(iVar1 + 0x14);
  puVar3 = local_80;
  for (iVar2 = 0x1d; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  local_44 = *(unsigned int *)(iVar1 + 0xc);
  local_40 = *(unsigned int *)(iVar1 + 0x10);
  local_2c = *(unsigned int *)(iVar1 + 4);
  local_1c = *(unsigned int *)(iVar1 + 0x18);
  local_80[1] = *(unsigned int *)(iVar1 + 0x20);
  local_10 = *(unsigned int *)(iVar1 + 0x1c);
  local_28 = *(unsigned int *)(iVar1 + 8);
  local_80[0] = 4;
  local_18 = local_1c;
  FUN_100410b0();
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


