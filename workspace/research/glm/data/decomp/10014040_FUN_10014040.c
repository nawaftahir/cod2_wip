// 10014040 size=90 FUN_10014040

void FUN_10014040(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  int in_ECX;
  int iVar2;
  undefined4 *puVar3;
  
  iVar1 = in_EAX - in_ECX >> 4;
  iVar2 = iVar1 - (in_EAX - in_ECX >> 0x1f) >> 1;
  if (0 < iVar2) {
    puVar3 = (undefined4 *)(iVar2 * 0x10 + in_ECX);
    do {
      iVar2 = iVar2 + -1;
      FUN_10014230(iVar1,puVar3[-4],puVar3[-3],puVar3[-2],puVar3[-1],param_1);
      puVar3 = puVar3 + -4;
    } while (0 < iVar2);
  }
  return;
}


