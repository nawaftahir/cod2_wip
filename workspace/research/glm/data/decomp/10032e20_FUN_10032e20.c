// 10032e20 size=76 FUN_10032e20

void FUN_10032e20(void)

{
  int iVar1;
  
  if (DAT_101d4958 != '\0') {
    iVar1 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
    if ((iVar1 != -0x7789f798) && (iVar1 == 1)) {
      return;
    }
    DAT_101d4958 = '\0';
  }
  DAT_101d4950 = ~((int)(DAT_101d4950 - 20000) >> 0x1f) & DAT_101d4950 - 20000;
  return;
}


