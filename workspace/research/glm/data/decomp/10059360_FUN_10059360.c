// 10059360 size=144 FUN_10059360

uint FUN_10059360(void)

{
  float *in_EAX;
  
  return (((int)ROUND(in_EAX[2] * 511.0 + 9.313226e-10) & 0x3ffU) << 10 |
         (int)ROUND(in_EAX[1] * 511.0 + 9.313226e-10) & 0x3ffU) << 10 |
         (int)ROUND(*in_EAX * 511.0 + 9.313226e-10) & 0x3ffU;
}


