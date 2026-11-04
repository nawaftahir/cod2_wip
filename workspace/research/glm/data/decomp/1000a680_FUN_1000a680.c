// 1000a680 size=248 FUN_1000a680

void FUN_1000a680(undefined4 param_1)

{
  int in_ECX;
  int iVar1;
  int local_8;
  int local_4;
  
  FUN_10009250(param_1);
  if (*(char *)(DAT_101ce78c + 8) == '\0') {
    if (in_ECX < 0) {
      local_4 = 0;
      if (0 < *(int *)(DAT_101d1b9c + 0xfc)) {
        local_8 = 0;
        do {
          FUN_100092b0(*(int *)(DAT_101d1b9c + 0x100) + local_8,param_1);
          if (DAT_101ce5ec != '\0') {
            FUN_10009690();
          }
          local_4 = local_4 + 1;
          local_8 = local_8 + 0x3c;
        } while (local_4 < *(int *)(DAT_101d1b9c + 0xfc));
      }
    }
    else {
      iVar1 = in_ECX * 0x3c + *(int *)(DAT_101d1b9c + 0x100);
      if (*(char *)(DAT_101ce664 + 8) == '\0') {
        FUN_1000a020(iVar1,&DAT_101ce588,param_1);
        return;
      }
      DAT_101ce5b4 = 0;
      FUN_100092b0(iVar1);
      if (DAT_101ce5ec != '\0') {
        FUN_10009690();
        return;
      }
    }
  }
  return;
}


