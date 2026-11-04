
undefined4 FUN_004b2c10(int *param_1)

{
  FILE *in_EAX;
  short local_8 [2];
  
  _fread(local_8,2,1,in_EAX);
  *param_1 = (int)local_8[0];
  return 0;
}

