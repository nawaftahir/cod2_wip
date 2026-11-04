// 1003c3a0 size=130 FUN_1003c3a0

void FUN_1003c3a0(void)

{
  uint in_EAX;
  int iVar1;
  
  if ((in_EAX & 0xf00) == 0) {
    iVar1 = ((*(int *)(DAT_101ce67c + 8) != 2) - 1 & 0xfdf1ff12) + 0x434f5441;
  }
  else {
    iVar1 = 0;
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->SetRenderState( D3DRS_ADAPTIVETESS_Y, aaAlphaFormat )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0xe4))(DAT_101d1bf8,0xb5,iVar1);
  } while (DAT_1076a830 != 0);
  return;
}


