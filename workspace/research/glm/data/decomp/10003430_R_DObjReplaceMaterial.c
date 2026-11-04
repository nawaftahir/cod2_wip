// 10003430 size=921 R_DObjReplaceMaterial

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

undefined4 R_DObjReplaceMaterial(char *param_1,undefined4 param_2)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  int iVar7;
  char *pcVar8;
  double dVar9;
  char local_1000 [2047];
  undefined1 local_801;
  char local_800 [2044];
  uint uStack_4;
  
  uStack_4 = 0x1000343a;
LAB_10003450:
  do {
    while( true ) {
      iVar2 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar2] != '\0') {
        param_2 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
        (&DAT_101a6ab4)[iVar2] = 0;
        *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
      }
      pcVar3 = (char *)FUN_1005f690(&param_2);
      cVar1 = *pcVar3;
      if (cVar1 == '\0') {
        return param_2;
      }
      if (cVar1 == '}') {
        return param_2;
      }
      if (cVar1 != '{') break;
      param_1[0x40] = '\0';
      param_1[0x41] = '\0';
      param_1[0x42] = '\0';
      param_1[0x43] = '\0';
      param_1[0x54] = '\0';
      param_1[0x55] = '\0';
      param_1[0x56] = '\0';
      param_1[0x57] = '\0';
      param_1[0x50] = '\0';
      param_1[0x51] = '\0';
      param_1[0x52] = '\0';
      param_1[0x53] = '?';
      param_1[0x70] = '\0';
      param_1[0x44] = '\0';
      param_1[0x45] = '\0';
      param_1[0x46] = '\0';
      param_1[0x47] = '\0';
      param_1[0x48] = '\0';
      param_1[0x49] = '\0';
      param_1[0x4a] = '\0';
      param_1[0x4b] = '\0';
      param_1[0x4c] = '\0';
      param_1[0x4d] = '\0';
      param_1[0x4e] = '\0';
      param_1[0x4f] = '\0';
      param_1[0x58] = '\0';
      param_1[0x59] = '\0';
      param_1[0x5a] = '\0';
      param_1[0x5b] = '\0';
      param_1[0x5c] = '\0';
      param_1[0x5d] = '\0';
      param_1[0x5e] = '\0';
      param_1[0x5f] = '\0';
      param_1[0x60] = '\0';
      param_1[0x61] = '\0';
      param_1[0x62] = '\0';
      param_1[99] = '\0';
      param_1[100] = '\0';
      param_1[0x65] = '\0';
      param_1[0x66] = '\0';
      param_1[0x67] = '\0';
      param_1[0x68] = '\0';
      param_1[0x69] = '\0';
      param_1[0x6a] = '\0';
      param_1[0x6b] = '\0';
      param_1[0x6c] = '\0';
      param_1[0x6d] = '\0';
      param_1[0x6e] = '\0';
      param_1[0x6f] = '\0';
    }
    _strncpy(local_800,pcVar3,0x7ff);
    iVar2 = DAT_101aac70 * 0x45c;
    uStack_4 = uStack_4 & 0xffffff;
    if ((&DAT_101a6ab4)[iVar2] != '\0') {
      param_2 = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
      (&DAT_101a6ab4)[iVar2] = 0;
      *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
    }
    pcVar3 = (char *)FUN_1005f690(&param_2);
    if ((*pcVar3 == '\0') || (*pcVar3 == '}')) {
      return param_2;
    }
    _strncpy(local_1000,pcVar3,0x7ff);
    local_801 = 0;
    iVar7 = 0;
    iVar2 = 0x7fffffff;
    do {
      iVar4 = (int)local_800[iVar7];
      iVar5 = (int)"ambient"[iVar7];
      iVar7 = iVar7 + 1;
      if (iVar2 == 0) break;
      if (iVar4 != iVar5) {
        if ((0x60 < iVar4) && (iVar4 < 0x7b)) {
          iVar4 = iVar4 + -0x20;
        }
        if ((0x60 < iVar5) && (iVar5 < 0x7b)) {
          iVar5 = iVar5 + -0x20;
        }
        if (iVar4 != iVar5) {
          if ((char)((iVar5 <= iVar4) * '\x02') != '\x01') {
            iVar2 = FUN_10060950();
            if (iVar2 == 0) {
              pcVar3 = param_1 + 0x44;
              pcVar8 = param_1 + 0x4c;
              pcVar6 = param_1 + 0x48;
            }
            else {
              iVar2 = FUN_10060950();
              if (iVar2 == 0) {
                dVar9 = _atof(local_1000);
                *(float *)(param_1 + 0x50) = (float)dVar9;
                goto LAB_10003450;
              }
              iVar2 = FUN_10060950();
              if (iVar2 == 0) {
                pcVar3 = param_1 + 0x58;
                pcVar3[0] = '\0';
                pcVar3[1] = '\0';
                pcVar3[2] = '\0';
                pcVar3[3] = '\0';
                param_1[0x5c] = '\0';
                param_1[0x5d] = '\0';
                param_1[0x5e] = '\0';
                param_1[0x5f] = '\0';
                param_1[0x60] = '\0';
                param_1[0x61] = '\0';
                param_1[0x62] = '\0';
                param_1[99] = '\0';
                _sscanf(local_1000,"%f %f %f",pcVar3,param_1 + 0x5c,param_1 + 0x60);
                FUN_1005df00();
                goto LAB_10003450;
              }
              iVar2 = FUN_10060950();
              if (iVar2 == 0) {
                pcVar3 = param_1 + 100;
                pcVar3[0] = '\0';
                pcVar3[1] = '\0';
                pcVar3[2] = '\0';
                pcVar3[3] = '\0';
                param_1[0x68] = '\0';
                param_1[0x69] = '\0';
                param_1[0x6a] = '\0';
                param_1[0x6b] = '\0';
                param_1[0x6c] = '\0';
                param_1[0x6d] = '\0';
                param_1[0x6e] = '\0';
                param_1[0x6f] = '\0';
                _sscanf(local_1000,"%f %f %f",pcVar3,param_1 + 0x68,param_1 + 0x6c);
                FUN_1005df00();
                param_1[0x70] = '\x01';
                goto LAB_10003450;
              }
              iVar2 = FUN_10060950();
              if (iVar2 == 0) {
                dVar9 = _atof(local_1000);
                *(float *)(param_1 + 0x54) = (float)dVar9;
                goto LAB_10003450;
              }
              iVar2 = FUN_10060950();
              if (iVar2 != 0) {
                iVar2 = FUN_10060950();
                if (iVar2 == 0) {
                  _strncpy(param_1,local_1000,0x3f);
                  param_1[0x3f] = '\0';
                }
                goto LAB_10003450;
              }
              pcVar3 = param_1 + 0x74;
              pcVar8 = param_1 + 0x7c;
              pcVar6 = param_1 + 0x78;
            }
            pcVar3[0] = '\0';
            pcVar3[1] = '\0';
            pcVar3[2] = '\0';
            pcVar3[3] = '\0';
            pcVar3[4] = '\0';
            pcVar3[5] = '\0';
            pcVar3[6] = '\0';
            pcVar3[7] = '\0';
            pcVar3[8] = '\0';
            pcVar3[9] = '\0';
            pcVar3[10] = '\0';
            pcVar3[0xb] = '\0';
            _sscanf(local_1000,"%f %f %f",pcVar3,pcVar6,pcVar8);
            goto LAB_10003450;
          }
          break;
        }
      }
      iVar2 = iVar2 + -1;
    } while (iVar4 != 0);
    dVar9 = _atof(local_1000);
    *(float *)(param_1 + 0x40) = (float)dVar9;
    if (2.0 < (float)dVar9) {
      FUN_10061c80("^3WARNING: ambient too big, assuming it uses the old 0-255 scale instead of the proper 0-1 scale (value = \'%s\')\n"
                   ,local_1000);
      *(float *)(param_1 + 0x40) = *(float *)(param_1 + 0x40) * 0.015686275;
    }
  } while( true );
}


