
void __fastcall
FUN_00438430(undefined4 *param_1,int *param_2,int param_3,int param_4,int param_5,
            undefined4 *param_6)

{
  int *in_EAX;
  int *unaff_EDI;
  
  if (param_3 != 0) {
    if (param_4 == 0) {
      *in_EAX = 0;
    }
    else {
      *in_EAX = *param_2 + -1;
    }
    *param_1 = 0;
    if (param_5 == 0) {
      *unaff_EDI = 0;
      *param_6 = 1;
      return;
    }
    *unaff_EDI = param_2[1] + -1;
    *param_6 = 0xffffffff;
    return;
  }
  if (param_5 == 0) {
    *in_EAX = 0;
    *param_1 = 1;
  }
  else {
    *in_EAX = *param_2 + -1;
    *param_1 = 0xffffffff;
  }
  if (param_4 == 0) {
    *unaff_EDI = 0;
    *param_6 = 0;
    return;
  }
  *unaff_EDI = param_2[1] + -1;
  *param_6 = 0;
  return;
}

