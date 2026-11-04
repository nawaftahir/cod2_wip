// 10016960 size=72 FUN_10016960

void FUN_10016960(undefined4 param_1)

{
  int in_ECX;
  
  if (DAT_101d92d0 == 0x3ff) {
    FUN_100138c0(1,"More than %i techniques in use",0x3ff);
  }
  FUN_100168e0();
  DAT_101d92d0 = DAT_101d92d0 + 1;
  (&DAT_101d92d4)[in_ECX] = param_1;
  return;
}


