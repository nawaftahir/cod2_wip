
void FUN_0045c950(void)

{
  undefined4 *puVar1;
  float fVar2;
  float fVar3;
  bool bVar4;
  undefined4 *puVar5;
  float10 fVar6;
  float local_2c;
  float local_28;
  
  bVar4 = true;
  puVar5 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if ((puVar5[2] != 0) && (puVar5[2] != DAT_012334ec)) {
        fVar2 = *(float *)(*(int *)(puVar5[5] + 8) + 0x58);
        fVar3 = *(float *)(*(int *)(puVar5[5] + 8) + 0x5c);
        if (bVar4) {
          bVar4 = false;
          local_2c = fVar2;
          local_28 = fVar3;
        }
        else {
          fVar6 = (float10)FUN_004d98d4((double)((fVar2 - local_2c) * (fVar2 - local_2c) +
                                                (fVar3 - local_28) * (fVar3 - local_28)));
          FUN_0047a5b0("Distance between entities: %f\n",(double)(float)fVar6);
          local_2c = fVar2;
          local_28 = fVar3;
        }
      }
      puVar1 = puVar5 + 1;
      puVar5 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  return;
}

