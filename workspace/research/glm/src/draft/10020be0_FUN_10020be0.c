extern unsigned int DAT_101daa00;
extern int FUN_1001f520();
extern int FUN_1001f610();
extern int FUN_10023d40();
extern int FUN_10023d70();
extern int FUN_1002b690();


void FUN_10020be0(unsigned int param_1,unsigned int param_2,int param_3)

{
  switch(param_1) {
  case 0:
    FUN_10023d40();
    return;
  case 1:
    FUN_10023d70();
    return;
  case 2:
    FUN_1001f520(param_2);
    return;
  case 3:
    (*(void *)RI_RI_unk165)();
    break;
  case 4:
    (*(void *)RI_RI_unk166)();
    return;
  case 5:
    FUN_1002b690(param_2,&DAT_101daa00 + param_3 * 0xa000);
    return;
  case 6:
  case 7:
    FUN_1001f610(param_3);
    return;
  }
  return;
}


