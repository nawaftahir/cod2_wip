// 10032cd0 size=51 FUN_10032cd0

void FUN_10032cd0(void)

{
  int iVar1;
  
  do {
    if (DAT_101d4958 == '\0') {
      return;
    }
    iVar1 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
  } while ((iVar1 != -0x7789f798) && (iVar1 == 1));
  DAT_101d4958 = 0;
  return;
}


