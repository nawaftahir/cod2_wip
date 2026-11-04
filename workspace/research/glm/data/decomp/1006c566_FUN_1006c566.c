// 1006c566 size=28 FUN_1006c566

undefined4 FUN_1006c566(undefined4 *param_1,int param_2)

{
  if (param_2 != 0) {
    for (; param_2 != 0; param_2 = param_2 + -1) {
      *param_1 = 0xffffffff;
      param_1 = param_1 + 1;
    }
  }
  return 0;
}


