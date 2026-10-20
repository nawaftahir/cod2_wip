
void FUN_00454c80(int param_1,int param_2,int param_3)

{
  char cVar1;
  undefined4 *puVar2;
  int local_10;
  int local_c;
  
  FUN_00454ab0();
  cVar1 = FUN_00494360(param_1,param_1 + 0xc);
  if (cVar1 != '\0') {
    puVar2 = (undefined4 *)(param_2 + 8);
    local_c = param_1 + 0x38;
    local_10 = 0;
    do {
      if (*(char *)(local_10 + param_3) != '\0') {
        FUN_00494400(puVar2[-2],*puVar2,puVar2[2]);
        FUN_00494400(puVar2[-1],puVar2[1],puVar2[3]);
        FUN_0043fbc0(param_1 + 0x80,(float)*(double *)(param_1 + 0x90),local_c + -8,local_c,
                     local_c + 4);
      }
      local_10 = local_10 + 1;
      local_c = local_c + 0x1c;
      puVar2 = puVar2 + 6;
    } while (local_10 < 2);
  }
  return;
}

