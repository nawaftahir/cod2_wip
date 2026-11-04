// 10022940 size=254 FUN_10022940

void FUN_10022940(void)

{
  undefined4 *puVar1;
  int in_EAX;
  int iVar2;
  undefined4 uVar3;
  undefined4 unaff_EDI;
  undefined4 *puStack_14;
  
  uVar3 = DAT_101d4c70;
  puStack_14 = &DAT_101d4940;
  *(undefined4 *)(in_EAX + 0xc) = DAT_101d4c6c;
  *(undefined4 *)(in_EAX + 0x10) = uVar3;
  iVar2 = (**(code **)(*DAT_101d1bf8 + 0x38))(DAT_101d1bf8,0);
  if (iVar2 < 0) {
    uVar3 = FUN_100efe3c(iVar2);
    FUN_10061cd0(0,"Couldn\'t get an interface to the swap chain: %s\n",uVar3);
  }
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",
               "dx.device->GetBackBuffer( 0, 0, D3DBACKBUFFER_TYPE_MONO, &renderTarget->colorSurface )\n"
              );
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d1bf8 + 0x48))(DAT_101d1bf8,0,0,0,in_EAX + 4);
  } while (DAT_1076a830 != 0);
  FUN_100227c0(&stack0xfffffff0,&puStack_14);
  puVar1 = puStack_14;
  iVar2 = (**(code **)(*DAT_101d1bf8 + 0x74))
                    (DAT_101d1bf8,unaff_EDI,puStack_14,0x4b,DAT_101d4814,DAT_101d4818,0,in_EAX + 8,0
                    );
  if (iVar2 < 0) {
    uVar3 = FUN_100efe3c(iVar2);
    FUN_10061cd0(0,"Couldn\'t create a %i x %i depth-stencil surface: %s\n",unaff_EDI,puVar1,uVar3);
  }
  return;
}


