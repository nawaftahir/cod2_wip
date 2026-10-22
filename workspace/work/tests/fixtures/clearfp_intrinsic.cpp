#include <float.h>
#pragma intrinsic(_clearfp)
void ClearShaderFpStatus()
{
    _clearfp();
}
