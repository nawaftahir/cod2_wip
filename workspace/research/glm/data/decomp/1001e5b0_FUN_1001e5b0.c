// 1001e5b0 size=138 FUN_1001e5b0

LONG FUN_1001e5b0(int param_1)

{
  LONG *Target;
  LONG Value;
  
  if (DAT_101d49b0 == 0) {
    return -1;
  }
  Value = InterlockedExchangeAdd
                    ((LONG *)DAT_101da9c8[0x85f1e],
                     (((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40) * param_1);
  Target = (LONG *)DAT_101da9c8[0x85f1e];
  if (Target[1] < *Target) {
    if (Value <= Target[1]) {
      InterlockedExchange(Target,Value);
    }
    if (DAT_1076a864 != *DAT_101da9c8) {
      DAT_1076a864 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"R_MAX_SKINNED_CACHE_VERTICES exceeded - not drawing surface\n");
    }
    Value = -1;
  }
  return Value;
}


