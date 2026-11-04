// 10039670 size=91 FUN_10039670

void FUN_10039670(undefined4 *param_1,undefined4 *param_2)

{
  char cVar1;
  undefined4 *in_EAX;
  uint uVar2;
  
  *param_2 = *in_EAX;
  uVar2 = 0;
  param_2[1] = in_EAX[1];
  do {
    cVar1 = FUN_10039610();
    if (cVar1 == '\0') {
      FUN_100138c0(0,
                   "No rule in stateMap \'%s\' rule set %i matched the current material state for material \'%s\'"
                   ,*param_1,uVar2,*DAT_1072d9bc);
    }
    uVar2 = uVar2 + 1;
  } while (uVar2 < 0xb);
  return;
}


