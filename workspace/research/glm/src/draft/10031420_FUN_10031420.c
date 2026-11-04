extern unsigned int DAT_1072debd;
extern int FUN_10030de0();
extern int FUN_10031070();


void FUN_10031420(int *param_1)

{
  if (DAT_1072debd != '\0') {
    FUN_10030de0();
    *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
    return;
  }
  FUN_10031070(*param_1);
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


