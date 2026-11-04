#include <d3dx9.h>

LPCSTR WINAPI D3DXGetPixelShaderProfile(LPDIRECT3DDEVICE9 device)
{
    D3DCAPS9 caps;
    if (!device)
    {
        goto unavailable;
    }
    if (FAILED(device->GetDeviceCaps(&caps)))
    {
unavailable:
        return 0;
    }
    DWORD version = caps.PixelShaderVersion & 0xffff;
    if (version < 0x200)
    {
        if (version == 0x101) return "ps_1_1";
        if (version == 0x102) return "ps_1_2";
        if (version == 0x103) return "ps_1_3";
        return version == 0x104 ? "ps_1_4" : 0;
    }
    if (version < 0x300)
    {
        if (caps.PS20Caps.NumTemps >= 22 &&
        (caps.PS20Caps.Caps & D3DPS20CAPS_ARBITRARYSWIZZLE) &&
        (caps.PS20Caps.Caps & D3DPS20CAPS_GRADIENTINSTRUCTIONS) &&
        (caps.PS20Caps.Caps & D3DPS20CAPS_PREDICATION) &&
        (caps.PS20Caps.Caps & D3DPS20CAPS_NODEPENDENTREADLIMIT) &&
        (caps.PS20Caps.Caps & D3DPS20CAPS_NOTEXINSTRUCTIONLIMIT))
        {
            return "ps_2_a";
        }
        return "ps_2_0";
    }
    return "ps_3_0";
}

LPCSTR WINAPI D3DXGetVertexShaderProfile(LPDIRECT3DDEVICE9 device)
{
    D3DCAPS9 caps;
    if (!device)
    {
        goto unavailable;
    }
    if (FAILED(device->GetDeviceCaps(&caps)))
    {
unavailable:
        return 0;
    }
    DWORD version = caps.VertexShaderVersion & 0xffff;
    if (version < 0x200)
    {
        return version == 0x101 ? "vs_1_1" : 0;
    }
    if (version < 0x300)
    {
        if (caps.VS20Caps.NumTemps >= 13 &&
            (caps.VS20Caps.Caps & D3DVS20CAPS_PREDICATION) &&
            caps.VS20Caps.DynamicFlowControlDepth == 24)
        {
            return "vs_2_a";
        }
        return "vs_2_0";
    }
    return "vs_3_0";
}
