// Monitor selection.
#include "r_local.h"

struct GfxEnumMonitors
{
    int monitorIndex;
    HMONITOR foundMonitor;
};

static BOOL CALLBACK R_MonitorEnumCallback(HMONITOR monitorHandle, HDC hdc, LPRECT rect, LPARAM userData)
{
    GfxEnumMonitors *enumData = (GfxEnumMonitors *)userData;

    if (--enumData->monitorIndex == 0)
    {
        enumData->foundMonitor = monitorHandle;
        return 0;
    }
    return 1;
}

HMONITOR R_ChooseMonitor()
{
    POINT pt;
    GfxEnumMonitors enumData;

    if (r_fullscreen->current.enabled)
    {
        enumData.monitorIndex = r_monitor->current.integer;
        enumData.foundMonitor = 0;
        EnumDisplayMonitors(0, 0, R_MonitorEnumCallback, (LPARAM)&enumData);
        if (enumData.foundMonitor)
            return enumData.foundMonitor;
    }
    pt.x = vid_xpos->current.integer;
    pt.y = vid_ypos->current.integer;
    return MonitorFromPoint(pt, 1);
}

// name unconfirmed: adapter index driving the chosen monitor
unsigned int R_ChooseAdapter()
{
    HMONITOR monitor;
    unsigned int adapterCount;
    unsigned int adapterIndex;
    unsigned int found;

    monitor = R_ChooseMonitor();
    found = 0;
    adapterCount = dx.d3d9->GetAdapterCount();
    for (adapterIndex = 0; adapterIndex < adapterCount; adapterIndex++)
    {
        if (monitor && dx.d3d9->GetAdapterMonitor(adapterIndex) == monitor)
            found = adapterIndex;
    }
    return found;
}

// PINNED 10011560/132: monitor failures fall back to positive desktop dimensions, then the mode.
void R_GetMonitorDimensions(int *width, int *height)
{
    if (vidConfig.isFullscreen)
    {
        MONITORINFO info;
        HMONITOR monitor = dx.d3d9->GetAdapterMonitor(dx.adapterIndex);
        info.cbSize = sizeof(info);
        if (GetMonitorInfoA(monitor, &info))
        {
            *width = info.rcMonitor.right - info.rcMonitor.left;
            *height = info.rcMonitor.bottom - info.rcMonitor.top;
            return;
        }
        *width = GetSystemMetrics(0);
        *height = GetSystemMetrics(1);
        if (*width > 0 && *height > 0)
            return;
    }
    *width = vidConfig.width;
    *height = vidConfig.height;
}
