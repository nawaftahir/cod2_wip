// 10003880 size=1206 FUN_10003880

/* WARNING: Type propagation algorithm not settling */

void FUN_10003880(void)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  int *in_ECX;
  int iVar6;
  uint uVar7;
  int iVar8;
  bool bVar9;
  int iStack_21c;
  int iStack_218;
  int iStack_214;
  int iStack_210;
  int iStack_20c;
  int local_208;
  char *apcStack_204 [129];
  
  iVar8 = *(int *)(*in_ECX + 0x134) + in_ECX[1];
  local_208 = iVar8;
  iStack_210 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(*(undefined4 *)(*in_ECX + 0x130));
  iStack_20c = 0;
  iStack_21c = iVar8;
  do {
    iVar8 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar8] != '\0') {
      iStack_21c = *(int *)(&DAT_101a6ac8 + iVar8);
      (&DAT_101a6ab4)[iVar8] = 0;
      *(undefined4 *)(&DAT_101a6ab0 + iVar8) = *(undefined4 *)(&DAT_101a6ac4 + iVar8);
    }
    pcVar2 = (char *)FUN_1005f690(&iStack_21c);
    if ((iStack_21c == 0) || (*pcVar2 != '{')) {
      DAT_101ae380 = (*(code *)RI_Hunk_AllocInternal)(iStack_20c * 0x60);
      DAT_101ae37c = 0;
      FUN_1002a780();
      iStack_21c = local_208;
      do {
        iVar8 = DAT_101aac70 * 0x45c;
        if ((&DAT_101a6ab4)[iVar8] != '\0') {
          iStack_21c = *(int *)(&DAT_101a6ac8 + iVar8);
          (&DAT_101a6ab4)[iVar8] = 0;
          *(undefined4 *)(&DAT_101a6ab0 + iVar8) = *(undefined4 *)(&DAT_101a6ac4 + iVar8);
        }
        pcVar2 = (char *)FUN_1005f690(&iStack_21c);
        if (*pcVar2 != '{') {
          FUN_1002a860(&DAT_101ae288);
          FUN_10003810();
          (*(code *)RI_Hunk_ClearTempMemory)();
          return;
        }
        apcStack_204[0] = "";
        iStack_214 = 1;
        iVar8 = 0;
        while( true ) {
          iVar3 = DAT_101aac70 * 0x45c;
          if ((&DAT_101a6ab4)[iVar3] != '\0') {
            iStack_21c = *(int *)(&DAT_101a6ac8 + iVar3);
            (&DAT_101a6ab4)[iVar3] = 0;
            *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
          }
          pcVar2 = (char *)FUN_1005f690(&iStack_21c);
          iVar3 = iStack_214;
          if ((*pcVar2 == '\0') || (*pcVar2 == '}')) break;
          iVar6 = 10;
          bVar9 = true;
          pcVar4 = pcVar2;
          pcVar5 = "classname";
          do {
            if (iVar6 == 0) break;
            iVar6 = iVar6 + -1;
            bVar9 = *pcVar4 == *pcVar5;
            pcVar4 = pcVar4 + 1;
            pcVar5 = pcVar5 + 1;
          } while (bVar9);
          if (bVar9) {
            iStack_218 = 0;
          }
          else {
            if (iStack_214 == 0x40) {
              FUN_100138c0(1,&DAT_10191634,0x40);
            }
            iStack_218 = iVar3;
            iStack_214 = iVar3 + 1;
          }
          apcStack_204[iStack_218 * 2] = (char *)(iVar8 + iStack_210);
          pcVar4 = pcVar2;
          do {
            cVar1 = *pcVar4;
            pcVar4 = pcVar4 + 1;
          } while (cVar1 != '\0');
          pcVar4 = pcVar4 + (1 - (int)(pcVar2 + 1));
          pcVar5 = apcStack_204[iStack_218 * 2];
          for (uVar7 = (uint)pcVar4 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
            *(undefined4 *)pcVar5 = *(undefined4 *)pcVar2;
            pcVar2 = pcVar2 + 4;
            pcVar5 = pcVar5 + 4;
          }
          for (uVar7 = (uint)pcVar4 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
            *pcVar5 = *pcVar2;
            pcVar2 = pcVar2 + 1;
            pcVar5 = pcVar5 + 1;
          }
          iVar3 = DAT_101aac70 * 0x45c;
          if ((&DAT_101a6ab4)[iVar3] != '\0') {
            iStack_21c = *(int *)(&DAT_101a6ac8 + iVar3);
            (&DAT_101a6ab4)[iVar3] = 0;
            *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
          }
          pcVar5 = (char *)FUN_1005f690(&iStack_21c);
          apcStack_204[iStack_218 * 2 + 1] = (char *)(iVar8 + (int)pcVar4 + iStack_210);
          pcVar2 = pcVar5;
          do {
            cVar1 = *pcVar2;
            pcVar2 = pcVar2 + 1;
          } while (cVar1 != '\0');
          pcVar2 = pcVar2 + (1 - (int)(pcVar5 + 1));
          iVar8 = iVar8 + (int)pcVar4 + (int)pcVar2;
          pcVar4 = apcStack_204[iStack_218 * 2 + 1];
          for (uVar7 = (uint)pcVar2 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
            *(undefined4 *)pcVar4 = *(undefined4 *)pcVar5;
            pcVar5 = pcVar5 + 4;
            pcVar4 = pcVar4 + 4;
          }
          for (uVar7 = (uint)pcVar2 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
            *pcVar4 = *pcVar5;
            pcVar5 = pcVar5 + 1;
            pcVar4 = pcVar4 + 1;
          }
        }
        if (*apcStack_204[0] == '\0') {
          FUN_100138c0(1,&DAT_10191604);
        }
        iVar8 = __stricmp(apcStack_204[1],"misc_model");
        if (iVar8 == 0) {
          FUN_100031b0(apcStack_204);
        }
      } while( true );
    }
    apcStack_204[0] = "";
    iStack_214 = 1;
    iVar8 = 0;
    while( true ) {
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        iStack_21c = *(int *)(&DAT_101a6ac8 + iVar3);
        (&DAT_101a6ab4)[iVar3] = 0;
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      pcVar2 = (char *)FUN_1005f690(&iStack_21c);
      iVar3 = iStack_214;
      if ((*pcVar2 == '\0') || (*pcVar2 == '}')) break;
      iVar6 = 10;
      bVar9 = true;
      pcVar4 = pcVar2;
      pcVar5 = "classname";
      do {
        if (iVar6 == 0) break;
        iVar6 = iVar6 + -1;
        bVar9 = *pcVar4 == *pcVar5;
        pcVar4 = pcVar4 + 1;
        pcVar5 = pcVar5 + 1;
      } while (bVar9);
      if (bVar9) {
        iStack_218 = 0;
      }
      else {
        if (iStack_214 == 0x40) {
          FUN_100138c0(1,&DAT_10191634,0x40);
        }
        iStack_218 = iVar3;
        iStack_214 = iVar3 + 1;
      }
      apcStack_204[iStack_218 * 2] = (char *)(iVar8 + iStack_210);
      pcVar4 = pcVar2;
      do {
        cVar1 = *pcVar4;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      pcVar4 = pcVar4 + (1 - (int)(pcVar2 + 1));
      pcVar5 = apcStack_204[iStack_218 * 2];
      for (uVar7 = (uint)pcVar4 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
        *(undefined4 *)pcVar5 = *(undefined4 *)pcVar2;
        pcVar2 = pcVar2 + 4;
        pcVar5 = pcVar5 + 4;
      }
      for (uVar7 = (uint)pcVar4 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
        *pcVar5 = *pcVar2;
        pcVar2 = pcVar2 + 1;
        pcVar5 = pcVar5 + 1;
      }
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        iStack_21c = *(int *)(&DAT_101a6ac8 + iVar3);
        (&DAT_101a6ab4)[iVar3] = 0;
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      pcVar5 = (char *)FUN_1005f690(&iStack_21c);
      apcStack_204[iStack_218 * 2 + 1] = (char *)(iVar8 + (int)pcVar4 + iStack_210);
      pcVar2 = pcVar5;
      do {
        cVar1 = *pcVar2;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
      pcVar2 = pcVar2 + (1 - (int)(pcVar5 + 1));
      iVar8 = iVar8 + (int)pcVar4 + (int)pcVar2;
      pcVar4 = apcStack_204[iStack_218 * 2 + 1];
      for (uVar7 = (uint)pcVar2 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
        *(undefined4 *)pcVar4 = *(undefined4 *)pcVar5;
        pcVar5 = pcVar5 + 4;
        pcVar4 = pcVar4 + 4;
      }
      for (uVar7 = (uint)pcVar2 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
        *pcVar4 = *pcVar5;
        pcVar5 = pcVar5 + 1;
        pcVar4 = pcVar4 + 1;
      }
    }
    if (*apcStack_204[0] == '\0') {
      FUN_100138c0(1,&DAT_10191604);
    }
    iVar8 = __stricmp(apcStack_204[1],"misc_model");
    if ((iVar8 == 0) && (cVar1 = FUN_10003030(iStack_214,0,0), cVar1 != '\0')) {
      iStack_20c = iStack_20c + 1;
    }
  } while( true );
}


