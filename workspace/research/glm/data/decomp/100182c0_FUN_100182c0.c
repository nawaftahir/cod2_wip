// 100182c0 size=74 FUN_100182c0

bool FUN_100182c0(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5,undefined4 param_6)

{
  char cVar1;
  undefined4 uVar2;
  
  cVar1 = FUN_10018250(param_3,param_5,param_6);
  if (cVar1 != '\0') {
    return false;
  }
  uVar2 = FUN_10060c70("lib/%s",param_3,param_5,param_6);
  cVar1 = FUN_10018250(uVar2);
  return cVar1 == '\0';
}


