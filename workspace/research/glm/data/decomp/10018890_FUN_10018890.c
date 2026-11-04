// 10018890 size=75 FUN_10018890

uint * FUN_10018890(undefined4 param_1)

{
  uint in_EAX;
  uint *puVar1;
  uint *puVar2;
  uint *puVar3;
  
  puVar1 = (uint *)(*(code *)RI_Hunk_AllocInternal)(in_EAX * 0x20 + 4);
  *puVar1 = in_EAX;
  FUN_1005eaf0(puVar1 + 1,param_1,in_EAX * 0x20);
  puVar3 = puVar1;
  if (0 < (int)in_EAX) {
    do {
      puVar2 = puVar3 + 8;
      puVar3[7] = ~puVar3[7];
      *puVar2 = ~*puVar2;
      in_EAX = in_EAX - 1;
      puVar3 = puVar2;
    } while (in_EAX != 0);
  }
  return puVar1;
}


