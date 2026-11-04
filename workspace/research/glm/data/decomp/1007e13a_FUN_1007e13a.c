// 1007e13a size=40 FUN_1007e13a

undefined4 FUN_1007e13a(int param_1,uint param_2)

{
  return *(undefined4 *)
          (param_1 + ((param_2 & 3) + ((param_2 >> 2 & 3) + (param_2 >> 2 & 0xfffffffc)) * 4) * 4);
}


