extern __declspec(dllimport) int __stdcall GetSystemMetrics(int index);

void FUN_100227e1(int *outWidth, int *outHeight)
{
    int w;
    int h;
    int screenW;
    int screenH;

    w = GetSystemMetrics(0x4E);
    h = GetSystemMetrics(0x4F);
    screenW = GetSystemMetrics(0);
    screenH = GetSystemMetrics(1);
    if (w - screenW < 0)
        w = screenW;
    *outWidth = w;
    if (h - screenH >= 0)
        screenH = h;
    *outHeight = screenH;
}
