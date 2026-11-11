#include "common_types.h"
#include "imports.h"

extern "C" {
__declspec(dllimport) DWORD __stdcall GetCurrentThreadId(void);
__declspec(dllimport) void *__stdcall GetCurrentThread(void);
__declspec(dllimport) int __stdcall DuplicateHandle(void *, void *, void *, void **, DWORD, int, DWORD);
__declspec(dllimport) DWORD __stdcall TlsAlloc(void);
__declspec(dllimport) void *__stdcall TlsGetValue(DWORD);
__declspec(dllimport) int __stdcall TlsSetValue(DWORD, void *);
__declspec(dllimport) void *__stdcall CreateEventA(void *, int, int, const char *);
__declspec(dllimport) int __stdcall SetEvent(void *);
__declspec(dllimport) int __stdcall ResetEvent(void *);
__declspec(dllimport) DWORD __stdcall WaitForSingleObject(void *, DWORD);
__declspec(dllimport) DWORD __stdcall WaitForMultipleObjects(DWORD, void *const *, int, DWORD);
__declspec(dllimport) void *__stdcall CreateThread(void *, DWORD, DWORD(__stdcall *)(void *), void *, DWORD, DWORD *);
__declspec(dllimport) DWORD __stdcall SuspendThread(void *);
__declspec(dllimport) DWORD __stdcall ResumeThread(void *);
__declspec(dllimport) long __stdcall InterlockedExchange(long volatile *, long);
}

extern void Com_InitThreadData(int index);

/*
 1.3 keeps per-thread value tables behind one TLS slot. Layout and use are read from
 retail 1.3 0x462360-0x462660 (PINNED by disassembly); the original function and
 variable names are unknown.
*/
static void *s_eventA;
static void *s_eventB;
static volatile long s_flag;
static void *s_threadValues0[5];
static void *s_threadValues1[5];
// retail 0xd528d8, spans 12 B: next object is at 0xd528e4
static DWORD s_threadId[3];
static void *s_threadHandle[2];
static void *s_eventC;
static DWORD s_tlsIndex;
static void *s_eventD;

void Sys_InitMainThread(void)
{
    void *proc = 0;
    void *self;

    s_threadId[0] = GetCurrentThreadId();
    self = GetCurrentThread();
    // retail passes the address of a zeroed local as the target process handle
    DuplicateHandle(proc, self, &proc, &s_threadHandle[0], 0, 0, 0);
    s_tlsIndex = TlsAlloc();
    TlsSetValue(s_tlsIndex, s_threadValues0);
    Com_InitThreadData(0);
}

// retail 0x4623c0, name unknown
static DWORD __stdcall Sys_ThreadMain(void *arg)
{
    TlsSetValue(s_tlsIndex, s_threadValues1);
    Com_InitThreadData(1);
    ((void (*)(void))arg)();
    return 0;
}

// retail 0x4623f0, name unknown
Bool Sys_CreateThread_4623f0(void (*threadMain)(void))
{
    s_eventC = CreateEventA(0, 0, 0, 0);
    s_eventD = CreateEventA(0, 1, 1, 0);
    s_eventA = CreateEventA(0, 1, 0, 0);
    s_eventB = CreateEventA(0, 0, 0, 0);
    s_threadHandle[1] = CreateThread(0, 0, Sys_ThreadMain, (void *)threadMain, 4, &s_threadId[1]);
    return s_threadHandle[1] != 0;
}

// retail 0x462460, name unknown
void Sys_ResumeThread_462460(int index)
{
    ResumeThread(s_threadHandle[index]);
}

// retail 0x462480, name unknown
long Sys_ClearFlag_462480(void)
{
    return InterlockedExchange(&s_flag, 0);
}

// retail 0x462490, name unknown
void Sys_SetEventD_462490(void)
{
    SetEvent(s_eventD);
}

// retail 0x4624a0, name unknown
void Sys_Handshake_4624a0(void)
{
    if (WaitForSingleObject(s_eventA, 0) != 0x102) {
        ResetEvent(s_eventA);
        SetEvent(s_eventB);
        WaitForSingleObject(s_eventC, 0xFFFFFFFF);
    }
}

// retail 0x4624e0, name unknown
void Sys_WaitEventD_4624e0(void)
{
    WaitForSingleObject(s_eventD, 0xFFFFFFFF);
}

// retail 0x4624f0, name unknown
void Sys_SignalB_4624f0(int value)
{
    ResetEvent(s_eventD);
    s_flag = value;
    SetEvent(s_eventB);
}

// retail 0x462520, name unknown
int Sys_EventAPending_462520(void)
{
    return WaitForSingleObject(s_eventA, 0) == 0x102;
}

// retail 0x462540, name unknown
void Sys_SignalCWaitA_462540(void)
{
    SetEvent(s_eventC);
    WaitForSingleObject(s_eventA, 0xFFFFFFFF);
}

// retail 0x462560, name unknown
int Sys_IsSecondThread_462560(void)
{
    return GetCurrentThreadId() == s_threadId[1];
}

int Sys_IsMainThread(void)
{
    return GetCurrentThreadId() == s_threadId[0];
}

void Sys_SetValue(int valueIndex, void *data)
{
    ((void **)TlsGetValue(s_tlsIndex))[valueIndex] = data;
}

void *Sys_GetValue(int valueIndex)
{
    void **values = (void **)TlsGetValue(s_tlsIndex);
    return values[valueIndex];
}

// retail 0x4625e0, name unknown
void Sys_WaitEventB_4625e0(void)
{
    WaitForMultipleObjects(1, &s_eventB, 0, 0xFFFFFFFF);
}

// retail 0x462600, name unknown
void Sys_SuspendOtherThreads_462600(void)
{
    DWORD cur = GetCurrentThreadId();
    int i;

    for (i = 0; i < 2; i++) {
        if (s_threadHandle[i] && s_threadId[i] && s_threadId[i] != cur)
            SuspendThread(s_threadHandle[i]);
    }
}

// retail 0x462640, name unknown
void Sys_SetEventA_462640(void)
{
    SetEvent(s_eventA);
}

Bool Sys_ReturnFalse(void)
{
    return 0;
}

// retail 0x462660, empty and unreferenced; name unknown
Bool Sys_ReturnFalse_462660(void)
{
    return 0;
}
