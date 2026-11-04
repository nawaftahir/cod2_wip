// 1007e2ba size=40 FUN_1007e2ba

undefined4 FUN_1007e2ba(int param_1,uint param_2)

{
  return *(undefined4 *)
          (*(int *)(param_1 + (param_2 >> 2 & 0xfffffffc)) +
          ((param_2 >> 2 & 3) + (param_2 & 3) * 4) * 4);
}


