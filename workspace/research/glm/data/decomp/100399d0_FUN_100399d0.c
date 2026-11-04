// 100399d0 size=358 FUN_100399d0

void FUN_100399d0(void)

{
  float fVar1;
  undefined1 uVar2;
  undefined1 *unaff_ESI;
  float10 fVar3;
  
  fVar1 = DAT_1072ddbc;
  fVar3 = (float10)FUN_100f6670((double)DAT_1072ddbc);
  fsin(((float10)fVar1 - fVar3) * (float10)6.2831855);
  uVar2 = FUN_1010a8a8();
  *unaff_ESI = uVar2;
  uVar2 = FUN_1010a8a8();
  unaff_ESI[1] = uVar2;
  uVar2 = FUN_1010a8a8();
  unaff_ESI[2] = uVar2;
  uVar2 = FUN_1010a8a8();
  unaff_ESI[3] = uVar2;
  return;
}


