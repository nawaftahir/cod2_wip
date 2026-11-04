// 10099c8f size=603 FUN_10099c8f

void FUN_10099c8f(char *param_1,uint param_2,int param_3)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  uint uVar7;
  char *_Format;
  char local_108 [255];
  undefined1 local_9;
  char *local_8;
  
  local_8 = local_108;
  if (param_3 == 0) {
    local_8 = "void";
    goto LAB_10099eb1;
  }
  iVar4 = *(int *)(param_3 + 4);
  if (iVar4 == 1) {
    iVar4 = FUN_10099a41(param_3);
    pcVar5 = "const ";
    if (iVar4 == 0) {
      pcVar5 = "";
    }
    pcVar3 = (char *)FUN_10099b4f(param_3);
    _Format = "%sstruct{%u}";
  }
  else {
    if (iVar4 == 8) {
      iVar4 = *(int *)(param_3 + 4);
      iVar2 = param_3;
      while (iVar4 == 8) {
        iVar2 = *(int *)(iVar2 + 0x10);
        iVar4 = *(int *)(iVar2 + 4);
      }
      iVar4 = FUN_10099c8f(local_108,0xff,iVar2);
      for (; *(int *)(param_3 + 4) == 8; param_3 = *(int *)(param_3 + 0x10)) {
        __snprintf(local_108 + iVar4,0xff - iVar4,"[%u]",*(undefined4 *)(param_3 + 0x14));
        pcVar5 = local_108 + iVar4;
        local_9 = 0;
        do {
          cVar1 = *pcVar5;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        iVar4 = (int)pcVar5 - (int)(local_108 + 1);
      }
      goto LAB_10099eb1;
    }
    if (iVar4 != 9) {
      local_8 = "unknown";
      goto LAB_10099eb1;
    }
    pcVar5 = "const ";
    if ((*(byte *)(param_3 + 0x21) & 2) == 0) {
      pcVar5 = "";
    }
    switch(*(undefined4 *)(param_3 + 0x14)) {
    case 0:
      pcVar3 = "bool";
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      pcVar3 = "int";
      break;
    case 9:
    case 0xb:
      pcVar3 = "float";
      break;
    case 10:
      pcVar3 = "half";
      break;
    case 0xc:
      pcVar3 = "double";
      break;
    case 0xd:
      pcVar3 = "NULL";
      break;
    case 0xe:
      pcVar3 = "string";
      break;
    case 0xf:
      pcVar3 = "texture";
      break;
    case 0x10:
      pcVar3 = "texture1D";
      break;
    case 0x11:
      pcVar3 = "texture2D";
      break;
    case 0x12:
      pcVar3 = "texture3D";
      break;
    case 0x13:
      pcVar3 = "textureCUBE";
      break;
    case 0x14:
      pcVar3 = "sampler";
      break;
    case 0x15:
      pcVar3 = "sampler1D";
      break;
    case 0x16:
      pcVar3 = "sampler2D";
      break;
    case 0x17:
      pcVar3 = "sampler3D";
      break;
    case 0x18:
      pcVar3 = "samplerCUBE";
      break;
    case 0x19:
      pcVar3 = "pixelshader";
      break;
    case 0x1a:
      pcVar3 = "vertexshader";
      break;
    case 0x1b:
      pcVar3 = "pixelfragment";
      break;
    case 0x1c:
      pcVar3 = "vertexfragment";
      break;
    case 0x1d:
      pcVar3 = "stateblock";
      break;
    default:
      pcVar3 = "unknown";
    }
    if (*(int *)(param_3 + 0x10) == 1) {
      __snprintf(local_108,0xff,"%s%s%u",pcVar5,pcVar3,*(undefined4 *)(param_3 + 0x1c));
      goto LAB_10099eb1;
    }
    if (*(int *)(param_3 + 0x10) == 2) {
      __snprintf(local_108,0xff,"%s%s%ux%u",pcVar5,pcVar3,*(undefined4 *)(param_3 + 0x18),
                 *(undefined4 *)(param_3 + 0x1c));
      goto LAB_10099eb1;
    }
    _Format = "%s%s";
  }
  __snprintf(local_108,0xff,_Format,pcVar5,pcVar3);
LAB_10099eb1:
  pcVar5 = local_8;
  do {
    cVar1 = *pcVar5;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  uVar6 = (int)pcVar5 - (int)(local_8 + 1);
  if (param_2 < (uint)((int)pcVar5 - (int)(local_8 + 1))) {
    uVar6 = param_2;
  }
  pcVar5 = param_1;
  for (uVar7 = uVar6 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
    *(undefined4 *)pcVar5 = *(undefined4 *)local_8;
    local_8 = local_8 + 4;
    pcVar5 = pcVar5 + 4;
  }
  for (uVar7 = uVar6 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
    *pcVar5 = *local_8;
    local_8 = local_8 + 1;
    pcVar5 = pcVar5 + 1;
  }
  param_1[uVar6] = '\0';
  return;
}


