


unsigned int FUN_1007e2ba(int param_1,unsigned int param_2)

{
  return *(unsigned int *)
          (*(int *)(param_1 + (param_2 >> 2 & 0xfffffffc)) +
          ((param_2 >> 2 & 3) + (param_2 & 3) * 4) * 4);
}


