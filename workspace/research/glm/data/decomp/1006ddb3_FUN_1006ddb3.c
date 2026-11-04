// 1006ddb3 size=64 FUN_1006ddb3

void FUN_1006ddb3(void)

{
  int in_ECX;
  
  if (*(undefined4 **)(in_ECX + 8) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(in_ECX + 8))(1);
  }
  _free(*(void **)(in_ECX + 0x18));
  _free(*(void **)(in_ECX + 0x88));
  _free(*(void **)(in_ECX + 0x90));
  _free(*(void **)(in_ECX + 0x98));
  return;
}


