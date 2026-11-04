// 1001d120 size=45 FUN_1001d120

void FUN_1001d120(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 *in_EAX;
  undefined4 *in_ECX;
  
  uVar1 = *in_ECX;
  uVar2 = in_ECX[1];
  uVar3 = in_ECX[2];
  *in_ECX = *in_EAX;
  in_ECX[1] = in_EAX[1];
  in_ECX[2] = in_EAX[2];
  *in_EAX = uVar1;
  in_EAX[1] = uVar2;
  in_EAX[2] = uVar3;
  return;
}


