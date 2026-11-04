// 10039b40 size=1124 FUN_10039b40

void FUN_10039b40(undefined4 *param_1)

{
  char cVar1;
  int *piVar2;
  uint uVar3;
  uint *in_EAX;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  int *piVar9;
  uint uVar10;
  undefined1 uStack_2c;
  uint local_24;
  uint local_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  FUN_10039670(*param_1,&local_24);
  uVar10 = local_24;
  if (in_EAX != (uint *)0x0) {
    local_20 = local_20 & in_EAX[1] | in_EAX[3];
    uVar10 = local_24 & *in_EAX | in_EAX[2];
  }
  if (DAT_1072debd != '\0') {
    local_20 = local_20 & 0xffffffcf;
  }
  uVar3 = local_20;
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    if (DAT_10764584 != (FILE *)0x0) {
      _fprintf(DAT_10764584,"%s","---------- RB_SetupPassDx7\n");
      _fflush(DAT_10764584);
    }
    uVar4 = FUN_10060c70("---------- state map: %s\n",*(undefined4 *)*param_1);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar4);
      _fflush(DAT_10764584);
    }
    uVar4 = FUN_10060c70("---------- state bits: 0x%08x, 0x%08x --> 0x%08x, 0x%08x\n",
                         *(undefined4 *)(DAT_1072d9bc + 0x2c),*(undefined4 *)(DAT_1072d9bc + 0x30),
                         uVar10,local_20);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar4);
      _fflush(DAT_10764584);
    }
  }
  if (uVar10 != DAT_10766680) {
    FUN_1003c430(uVar10);
    DAT_10766680 = uVar10;
  }
  if (uVar3 != DAT_10766684) {
    FUN_1003cc60(uVar3);
    DAT_10766684 = uVar3;
  }
  FUN_10034bb0();
  if (*(char *)(param_1 + 1) != DAT_10766714) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
        _fprintf(DAT_10764584,"%s",
                 "dx.device->SetRenderState( D3DRS_LIGHTING, pass->gridLighting ? 1 : 0 )\n");
        _fflush(DAT_10764584);
      }
      (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0x89,*(char *)(param_1 + 1) != '\0');
    } while (DAT_1076a830 != 0);
    DAT_10766714 = *(char *)(param_1 + 1);
  }
  FUN_10038590();
  if (*(char *)((int)param_1 + 7) != '\0') {
    FUN_100399d0();
  }
  FUN_1003d450();
  iVar8 = 0;
  piVar7 = param_1 + 4;
  do {
    if ((short)piVar7[-1] == 3) {
      FUN_100389a0();
    }
    else {
      iVar6 = 0;
      if (*(ushort *)(DAT_1072d9bc + 0x34) != 0) {
        piVar5 = *(int **)(DAT_1072d9bc + 0x3c);
        do {
          if (*piVar7 == *piVar5) {
            piVar2 = (int *)piVar5[2];
            piVar9 = piVar2;
            if (*(char *)((int)piVar5 + 5) == '\x05') {
              piVar9 = *(int **)(piVar2[7] + 0x40);
            }
            uStack_2c = (undefined1)piVar5[1];
            if (*piVar9 == 3) {
              switch(*(char *)((int)piVar5 + 5)) {
              case '\x02':
                iVar6 = *(int *)(DAT_101ce7a0 + 8);
                if (iVar6 != 0) {
                  if (iVar6 == 1) {
                    uStack_2c = 1;
                  }
                  else if (iVar6 == 2) {
                    uStack_2c = 1;
                  }
                }
                break;
              case '\x03':
                if (*(int *)(DAT_101ce7f0 + 8) == 1) {
                  uStack_2c = 1;
                }
                break;
              case '\x04':
                iVar6 = *(int *)(DAT_101ce700 + 8);
                if (iVar6 != 0) {
                  if (iVar6 == 1) {
                    uStack_2c = 1;
                  }
                  else if (iVar6 == 2) {
                    uStack_2c = 1;
                  }
                }
                break;
              case '\x05':
                FUN_1002c910(piVar9,piVar2[7]);
                uStack_2c = 6;
              }
            }
            break;
          }
          iVar6 = iVar6 + 1;
          piVar5 = piVar5 + 3;
        } while (iVar6 < (int)(uint)*(ushort *)(DAT_1072d9bc + 0x34));
      }
    }
    FUN_1003d950(uStack_2c);
    cVar1 = *(char *)((int)param_1 + iVar8 + 9);
    local_24 = CONCAT31(local_24._1_3_,cVar1);
    if (((&DAT_10766715)[iVar8] != cVar1) || (cVar1 == '\x02')) {
      FUN_1003d4c0(iVar8,local_24);
    }
    iVar8 = iVar8 + 1;
    piVar7 = piVar7 + 2;
    if (1 < iVar8) {
      iVar8 = 0;
      piVar7 = param_1 + 0xf;
      do {
        iVar6 = piVar7[-8];
        if ((&DAT_10766694)[iVar8] != iVar6) {
          (&DAT_10766694)[iVar8] = iVar6;
          local_24 = 1;
          local_20 = 2;
          uStack_1c = 3;
          uStack_18 = 0x1a;
          FUN_1003d230(iVar8,iVar6,&DAT_107666d4);
        }
        iVar6 = *piVar7;
        if ((&DAT_107666b4)[iVar8] != iVar6) {
          (&DAT_107666b4)[iVar8] = iVar6;
          uStack_14 = 4;
          uStack_10 = 5;
          uStack_c = 6;
          uStack_8 = 0x1b;
          FUN_1003d230(iVar8,iVar6,&DAT_107666f4);
        }
        iVar8 = iVar8 + 1;
        piVar7 = piVar7 + 1;
      } while (iVar8 < 8);
      return;
    }
  } while( true );
}


