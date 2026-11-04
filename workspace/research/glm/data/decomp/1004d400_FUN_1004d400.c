// 1004d400 size=59 FUN_1004d400

void FUN_1004d400(int param_1)

{
  FUN_1004d1b0();
  FUN_1004d350();
  (*(code *)**(undefined4 **)(param_1 + 0x1a0))(param_1);
  (*(code *)**(undefined4 **)(param_1 + 400))(param_1);
  **(undefined4 **)(param_1 + 0x198) = *(undefined4 *)(*(int *)(param_1 + 400) + 4);
  return;
}


