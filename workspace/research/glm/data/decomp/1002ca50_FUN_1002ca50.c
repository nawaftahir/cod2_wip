// 1002ca50 size=240 FUN_1002ca50

undefined4 FUN_1002ca50(void)

{
  int in_ECX;
  int in_EDX;
  
  if ((((*(int *)(in_EDX + 0xc) == *(int *)(in_ECX + 0xc)) &&
       (*(int *)(in_EDX + 0x10) == *(int *)(in_ECX + 0x10))) &&
      (*(float *)(in_EDX + 0x14) == *(float *)(in_ECX + 0x14))) &&
     (((*(float *)(in_EDX + 0x18) == *(float *)(in_ECX + 0x18) &&
       (ABS(*(float *)(in_EDX + 0x2c) - *(float *)(in_ECX + 0x2c)) <= 0.001)) &&
      ((ABS(*(float *)(in_EDX + 0x1c) - *(float *)(in_ECX + 0x1c)) <= 0.1 &&
       (ABS(*(float *)(in_EDX + 0x20) - *(float *)(in_ECX + 0x20)) <= 0.1)))))) {
    if (ABS((*(float *)(in_ECX + 0x24) * *(float *)(in_EDX + 0x24) +
            *(float *)(in_EDX + 0x28) * *(float *)(in_ECX + 0x28)) /
            (SQRT((*(float *)(in_EDX + 0x28) * *(float *)(in_EDX + 0x28) +
                  *(float *)(in_EDX + 0x24) * *(float *)(in_EDX + 0x24)) *
                  (*(float *)(in_ECX + 0x28) * *(float *)(in_ECX + 0x28) +
                  *(float *)(in_ECX + 0x24) * *(float *)(in_ECX + 0x24))) + 1e-10) - 1.0) <= 0.001)
    {
      return 1;
    }
  }
  return 0;
}


