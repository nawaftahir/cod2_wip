#include <d3d9.h>

namespace D3DXShader
{
// Native/raw-input specializations only; conversion specializations are separate.
template<unsigned Stage, unsigned RegisterSet, unsigned SourceType>
class SetShaderConstant
{
public:
    static HRESULT __stdcall Set(const void *device, unsigned start,
                                  const void *data, DWORD *scratch, unsigned count)
    {
        IDirect3DDevice9 *d3d = (IDirect3DDevice9 *)device;
        if (Stage == 0)
        {
            if (RegisterSet == 0)
            {
                return d3d->SetVertexShaderConstantB(start, static_cast<const BOOL *>(data), count);
            }
            if (RegisterSet == 1)
            {
                return d3d->SetVertexShaderConstantI(start, static_cast<const int *>(data), count);
            }
            return d3d->SetVertexShaderConstantF(start, static_cast<const float *>(data), count);
        }
        if (RegisterSet == 0)
        {
            return d3d->SetPixelShaderConstantB(start, static_cast<const BOOL *>(data), count);
        }
        if (RegisterSet == 1)
        {
            return d3d->SetPixelShaderConstantI(start, static_cast<const int *>(data), count);
        }
        return d3d->SetPixelShaderConstantF(start, static_cast<const float *>(data), count);
    }
};

#define INPUTS(S, R) \
    template class SetShaderConstant<S, R, 0>; \
    template class SetShaderConstant<S, R, R + 1>;

INPUTS(0, 0)
INPUTS(0, 1)
INPUTS(0, 2)
INPUTS(1, 0)
INPUTS(1, 1)
INPUTS(1, 2)

#undef INPUTS
}
