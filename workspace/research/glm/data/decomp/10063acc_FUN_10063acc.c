// 10063acc size=89 FUN_10063acc

void FUN_10063acc(void)

{
  void *_Memory;
  int in_ECX;
  
  if (*(int *)(in_ECX + 0x38) != 0) {
    FUN_10063a76(1);
  }
  _Memory = *(void **)(in_ECX + 0x6c);
  if (_Memory != (void *)0x0) {
    FUN_10063acc();
    _free(_Memory);
  }
  if ((*(int *)(in_ECX + 0x58) != 0) && (*(int *)(in_ECX + 100) != 0)) {
    (**(code **)(**(int **)(in_ECX + 0x58) + 4))(*(int **)(in_ECX + 0x58),*(int *)(in_ECX + 100));
  }
  FUN_100822f6();
  FUN_10082638();
  FUN_1006771e();
  return;
}


