#include <d3dx9shader.h>

DWORD WINAPI D3DXGetShaderVersion(const DWORD *shader)
{
    if (!shader)
    {
        return 0;
    }
    return *shader;
}
