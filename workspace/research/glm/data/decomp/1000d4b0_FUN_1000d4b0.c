// 1000d4b0 size=87 FUN_1000d4b0

undefined4 FUN_1000d4b0(void)

{
  undefined4 in_ECX;
  int unaff_ESI;
  undefined4 local_4;
  
  local_4 = in_ECX;
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","image->texture.map->GetSurfaceLevel( 0, &surface )\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(**(int **)(unaff_ESI + 4) + 0x48))(*(int **)(unaff_ESI + 4),0,&local_4);
  } while (DAT_1076a830 != 0);
  return local_4;
}


