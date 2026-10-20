
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_00439620(float *param_1)

{
  float fVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  iVar3 = in_EAX - (int)param_1;
  do {
    fVar1 = *(float *)((int)param_1 + iVar3) - *param_1;
    if (_DAT_00556b20 < fVar1 * fVar1) {
      return 0;
    }
    iVar2 = iVar2 + 1;
    param_1 = param_1 + 1;
  } while (iVar2 < 3);
  return 1;
}

