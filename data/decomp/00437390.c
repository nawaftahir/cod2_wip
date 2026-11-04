
float10 FUN_00437390(float param_1,float param_2,float param_3)

{
  float10 fVar1;
  float in_stack_0000003c;
  float in_stack_00000040;
  float in_stack_00000044;
  
  fVar1 = (float10)FUN_004d98d4((double)((param_3 - in_stack_00000044) *
                                         (param_3 - in_stack_00000044) +
                                         (param_2 - in_stack_00000040) *
                                         (param_2 - in_stack_00000040) +
                                        (param_1 - in_stack_0000003c) *
                                        (param_1 - in_stack_0000003c)));
  return (float10)(float)fVar1;
}

