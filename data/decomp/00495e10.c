
void __fastcall FUN_00495e10(undefined1 *param_1)

{
  undefined1 *in_EAX;
  undefined1 *puVar1;
  
  puVar1 = (undefined1 *)FUN_00495d90();
  for (; param_1 != puVar1; param_1 = param_1 + 1) {
    *in_EAX = *param_1;
    in_EAX = in_EAX + 1;
  }
  *in_EAX = 0;
  return;
}

