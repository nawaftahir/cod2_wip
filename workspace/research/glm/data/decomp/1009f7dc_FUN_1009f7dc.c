// 1009f7dc size=2759 FUN_1009f7dc

int FUN_1009f7dc(void)

{
  char cVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  bool bVar8;
  
  do {
    iVar4 = FUN_1006709e((undefined4 *)(in_ECX + 0x20));
    if (iVar4 < 0) {
      *(undefined4 *)(in_ECX + 0x40) = 1;
      return -1;
    }
    switch(*(undefined4 *)(in_ECX + 0x20)) {
    case 0:
      goto LAB_1009f805;
    case 1:
      cVar1 = *(char *)(in_ECX + 0x29);
      if (cVar1 == '\0') {
        return (int)*(char *)(in_ECX + 0x28);
      }
      if (*(char *)(in_ECX + 0x2a) != '\0') {
        return 0x151;
      }
      if (cVar1 != '=') {
        cVar2 = *(char *)(in_ECX + 0x28);
        if (cVar2 != cVar1) {
          return 0x151;
        }
        if (cVar2 == '&') {
          return 0x140;
        }
        if (cVar2 == '+') {
          return 0x13a;
        }
        if (cVar2 != '-') {
          if (cVar2 != '|') {
            return 0x151;
          }
          return 0x141;
        }
        return 0x13b;
      }
      cVar1 = *(char *)(in_ECX + 0x28);
      if (cVar1 < '.') {
        if (cVar1 == '-') {
          return 0x146;
        }
        if (cVar1 == '!') {
          return 0x13f;
        }
        if (cVar1 == '%') {
          return 0x144;
        }
        if (cVar1 != '*') {
          if (cVar1 != '+') {
            return 0x151;
          }
          return 0x145;
        }
        return 0x142;
      }
      if (cVar1 == '/') {
        return 0x143;
      }
      if (cVar1 == '<') {
        return 0x13c;
      }
      if (cVar1 == '=') {
        return 0x13e;
      }
      if (cVar1 != '>') {
        return 0x151;
      }
      return 0x13d;
    case 2:
      return 0x147;
    case 3:
      return 0x148;
    case 4:
      return 0x149;
    case 5:
      return 0x14a;
    case 6:
      return 0x14b;
    case 7:
      return 0x14c;
    case 8:
      return 0x14d;
    case 9:
      pcVar3 = *(char **)(in_ECX + 0x28);
      switch((int)*pcVar3) {
      case 0x61:
        iVar4 = 5;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "auto";
        goto code_r0x1009f973;
      case 0x62:
        iVar4 = 5;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "bool";
        goto code_r0x1009f9a5;
      case 99:
        iVar4 = 5;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "case";
        goto code_r0x1009f9d8;
      case 100:
        iVar4 = 8;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "default";
        goto code_r0x1009faae;
      case 0x65:
        iVar4 = 5;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "else";
        goto code_r0x1009fb8a;
      case 0x66:
        iVar4 = 6;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "false";
        goto code_r0x1009fbea;
      case 0x67:
        pcVar7 = "goto";
        break;
      case 0x68:
        iVar4 = 5;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "half";
        goto code_r0x1009fc4e;
      case 0x69:
        iVar4 = 3;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "if";
        goto code_r0x1009fc6c;
      default:
        goto switchD_1009f960_caseD_6a;
      case 0x6c:
        pcVar7 = "long";
        break;
      case 0x6d:
        iVar4 = 7;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "matrix";
        goto code_r0x1009fcfe;
      case 0x6e:
        iVar4 = 10;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "namespace";
        goto code_r0x1009fd24;
      case 0x6f:
        iVar4 = 4;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "out";
        goto code_r0x1009fd44;
      case 0x70:
        iVar4 = 0xe;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "pixelfragment";
        goto code_r0x1009fd6a;
      case 0x72:
        iVar4 = 9;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "register";
        goto code_r0x1009fde7;
      case 0x73:
        iVar4 = 10;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "sampler1D";
        goto code_r0x1009fe4d;
      case 0x74:
        iVar4 = 9;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "template";
        goto code_r0x1009fff5;
      case 0x75:
        iVar4 = 8;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "uniform";
        goto code_r0x100a011c;
      case 0x76:
        iVar4 = 7;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "vector";
        goto code_r0x100a0160;
      case 0x77:
        iVar4 = 6;
        bVar8 = true;
        pcVar7 = pcVar3;
        pcVar6 = "while";
        goto code_r0x100a020a;
      }
      iVar4 = 5;
      goto LAB_1009f9ba;
    case 10:
      return 0x14e;
    case 0xd:
      return -1;
    }
  } while( true );
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x100a020a:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x139;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x100a0160:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x134;
  }
  iVar4 = 0xf;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "vertexfragment";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x135;
  }
  iVar4 = 8;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "virtual";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 5;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "void";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x137;
  }
  iVar4 = 9;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "volatile";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x138;
  }
  if (*(int *)(in_ECX + 0x48) != 0) {
    iVar4 = 0xd;
    bVar8 = true;
    pcVar7 = pcVar3;
    pcVar6 = "vertexshader";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar8 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (bVar8) {
      return 0x136;
    }
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x100a011c:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x133;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "union";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 9;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "unsigned";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  pcVar7 = "using";
  goto LAB_1009f9b8;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fff5:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "texture1D";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x12d;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "texture2D";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x12e;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "texture3D";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x12f;
  }
  iVar4 = 0xc;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "textureCUBE";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x130;
  }
  iVar4 = 5;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "this";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "throw";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 5;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "true";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x131;
  }
  iVar4 = 4;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "try";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 8;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "typedef";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x132;
  }
  iVar4 = 9;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "typename";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  if (*(int *)(in_ECX + 0x48) != 0) {
    iVar4 = 8;
    bVar8 = true;
    pcVar7 = pcVar3;
    pcVar6 = "texture";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar8 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (bVar8) {
      return 300;
    }
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fe4d:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x120;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "sampler2D";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x121;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "sampler3D";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x122;
  }
  iVar4 = 0xc;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "samplerCUBE";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x123;
  }
  iVar4 = 0xe;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "sampler_state";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x124;
  }
  iVar4 = 7;
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "shared";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x125;
  }
  iVar5 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "short";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "signed";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "sizeof";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar5 = 0x11;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "stateblock_state";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x127;
  }
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "static";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x128;
  }
  iVar5 = 0xc;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "static_cast";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "string";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x129;
  }
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "struct";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x12a;
  }
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "switch";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  if (*(int *)(in_ECX + 0x48) != 0) {
    iVar4 = 8;
    bVar8 = true;
    pcVar7 = pcVar3;
    pcVar6 = "sampler";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar8 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (bVar8) {
      return 0x11f;
    }
    iVar4 = 0xb;
    bVar8 = true;
    pcVar7 = pcVar3;
    pcVar6 = "stateblock";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar8 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (bVar8) {
      return 0x126;
    }
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fde7:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x11c;
  }
  iVar4 = 0x11;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "reinterpret_cast";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "row_major";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x11e;
  }
  iVar4 = 7;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "return";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x11d;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fd6a:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x11a;
  }
  iVar4 = 8;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "private";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 10;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "protected";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 7;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "public";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  if (*(int *)(in_ECX + 0x48) != 0) {
    iVar4 = 0xc;
    bVar8 = true;
    pcVar7 = pcVar3;
    pcVar6 = "pixelshader";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar8 = *pcVar7 == *pcVar6;
      pcVar7 = pcVar7 + 1;
      pcVar6 = pcVar6 + 1;
    } while (bVar8);
    if (bVar8) {
      return 0x11b;
    }
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fd44:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x118;
  }
  pcVar7 = "operator";
  goto LAB_1009fd57;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fd24:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x151;
  }
  pcVar7 = "new";
  iVar4 = 4;
  goto LAB_1009f9ba;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fcfe:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x117;
  }
  pcVar7 = "mutable";
  iVar4 = 8;
  goto LAB_1009f9ba;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fc6c:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x112;
  }
  iVar4 = 3;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "in";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x113;
  }
  iVar4 = 7;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "inline";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x114;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "inout";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x115;
  }
  iVar4 = 4;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "int";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x116;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fc4e:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x111;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fbea:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x10e;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "float";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x10f;
  }
  iVar4 = 4;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "for";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x110;
  }
  pcVar7 = "friend";
  iVar4 = 7;
  goto LAB_1009f9ba;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009fb8a:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x10c;
  }
  iVar4 = 5;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "enum";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 9;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "explicit";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 7;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "extern";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x10d;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009faae:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 7;
  bVar8 = true;
  iVar5 = iVar4;
  pcVar7 = pcVar3;
  pcVar6 = "delete";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar5 = 8;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "discard";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x109;
  }
  iVar5 = 3;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "do";
  do {
    if (iVar5 == 0) break;
    iVar5 = iVar5 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x10b;
  }
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "double";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x10a;
  }
  iVar4 = 0xd;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "dynamic_cast";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  goto joined_r0x1009fb27;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009f9d8:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "catch";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 5;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "char";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "class";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  iVar4 = 0xd;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "column_major";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x104;
  }
  iVar4 = 8;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "compile";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x105;
  }
  iVar4 = 0x11;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "compile_fragment";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x106;
  }
  iVar4 = 6;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "const";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x107;
  }
  iVar4 = 0xb;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "const_cast";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x151;
  }
  pcVar7 = "continue";
