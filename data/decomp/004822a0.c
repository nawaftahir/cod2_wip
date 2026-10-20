
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_004822a0(undefined4 param_1,int *param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  
  uVar2 = 0;
  uVar3 = 0x1b39;
  switch(param_3) {
  case 0:
    _DAT_01143494 = 1;
    uVar3 = FUN_0047ed20(param_1,param_2,1,0);
    break;
  case 1:
    iVar1 = FUN_0047e430();
    uVar3 = 0;
    *param_2 = iVar1;
    if (iVar1 == 0) {
      uVar3 = 0xffffffff;
    }
    break;
  case 3:
    uVar2 = 1;
  case 2:
    iVar1 = FUN_0047e5f0();
    uVar3 = 0;
    *param_2 = iVar1;
    if (iVar1 == 0) {
      uVar3 = 0xffffffff;
    }
    break;
  default:
    FUN_0047ae50(0,"FSH_FOpenFile: bad mode");
  }
  if (param_2 != (int *)0x0) {
    if (*param_2 != 0) {
      *(undefined4 *)(&DAT_011436c4 + *param_2 * 0x11c) = uVar3;
      *(undefined4 *)(&DAT_011436d0 + *param_2 * 0x11c) = 0;
    }
    *(undefined4 *)(&DAT_011436c0 + *param_2 * 0x11c) = uVar2;
  }
  return uVar3;
}

