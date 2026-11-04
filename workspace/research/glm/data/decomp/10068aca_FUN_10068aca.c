// 10068aca size=128 FUN_10068aca

char * FUN_10068aca(undefined1 param_1)

{
  char *pcVar1;
  
  switch(param_1) {
  case 0:
    pcVar1 = "POSITION";
    break;
  case 1:
    pcVar1 = "BLENDWEIGHT";
    break;
  case 2:
    pcVar1 = "BLENDINDICES";
    break;
  case 3:
    pcVar1 = "NORMAL";
    break;
  case 4:
    pcVar1 = "PSIZE";
    break;
  case 5:
    pcVar1 = "TEXCOORD";
    break;
  case 6:
    pcVar1 = "TANGENT";
    break;
  case 7:
    pcVar1 = "BINORMAL";
    break;
  case 8:
    pcVar1 = "TESSFACTOR";
    break;
  case 9:
    pcVar1 = "POSITIONT";
    break;
  case 10:
    pcVar1 = "COLOR";
    break;
  case 0xb:
    pcVar1 = "FOG";
    break;
  case 0xc:
    pcVar1 = "DEPTH";
    break;
  case 0xd:
    pcVar1 = "SAMPLE";
    break;
  default:
    pcVar1 = "UNKNOWN";
  }
  return pcVar1;
}


