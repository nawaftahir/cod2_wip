#include "r_local.h"
#include <dxerr9.h>

const char *R_ErrorDescription(HRESULT hr)
{
    return DXGetErrorDescription9A(hr);
}
