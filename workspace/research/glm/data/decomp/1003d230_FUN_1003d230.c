// 1003d230 size=396 FUN_1003d230

void FUN_1003d230(int param_1,uint param_2,int param_3)

{
  int iVar1;
  undefined4 *in_EAX;
  uint uVar2;
  uint uVar3;
  byte bVar4;
  uint uVar5;
  uint uVar6;
  int local_8;
  
  uVar3 = *(uint *)(param_3 + param_1 * 4) ^ param_2;
  iVar1 = (param_2 & 0x1f) * 8;
  uVar2 = uVar3 & 0x1f;
  while (uVar2 != 0) {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetTextureStageState( stageIndex, texStageEnums->op, texOp->enumerant )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x10c))
              (DAT_101d1bf8,param_1,*in_EAX,*(undefined4 *)(&DAT_101907a8 + iVar1));
    uVar2 = DAT_1076a830;
  }
  bVar4 = 10;
  uVar5 = 0x7c00;
  local_8 = 0;
  uVar2 = param_2;
  do {
    in_EAX = in_EAX + 1;
    if ((uVar3 & uVar5) != 0) {
      if ((*(uint *)(&UNK_101907ac + iVar1) & 1 << ((byte)local_8 & 0x1f)) == 0) {
        param_2 = ~uVar5 & uVar2 | *(uint *)(param_3 + param_1 * 4) & uVar5;
        uVar2 = param_2;
      }
      else {
        uVar2 = (int)uVar2 >> (bVar4 & 0x1f);
        uVar6 = *(uint *)(&DAT_10190860 + (uVar2 & 7) * 4);
        if ((uVar2 & 8) != 0) {
          uVar6 = uVar6 | 0x10;
        }
        if ((uVar2 & 0x10) != 0) {
          uVar6 = uVar6 | 0x20;
        }
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s",
                     "dx.device->SetTextureStageState( stageIndex, texStageEnums->arg[argIndex], texArg )\n"
                    );
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0x10c))(DAT_101d1bf8,param_1,*in_EAX,uVar6);
          uVar2 = param_2;
        } while (DAT_1076a830 != 0);
      }
    }
    local_8 = local_8 + 1;
    bVar4 = bVar4 + 5;
    uVar5 = uVar5 << 5;
  } while (local_8 < 3);
  *(uint *)(param_3 + param_1 * 4) = uVar2;
  return;
}


