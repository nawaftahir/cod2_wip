extern int FUN_1004d1b0();
extern int FUN_1004d350();


void FUN_1004d400(int param_1)

{
  FUN_1004d1b0();
  FUN_1004d350();
  (*(void *)**(unsigned int **)(param_1 + 0x1a0))(param_1);
  (*(void *)**(unsigned int **)(param_1 + 400))(param_1);
  **(unsigned int **)(param_1 + 0x198) = *(unsigned int *)(*(int *)(param_1 + 400) + 4);
  return;
}


