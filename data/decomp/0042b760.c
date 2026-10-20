
float10 FUN_0042b760(undefined4 param_1,int param_2,float param_3,undefined4 param_4,float param_5)

{
  *(float *)(&DAT_0109c514 + param_2 * 4) =
       param_3 * param_5 + *(float *)(&DAT_0109c514 + param_2 * 4);
  *(float *)(&DAT_0109c500 + param_2 * 4) = param_5 + *(float *)(&DAT_0109c500 + param_2 * 4);
  return (float10)param_3;
}

