// 1007e0c5 size=29 FUN_1007e0c5

undefined4 FUN_1007e0c5(int param_1,uint param_2)

{
  return *(undefined4 *)(param_1 + ((param_2 & 3) + (param_2 & 0xfffffffc)) * 4);
}


