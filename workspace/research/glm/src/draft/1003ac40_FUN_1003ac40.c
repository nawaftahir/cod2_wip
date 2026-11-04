extern unsigned int DAT_106d320c;
extern unsigned int DAT_106d3210;
extern unsigned int DAT_106d3214;
extern unsigned int DAT_106d3218;
extern unsigned int DAT_106d321c;
extern unsigned int DAT_106d3220;
extern unsigned int DAT_106d3230;
extern unsigned int DAT_106d3234;
extern unsigned int DAT_106d3238;
extern unsigned int DAT_106d323c;
extern unsigned int DAT_106d3240;
extern unsigned int DAT_106d3244;
extern unsigned int DAT_106d3254;
extern unsigned int DAT_106d3258;
extern unsigned int DAT_106d325c;
extern unsigned int DAT_106d3260;
extern unsigned int DAT_106d3264;
extern unsigned int DAT_106d3268;
extern unsigned int DAT_106d3278;
extern unsigned int DAT_106d327c;
extern unsigned int DAT_106d3280;
extern unsigned int DAT_106d3284;
extern unsigned int DAT_106d3288;
extern unsigned int DAT_106d328c;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;


void FUN_1003ac40(unsigned int param_1)

{
  int iVar1;
  short sVar2;
  unsigned int uVar3;
  
  uVar3 = g_1072d9d4;
 
	int g_1072d9d4 = DAT_1072d9d4; sVar2 = (short)g_1072d9d4;
  *(short *)(g_1072d9b0 + g_1072d9d0 * 2) = sVar2 + 3;
  *(s
	int g_1072d9d0 = DAT_1072d9d0;ho
	int g_1072d9b0 = DAT_1072d9b0;rt *)(g_1072d9b0 + 2 + g_1072d9d0 * 2) = sVar2;
  *(short *)(g_1072d9b0 + 4 + g_1072d9d0 * 2) = sVar2 + 2;
  *(short *)(g_1072d9b0 + 6 + g_1072d9d0 * 2) = sVar2 + 2;
  *(short *)(g_1072d9b0 + 8 + g_1072d9d0 * 2) = sVar2;
  *(short *)(g_1072d9b0 + 10 + g_1072d9d0 * 2) = sVar2 + 1;
  iVar1 = (uVar3 & 0xffff) * 0x24;
  *(unsigned int *)(&DAT_106d320c + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3210 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3214 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d321c + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3220 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3218 + iVar1) = param_1;
  *(unsigned int *)(&DAT_106d3230 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3234 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3238 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3240 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3244 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d323c + iVar1) = param_1;
  *(unsigned int *)(&DAT_106d3254 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3258 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d325c + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3264 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3268 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3260 + iVar1) = param_1;
  *(unsigned int *)(&DAT_106d3278 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d327c + iVar1) = 0;
  *(unsigned int *)(&DAT_106d3280 + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3288 + iVar1) = 0;
  *(unsigned int *)(&DAT_106d328c + iVar1) = 0x3f800000;
  *(unsigned int *)(&DAT_106d3284 + iVar1) = param_1;
  g_1072d9d4 = g_1072d9d4 + 4;
  g_1072d9d0 = g_1072d9d0 + 6;
  return;
}


