// 10017100 size=144 FUN_10017100

int FUN_10017100(undefined4 param_1)

{
  int iVar1;
  char local_5;
  ushort local_4 [2];
  
  FUN_10017050(local_4,&local_5);
  if (local_5 != '\0') {
    return (&DAT_101d4d28)[local_4[0]];
  }
  iVar1 = FUN_1001c740(param_1);
  if (iVar1 == 0) {
    if (DAT_101d1b2c == 0) {
      FUN_100138c0(0,"couldn\'t load material \'$default\'");
    }
    FUN_10061c80("^3WARNING: Could not find material \'%s\'\n");
    iVar1 = R_ParseSunLight(DAT_101d1b2c);
    return iVar1;
  }
  FUN_10016ed0();
  return iVar1;
}


