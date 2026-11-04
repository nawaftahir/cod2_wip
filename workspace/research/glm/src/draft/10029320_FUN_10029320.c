extern int FUN_100f8f20();


void FUN_10029320(float param_1,int param_2)

{
  int iVar1;
  unsigned char *puVar2;
  unkbyte10 Var3;
  float fVar4;
  int local_1c;
  unsigned char local_18;
  
  local_1c = 0;
  do {
    if (local_1c != 0x1f) {
      fVar4 = (float)local_1c * (float)0.033333335 + (float)param_1;
      if (fVar4 < (float)0.0) {
LAB_10029392:
        fVar4 = (float)0.0;
      }
      else if (fVar4 <= (float)1.0) {
        if (fVar4 < (float)0.0) goto LAB_10029392;
      }
      else {
        fVar4 = (float)1.0;
      }
      log2((float)0.10000000149011612);
      Var3 = fcos(((float)180.0 - fVar4 * (float)175.0) * (float)0.004363323251406352);
      log2(Var3);
    }
    iVar1 = 0;
    puVar2 = (unsigned char *)(local_1c + param_2);
    do {
      fVar4 = (float)FUN_100f8f20();
      local_18 = (unsigned char)(int)ROUND((float)(fVar4 * (float)255.0) + 9.313226e-10);
      iVar1 = iVar1 + 1;
      *puVar2 = local_18;
      puVar2 = puVar2 + 0x20;
    } while (iVar1 < 0x100);
    local_1c = local_1c + 1;
    if (0x1f < local_1c) {
      return;
    }
  } while( true );
}


