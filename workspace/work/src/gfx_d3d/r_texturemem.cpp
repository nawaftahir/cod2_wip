// Video/texture memory detection.
#include <initguid.h>
#include "r_local.h"

#include <ddraw.h>

#pragma comment(lib, "ddraw.lib")

static unsigned int R_VideoMemoryForDevice(GUID *lpGUID)
{
    IDirectDraw7 *dd;
    DDSCAPS2 caps;
    DWORD total;
    DWORD free;
    HRESULT hr;

    hr = DirectDrawCreateEx(lpGUID, (LPVOID *)&dd, IID_IDirectDraw7, 0);
    if (hr < 0)
        return 0;
    memset(&caps, 0, sizeof(caps));
    caps.dwCaps = DDSCAPS_VIDEOMEMORY;
    hr = dd->GetAvailableVidMem(&caps, &total, &free);
    dd->Release();
    if (hr < 0)
        return 0;
    return total;
}

static BOOL WINAPI R_DDEnumCallback(GUID *lpGUID, LPSTR lpDriverDescription, LPSTR lpDriverName, LPVOID lpContext, HMONITOR hm)
{
    unsigned int total;

    if (hm)
        return TRUE;
    total = R_VideoMemoryForDevice(lpGUID);
    if (*(unsigned int *)lpContext < total)
        *(unsigned int *)lpContext = total;
    return TRUE;
}

static unsigned int R_DrasticVideoMemoryForDevice(GUID *lpGUID)
{
    IDirectDraw7 *dd;
    DDSCAPS2 caps;
    DWORD total;
    DWORD free;
    HWND hwndDummy;
    HRESULT hr;

    hr = DirectDrawCreateEx(lpGUID, (LPVOID *)&dd, IID_IDirectDraw7, 0);
    if (hr < 0)
        return 0;
    hwndDummy = CreateWindowExA(0, "static", "dummy", 0, 0, 0, 1, 1, 0, 0, GetModuleHandleA(0), 0);
    if (!hwndDummy)
    {
        dd->Release();
        return 0;
    }
    hr = dd->SetCooperativeLevel(hwndDummy, DDSCL_FULLSCREEN | DDSCL_EXCLUSIVE);
    if (hr < 0)
    {
        DestroyWindow(hwndDummy);
        dd->Release();
        return 0;
    }
    memset(&caps, 0, sizeof(caps));
    caps.dwCaps = DDSCAPS_VIDEOMEMORY;
    hr = dd->GetAvailableVidMem(&caps, &total, &free);
    DestroyWindow(hwndDummy);
    dd->Release();
    if (hr < 0)
        return 0;
    return total;
}

static BOOL WINAPI R_DDEnumDrasticCallback(GUID *lpGUID, LPSTR lpDriverDescription, LPSTR lpDriverName, LPVOID lpContext, HMONITOR hm)
{
    unsigned int total;

    total = R_DrasticVideoMemoryForDevice(lpGUID);
    if (*(unsigned int *)lpContext < total)
        *(unsigned int *)lpContext = total;
    return TRUE;
}

static unsigned int R_VideoMemory()
{
    unsigned int total;
    unsigned int size;

    total = R_VideoMemoryForDevice(0);
    if (!total)
    {
        DirectDrawEnumerateExA(R_DDEnumCallback, &total, 0);
        if (!total)
        {
            total = R_DrasticVideoMemoryForDevice(0);
            if (!total)
            {
                DirectDrawEnumerateExA(R_DDEnumDrasticCallback, &total, 0);
                if (!total)
                    return 0;
            }
        }
    }
    total = ((total - 1) >> 20) + 1;
    for (size = 1; size < total; size <<= 1)
        ;
    if (size - total > 32)
        size = (int)size >> 1;
    return size;
}

unsigned int R_AvailableTextureMemory()
{
    unsigned int vidMemInMegs;
    unsigned int texMemInMegs;

    vidMemInMegs = R_VideoMemory();
    texMemInMegs = dx.device->GetAvailableTextureMem() >> 20;
    if (!vidMemInMegs)
    {
        ri.Printf(0, "DirectX reports %i MB of available texture memory, but wouldn't tell available video memory.\n", texMemInMegs);
        return texMemInMegs;
    }
    ri.Printf(0, "DirectX reports %i MB of video memory and %i MB of available texture memory.\n", vidMemInMegs, texMemInMegs);
    if (vidMemInMegs < texMemInMegs)
    {
        texMemInMegs = vidMemInMegs - 16;
        ri.Printf(0, "Using video memory size to cap used texture memory at %i MB.\n", texMemInMegs);
    }
    return texMemInMegs;
}
