
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00451470(undefined4 param_1,undefined4 param_2)

{
  int in_EAX;
  int iVar1;
  char *pcVar2;
  double dVar3;
  
  if ((*(int *)(*(int *)(in_EAX + 8) + 8) != *(int *)(*(int *)(in_EAX + 0x14) + 8)) &&
     (DAT_0124a216 == '\0')) {
    iVar1 = FUN_0047d980("brush->owner->def == brush->def->owner",".\\XYWnd.cpp",0xd54,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a216 = '\x01';
    }
  }
  pcVar2 = (char *)FUN_00464bb0();
  _atof(pcVar2);
  pcVar2 = (char *)FUN_00464bb0();
  dVar3 = _atof(pcVar2);
  FUN_00451230(param_1,(float)dVar3,0x20,param_2);
  return;
}

