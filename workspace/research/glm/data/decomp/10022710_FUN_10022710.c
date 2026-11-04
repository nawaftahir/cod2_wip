// 10022710 size=79 FUN_10022710

char * FUN_10022710(void)

{
  char *pcVar1;
  undefined4 in_ECX;
  
  switch(in_ECX) {
  case 0x15:
  case 0x20:
    return "24-bit color with 8-bit alpha";
  default:
    pcVar1 = (char *)FUN_10060c70("unknown format 0x%08x");
    return pcVar1;
  case 0x17:
    return "16-bit color";
  case 0x19:
    return "15-bit color with 1-bit alpha";
  case 0x46:
  case 0x50:
    return "16-bit depth without stencil";
  case 0x49:
    return "15-bit depth with 1-bit stencil";
  case 0x4b:
    return "24-bit depth with 8-bit stencil";
  case 0x4d:
    return "24-bit depth without stencil";
  }
}


