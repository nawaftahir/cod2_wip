// PINNED SDK63 conversion callbacks; float-to-int specialization is separate.
#include <d3d9.h>

namespace D3DXShader
{
template<unsigned Stage, unsigned RegisterSet, unsigned SourceType>
class SetShaderConstant
{
public:
    static HRESULT __stdcall Set(const void *device, unsigned start,
                                  const void *data, DWORD *scratch, unsigned count)
    {
        unsigned values = count;
        if (RegisterSet != 0)
        {
            values <<= 2;
        }

        if (SourceType != 0 && SourceType != RegisterSet + 1)
        {
            for (unsigned i = 0; i < values; ++i)
            {
                if (RegisterSet == 0)
                {
                    if (SourceType == 3)
                    {
                        scratch[i] = static_cast<const float *>(data)[i] != 0.0f;
                    }
                    else
                    {
                        scratch[i] = static_cast<const int *>(data)[i] != 0;
                    }
                }
                else if (RegisterSet == 1)
                {
                    if (SourceType == 1)
                    {
                        scratch[i] = static_cast<const int *>(data)[i] != 0;
                    }
                    else
                    {
                        scratch[i] = static_cast<int>(static_cast<const float *>(data)[i]);
                    }
                }
                else
                {
                    if (SourceType == 1)
                    {
                        reinterpret_cast<float *>(scratch)[i] =
                            static_cast<float>(static_cast<const int *>(data)[i] != 0);
                    }
                    else
                    {
                        reinterpret_cast<float *>(scratch)[i] =
                            static_cast<float>(static_cast<const int *>(data)[i]);
                    }
                }
            }
        }

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

#define CONVERSIONS(S) \
    template class SetShaderConstant<S, 0, 2>; \
    template class SetShaderConstant<S, 0, 3>; \
    template class SetShaderConstant<S, 1, 1>; \
    template class SetShaderConstant<S, 2, 1>; \
    template class SetShaderConstant<S, 2, 2>;

CONVERSIONS(0)
CONVERSIONS(1)

#undef CONVERSIONS
}
