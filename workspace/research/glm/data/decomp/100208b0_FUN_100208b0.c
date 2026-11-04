// 100208b0 size=77 FUN_100208b0

int FUN_100208b0(float param_1)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  
  iVar1 = (int)ROUND((param_1 * (float)(&DAT_101da998)[in_EAX] + (float)(&DAT_101da9b0)[in_EAX]) -
                     0.5);
  if (iVar1 < 0) {
    return 0;
  }
  iVar2 = (&DAT_10190398)[in_EAX] + -1;
  if (iVar1 <= (&DAT_10190398)[in_EAX] + -1) {
    iVar2 = iVar1;
  }
  return iVar2;
}


