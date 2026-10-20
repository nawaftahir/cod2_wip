
void __thiscall
FUN_0048f240(uint param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5)

{
  undefined4 *in_EAX;
  
  if (((((param_1 & 0x4000) == 0) && ((param_1 & 0x1000) != 0)) &&
      ((*(byte *)((int)in_EAX + 5) & 0x10) == 0)) &&
     (*in_EAX = param_2, *(char *)((int)in_EAX + 6) == '\x06')) {
    in_EAX[5] = param_4;
    in_EAX[6] = param_5;
  }
  return;
}

