// 10032e80 size=177 FUN_10032e80

void FUN_10032e80(void)

{
  undefined8 uVar1;
  undefined8 uVar2;
  int iVar3;
  
  if (DAT_101d4958 != '\0') {
    iVar3 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
    if ((iVar3 == -0x7789f798) || (iVar3 != 1)) {
      DAT_101d4958 = 0;
      return;
    }
    uVar1 = rdtsc();
    do {
      if (DAT_101d4958 == '\0') goto LAB_10032f0a;
      iVar3 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
      if ((iVar3 == -0x7789f798) || (iVar3 != 1)) break;
      uVar2 = rdtsc();
    } while ((int)uVar2 - (int)uVar1 <= DAT_101d4950);
    DAT_101d4958 = '\0';
LAB_10032f0a:
    uVar2 = rdtsc();
    iVar3 = ((int)uVar2 - (int)uVar1) * 3;
    DAT_101d4950 = DAT_101d4950 + ((int)(iVar3 + (iVar3 >> 0x1f & 3U)) >> 2);
  }
  return;
}


