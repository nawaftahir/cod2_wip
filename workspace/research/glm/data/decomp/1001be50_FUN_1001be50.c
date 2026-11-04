// 1001be50 size=401 FUN_1001be50

uint FUN_1001be50(byte *param_1)

{
  byte bVar1;
  byte *pbVar2;
  int iVar3;
  byte *pbVar4;
  uint uVar5;
  bool bVar6;
  char *local_88 [34];
  
  local_88[0] = "\"depth prepass\"";
  local_88[1] = "\"sky\"";
  local_88[2] = "\"build floatz\"";
  local_88[3] = "\"unlit no fog\"";
  local_88[4] = "\"unlit linear fog\"";
  local_88[5] = "\"unlit exp fog\"";
  local_88[6] = "\"lightmap no fog\"";
  local_88[7] = "\"lightmap linear fog\"";
  local_88[8] = "\"lightmap exp fog\"";
  local_88[9] = "\"lightprobe no fog\"";
  local_88[10] = "\"lightprobe linear fog\"";
  local_88[0xb] = "\"lightprobe exp fog\"";
  local_88[0xc] = "\"lightprobe smodel no fog\"";
  local_88[0xd] = "\"lightprobe smodel linear fog\"";
  local_88[0xe] = "\"lightprobe smodel exp fog\"";
  local_88[0xf] = "\"lightprobe smodel cached no fog\"";
  local_88[0x10] = "\"lightprobe smodel cached linear fog\"";
  local_88[0x11] = "\"lightprobe smodel cached exp fog\"";
  local_88[0x12] = "\"pointlight no fog\"";
  local_88[0x13] = "\"pointlight linear fog\"";
  local_88[0x14] = "\"pointlight exp fog\"";
  local_88[0x15] = "\"emissive no fog\"";
  local_88[0x16] = "\"emissive linear fog\"";
  local_88[0x17] = "\"emissive exp fog\"";
  local_88[0x18] = "\"emissive feathered no fog\"";
  local_88[0x19] = "\"emissive feathered linear fog\"";
  local_88[0x1a] = "\"emissive feathered exp fog\"";
  local_88[0x1b] = "\"fakelight normal\"";
  local_88[0x1c] = "\"fakelight view\"";
  local_88[0x1d] = "\"solid wireframe\"";
  local_88[0x1e] = "\"shaded wireframe\"";
  local_88[0x1f] = "\"shadowcookie caster\"";
  local_88[0x20] = "\"shadowcookie receiver\"";
  local_88[0x21] = "\"debug bumpmap\"";
  uVar5 = 0;
  do {
    pbVar4 = (byte *)local_88[uVar5];
    pbVar2 = param_1;
    do {
      bVar1 = *pbVar2;
      bVar6 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) {
LAB_1001bfb8:
        iVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_1001bfbd;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar6 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_1001bfb8;
      pbVar2 = pbVar2 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    iVar3 = 0;
LAB_1001bfbd:
    if (iVar3 == 0) {
      return uVar5;
    }
    uVar5 = uVar5 + 1;
    if (0x21 < uVar5) {
      return 0x22;
    }
  } while( true );
}


