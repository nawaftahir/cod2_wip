// Toolchain compatibility probe only; not reconstructed renderer source.
#include <d3d9.h>

extern "C" __declspec(dllexport) IDirect3D9 *probe_direct3d(void)
{
    return Direct3DCreate9(D3D_SDK_VERSION);
}
