
undefined4 __thiscall FUN_004bd7f0(int param_1,char *param_2)

{
  short sVar1;
  char *pcVar2;
  long lVar3;
  undefined4 local_1c [2];
  undefined4 local_14;
  undefined1 local_10 [2];
  short local_e;
  
  local_14 = 0;
  local_1c[0] = 0;
  FUN_004bd520(*(undefined4 *)(param_1 + 4),1,local_10,local_1c);
  pcVar2 = _strchr(param_2,0x3a);
  if (pcVar2 != (char *)0x0) {
    param_2 = pcVar2 + 1;
  }
  lVar3 = _atol(param_2);
  if ((local_e != 0) && (sVar1 = Ordinal_9(lVar3), local_e != sVar1)) {
    FUN_004be650();
    return 1;
  }
  FUN_004be650();
  return 0;
}

