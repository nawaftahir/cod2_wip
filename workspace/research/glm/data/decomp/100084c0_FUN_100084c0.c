// 100084c0 size=161 FUN_100084c0

void FUN_100084c0(void)

{
  float fVar1;
  undefined4 uVar2;
  int in_EAX;
  undefined4 uVar3;
  float *unaff_EBX;
  int iVar4;
  float *unaff_EDI;
  float local_18;
  float fStack_14;
  float fStack_10;
  float local_c;
  float fStack_8;
  float fStack_4;
  
  uVar2 = DAT_101d7e10;
  iVar4 = in_EAX * 0x74 + DAT_10678510;
  uVar3 = (&DAT_10678ac8)[in_EAX * 0xd];
  if (*(int *)(in_EAX * 0x74 + DAT_10678510) != 0) {
    (*(code *)RI_DObjGetModel)(DAT_101d7e10,(&DAT_10678ac8)[in_EAX * 0xd]);
    uVar3 = uVar2;
  }
  (*(code *)RI_IsWorker)(uVar3,&local_18,&local_c);
  fVar1 = *(float *)(iVar4 + 0x38);
  *unaff_EBX = local_18 * fVar1 + *(float *)(iVar4 + 0x3c);
  unaff_EBX[1] = fStack_14 * fVar1 + *(float *)(iVar4 + 0x40);
  unaff_EBX[2] = fStack_10 * fVar1 + *(float *)(iVar4 + 0x44);
  fVar1 = *(float *)(iVar4 + 0x38);
  *unaff_EDI = local_c * fVar1 + *(float *)(iVar4 + 0x3c);
  unaff_EDI[1] = fStack_8 * fVar1 + *(float *)(iVar4 + 0x40);
  unaff_EDI[2] = fStack_4 * fVar1 + *(float *)(iVar4 + 0x44);
  return;
}


