// 1008543f size=42 FUN_1008543f

undefined4 FUN_1008543f(void)

{
  undefined *puVar1;
  uint *in_ECX;
  
  puVar1 = (undefined *)(*in_ECX & 0xfff00000);
  if ((((puVar1 != &DAT_10300000) && (puVar1 != &DAT_10500000)) && (puVar1 != &DAT_10600000)) &&
     (puVar1 != &DAT_10700000)) {
    return 0;
  }
  return 1;
}