LAB_1009fd57:
  iVar4 = 9;
  goto LAB_1009f9ba;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009f9a5:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
    return 0x103;
  }
  pcVar7 = "break";
LAB_1009f9b8:
  iVar4 = 6;
LAB_1009f9ba:
  bVar8 = true;
  pcVar6 = pcVar3;
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar6 == *pcVar7;
    pcVar6 = pcVar6 + 1;
    pcVar7 = pcVar7 + 1;
  } while (bVar8);
joined_r0x1009fb27:
  if (bVar8) {
    return 0x151;
  }
  goto switchD_1009f960_caseD_6a;
  while( true ) {
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
    if (!bVar8) break;
code_r0x1009f973:
    if (iVar4 == 0) break;
  }
  if (bVar8) {
LAB_1009f805:
    return 0x151;
  }
  iVar4 = 0xd;
  bVar8 = true;
  pcVar7 = pcVar3;
  pcVar6 = "asm_fragment";
  do {
    if (iVar4 == 0) break;
    iVar4 = iVar4 + -1;
    bVar8 = *pcVar7 == *pcVar6;
    pcVar7 = pcVar7 + 1;
    pcVar6 = pcVar6 + 1;
  } while (bVar8);
  if (bVar8) {
    return 0x102;
  }
switchD_1009f960_caseD_6a:
  iVar4 = _tolower((int)*pcVar3);
  if (iVar4 == 0x61) {
    iVar4 = __stricmp(*(char **)(in_ECX + 0x28),"asm");
    if (iVar4 == 0) {
      return 0x101;
    }
  }
  else if (iVar4 == 100) {
    iVar4 = __stricmp(*(char **)(in_ECX + 0x28),"decl");
    if (iVar4 == 0) {
      return 0x108;
    }
  }
  else if (iVar4 == 0x70) {
    iVar4 = __stricmp(*(char **)(in_ECX + 0x28),"pass");
    if (iVar4 == 0) {
      return 0x119;
    }
  }
  else if ((iVar4 == 0x74) && (iVar4 = __stricmp(*(char **)(in_ECX + 0x28),"technique"), iVar4 == 0)
          ) {
    return 299;
  }
  iVar4 = FUN_1009e0fb(0,in_ECX + 0x20,0,0,*(undefined4 *)(in_ECX + 0x10),0,0,0);
  return (iVar4 != 0) + 0x14f;
}


