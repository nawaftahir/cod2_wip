extern unsigned int DAT_1072debd;
extern int FUN_10031470();
extern int FUN_10031780();


void FUN_10031cc0(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  if (DAT_1072debd != '\0') {
    FUN_10031470((int)*(short *)(iVar1 + 4),iVar1 + 8);
    *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
    return;
  }
  FUN_10031780((int)*(short *)(iVar1 + 4),(int)*(short *)(iVar1 + 6),iVar1 + 8,1);
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


