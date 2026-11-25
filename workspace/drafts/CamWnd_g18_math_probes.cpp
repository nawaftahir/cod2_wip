// bulk-g18 probes: bytes differ only by the ebp frame (CamWnd.cpp is /Oy-, retail has none)
// 0x00407800 and 0x00407830: angle of a 2D vector, float in and out
float FUN_00407800(float y, float x)
{
    return (float)atan2(y, x);
}

float FUN_00407830(float y, float x)
{
    return (float)atan2(y, x);
}

// 0x00407d90 and 0x00407db0
float FUN_00407d90(float x) { return (float)fabs(x); }
float FUN_00407db0(float x) { return (float)fabs(x); }

