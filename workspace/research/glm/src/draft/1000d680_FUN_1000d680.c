extern unsigned int DAT_101ce5f8;
extern unsigned int DAT_101ce6c0;
extern unsigned int DAT_101ce704;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7d4;
extern unsigned int DAT_101d0a68;
extern unsigned int DAT_101d0a6c;
extern unsigned int DAT_101d0a70;
extern int FUN_1002bf50();


void FUN_1000d680(void)

{
  unsigned char bVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  unsigned char bVar5;
  
  uVar2 = FUN_1002bf50();
  uVar3 = (*(void *)RI_Dvar_GetBool)("sys_sysMB");
  if (*(char *)(DAT_101ce704 + 8) != '\0') {
    (*(void *)RI_Printf)(0,"Picmip is set manually.\n");
    g_101d0a68 = *(unsigned int *)(g_101ce5f8 + 8);
 
	int g_101d0a68 = DAT_101d0a68;  
	int g_101ce5f8 = DAT_101ce5f8; g_101d0a6c = *(unsigned int *)(g_101ce6c0 + 8);
 
	int g_101d0a6c = DAT_101d0a6c;   g
	int g_101ce6c0 = DAT_101ce6c0;_101d0a70 = *(unsigned int *)(g_101ce7d4 + 8);
 
	int g_101d0a70 = DAT_101d0a70;   got
	int g_101ce7d4 = DAT_101ce7d4;o LAB_1000d823;
  }
  uVar4 = 2;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    (*(void *)RI_Printf)(0,"Texture detail is set automatically for DirectX 7.\n");
    if (uVar2 < 100) {
      if (uVar2 < 0x1c) {
        g_101d0a68 = 2;
        g_101d0a6c = 2;
        g_101d0a70 = 2;
      }
      else {
        g_101d0a68 = 1;
        g_101d0a6c = 1;
        g_101d0a70 = 1;
      }
    }
    else {
      g_101d0a68 = 0;
      g_101d0a6c = 0;
      g_101d0a70 = 0;
    }
    bVar5 = uVar3 < 0x180;
LAB_1000d7da:
    if (!bVar5) goto LAB_1000d823;
    uVar4 = 1;
  }
  else {
    (*(void *)RI_Printf)(0,"Texture detail is set automatically.\n");
    if (uVar2 < 300) {
      if (uVar2 < 0xf0) {
        if (uVar2 < 0xbe) {
          g_101d0a68 = 1;
          if (uVar2 < 0x96) {
            if (uVar2 < 0x82) {
              g_101d0a6c = 2;
              if (uVar2 < 0x78) {
                g_101d0a68 = 2;
              }
            }
            else {
              g_101d0a6c = 1;
            }
            g_101d0a70 = 2;
          }
          else {
            g_101d0a6c = 1;
            g_101d0a70 = 1;
          }
        }
        else {
          g_101d0a6c = 1;
          g_101d0a68 = 0;
          g_101d0a70 = 1;
        }
      }
      else {
        g_101d0a68 = 0;
        g_101d0a6c = 0;
        g_101d0a70 = 1;
      }
    }
    else {
      g_101d0a68 = 0;
      g_101d0a6c = 0;
      g_101d0a70 = 0;
    }
    if (0x17f < uVar3) {
      bVar5 = uVar3 < 0x1e0;
      goto LAB_1000d7da;
    }
  }
  bVar5 = g_101d0a68 < uVar4;
  if (bVar5) {
    g_101d0a68 = uVar4;
  }
  bVar1 = g_101d0a6c < uVar4;
  if (bVar1) {
    g_101d0a6c = uVar4;
  }
  if ((g_101d0a70 < uVar4) || (uVar4 = g_101d0a70, bVar1 || bVar5)) {
    g_101d0a70 = uVar4;
    (*(void *)RI_Printf)
              (0,
               "Reducing texture detail based on total system memory of %i MB to improve load times.\n"
               ,uVar3);
  }
LAB_1000d823:
  (*(void *)RI_Dvar_SetBool)(g_101ce5f8,g_101d0a68);
  (*(void *)RI_Dvar_SetBool)(g_101ce6c0,g_101d0a6c);
  (*(void *)RI_Dvar_SetBool)(g_101ce7d4,g_101d0a70);
  (*(void *)RI_Printf)
            (0,"Using picmip %i on most textures, %i on normal maps, and %i on specular maps\n",
             g_101d0a68,g_101d0a6c,g_101d0a70);
  return;
}


