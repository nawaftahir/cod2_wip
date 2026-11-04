// 10062e9a size=114 FUN_10062e9a

int FUN_10062e9a(uint *param_1)

{
  uint *puVar1;
  int iVar2;
  uint *puVar3;
  uint uVar4;
  uint uVar5;
  
  puVar3 = param_1;
  if (param_1 == (uint *)0x0) {
    iVar2 = 0;
  }
  else {
    while( true ) {
      do {
        puVar1 = puVar3;
        puVar3 = puVar1 + 1;
        uVar4 = *puVar3;
      } while ((int)uVar4 < 0);
      uVar5 = uVar4 & 0xffff;
      if (uVar5 == 0xffff) break;
      if (uVar5 == 0xfffe) {
        uVar4 = uVar4 >> 0x10 & 0x7fff;
LAB_10062ee8:
        puVar3 = puVar3 + uVar4;
      }
      else {
        if (0x1ff < (*param_1 & 0xffff)) {
          uVar4 = uVar4 >> 0x18 & 0xf;
          goto LAB_10062ee8;
        }
        if (uVar5 == 0x51) {
          puVar3 = puVar1 + 6;
        }
      }
    }
    iVar2 = ((int)puVar3 + (4 - (int)param_1) >> 2) << 2;
  }
  return iVar2;
}


