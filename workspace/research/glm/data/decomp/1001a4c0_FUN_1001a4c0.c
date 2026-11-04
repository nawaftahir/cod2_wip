// 1001a4c0 size=705 FUN_1001a4c0

int * FUN_1001a4c0(char *param_1,int param_2,int param_3)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  char *pcVar5;
  int *piVar6;
  undefined4 *puVar7;
  uint uVar8;
  int *unaff_EBX;
  undefined4 unaff_EBP;
  undefined4 *puVar9;
  undefined4 *unaff_retaddr;
  int *piVar10;
  int *local_7c;
  int *local_78;
  int *local_74;
  undefined **local_70;
  char *local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined *local_60;
  undefined1 *local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined1 local_50 [12];
  undefined1 auStack_44 [4];
  undefined1 local_40 [64];
  
  local_70 = &PTR_FUN_101948ec;
  local_60 = &DAT_1019520c;
  local_5c = &DAT_1019166e;
  local_58 = 0;
  local_54 = 0;
  if (param_2 == 0) {
    FUN_10060c10("vs_%i_%i",param_3 / 10,param_3 % 10);
    local_6c = "vs_main";
  }
  else {
    FUN_10060c10("ps_%i_%i",param_3 / 10,param_3 % 10);
    local_6c = "ps_main";
  }
  FUN_10060c10("materials/shaders/%s",param_1);
  cVar1 = FUN_10018250(param_1,&local_64,&local_68);
  if (cVar1 == '\0') {
    FUN_1005f360("Shader \'%s\' wasn\'t preloaded\n",local_40);
    return (int *)0x0;
  }
  iVar2 = FUN_10062b59(local_64,local_68,&local_60,&local_70,local_6c,local_50,0,&local_7c,&local_74
                       ,&local_78);
  __controlfp(0x20000,0x30000);
  __controlfp(0x8001f,0x8001f);
  if (local_74 != (int *)0x0) {
    uVar3 = (**(code **)(*local_74 + 0xc))(local_74);
    FUN_10061c80("compiler message(s) for %s:\n%s\n",auStack_44,uVar3);
    (**(code **)(*local_78 + 8))(local_78);
  }
  if (iVar2 < 0) {
    uVar3 = FUN_100efe3c(iVar2);
    FUN_1005f360("%s compilation failed - %s\n",auStack_44,uVar3);
    return (int *)0x0;
  }
  if (local_7c == (int *)0x0) {
    if (local_78 != (int *)0x0) {
      (**(code **)(*local_78 + 8))(local_78);
    }
    FUN_1005f360("%s compilation failed - NULL shader\n",local_40);
    return (int *)0x0;
  }
  if (local_78 == (int *)0x0) {
    (**(code **)(*local_7c + 8))();
    FUN_1005f360("%s compilation failed - NULL constants\n",auStack_44);
    return (int *)0x0;
  }
  uVar4 = (**(code **)(*local_7c + 0x10))();
  pcVar5 = param_1;
  do {
    cVar1 = *pcVar5;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  piVar6 = (int *)(*(code *)RI_Hunk_AllocInternal)(pcVar5 + uVar4 + (0x11 - (int)(param_1 + 1)));
  piVar6[1] = (int)(piVar6 + 4);
  puVar7 = (undefined4 *)(uVar4 + 0x10 + (int)piVar6);
  *piVar6 = (int)puVar7;
  puVar9 = unaff_retaddr;
  for (uVar8 = (uint)(pcVar5 + (1 - (int)(param_1 + 1))) >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
    *puVar7 = *puVar9;
    puVar9 = puVar9 + 1;
    puVar7 = puVar7 + 1;
  }
  for (uVar8 = (uint)(pcVar5 + (1 - (int)(param_1 + 1))) & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
    *(undefined1 *)puVar7 = *(undefined1 *)puVar9;
    puVar9 = (undefined4 *)((int)puVar9 + 1);
    puVar7 = (undefined4 *)((int)puVar7 + 1);
  }
  puVar7 = (undefined4 *)(**(code **)(*unaff_EBX + 0xc))(unaff_EBX);
  puVar9 = (undefined4 *)piVar6[1];
  for (uVar8 = uVar4 >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
    *puVar9 = *puVar7;
    puVar7 = puVar7 + 1;
    puVar9 = puVar9 + 1;
  }
  for (uVar8 = uVar4 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
    *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
    puVar7 = (undefined4 *)((int)puVar7 + 1);
    puVar9 = (undefined4 *)((int)puVar9 + 1);
  }
  *(undefined1 *)((int)piVar6 + 0xb) = param_1._0_1_;
  *(ushort *)(piVar6 + 2) = (ushort)(uVar4 >> 2) & 0x3fff;
  *(char *)((int)piVar6 + 10) = (char)unaff_retaddr;
  if ((char)unaff_retaddr == '\0') {
    iVar2 = (**(code **)(*DAT_101d1bf8 + 0x16c))();
    piVar10 = local_7c;
  }
  else {
    iVar2 = (**(code **)(*DAT_101d1bf8 + 0x1a8))(DAT_101d1bf8,piVar6[1],piVar6 + 3);
    piVar10 = local_7c;
  }
  if (iVar2 < 0) {
    uVar3 = FUN_100efe3c(iVar2);
    FUN_1005f360("shader creation failed for %s %s %s: %s\n",&local_58,&local_68,unaff_EBP,uVar3);
    return (int *)0x0;
  }
  (**(code **)(*piVar10 + 8))(piVar10);
  (**(code **)(*piVar10 + 8))(piVar10);
  return piVar6;
}


