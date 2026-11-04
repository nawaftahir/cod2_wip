
undefined4 FUN_004b2c40(undefined4 *param_1)

{
  FILE *in_EAX;
  undefined4 local_8;
  
  _fread(&local_8,4,1,in_EAX);
  *param_1 = local_8;
  return 0;
}

