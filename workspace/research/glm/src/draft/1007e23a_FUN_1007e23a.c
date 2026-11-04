


unsigned int FUN_1007e23a(int param_1,unsigned int param_2)

{
  return *(unsigned int *)
          (param_1 + ((param_2 >> 2 & 3) + ((param_2 & 3) + (param_2 >> 2 & 0xfffffffc)) * 4) * 4);
}


