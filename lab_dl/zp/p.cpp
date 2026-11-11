#include <string.h>
#include <stdio.h>
char *Parse(const char *a, const char *b, int c);
void SACopy(char **d, const char *s);
void Free(void *p);
void *Alloc(int n);
int Load(const char *u, void *r, const char *f);
void Create(char *p);
void Prof(void);
void Print(const char *f, ...);
void Unesc(char *p);
void Timeout(int t);
void *NewReq(void);
void Init(void *r);
void Cancel(void);
void DLInit(void);
static int running, force, status;
static void *req;
struct S { char *f; } gs;
char *gp;
static void FreeNull(char **p) { Free(*p); *p = NULL; }

#ifdef PS
#pragma optimize("s", on)
#endif
#ifdef PT
#pragma optimize("t", off)
#endif
int probe(char *localName, const char *remoteUrl)
{
#if V == 41
    char *ru[1] = { NULL };
#define requestUrl ru[0]
#elif V == 42
    struct { char *p; } ru = { NULL };
#define requestUrl ru.p
#elif V == 30
    char * volatile requestUrl = NULL;
#elif V == 15
    void *requestUrl = NULL;
#elif V == 7
    char *requestUrl;
#else
    char *requestUrl = NULL;
#endif
    char *scheme, *host, *path, *sep;
#if V == 38
    char **pu = &requestUrl;
#endif

    if (running)
        Cancel();
    status = -1000;
#if V == 21
    if (status == 5)
#else
    if (!localName || !remoteUrl)
#endif
    {
        Print("empty\n");
        return 0;
    }
    DLInit();
    scheme = Parse(remoteUrl, "", 16);
    if (!stricmp(scheme, "ftp")) { force = 1; Timeout(-1); }
    else { force = 0; Timeout(30000); }
    req = NewReq();
#if V == 7
    requestUrl = NULL;
#endif
    if (!stricmp(scheme, "http"))
    {
        host = Parse(remoteUrl, "", 8);
        path = Parse(remoteUrl, "", 5);
        sep = strchr(host, '@');
        if (sep)
        {
            char *pw;
            *sep = 0;
            pw = strchr(host, ':');
            if (pw) { *pw++ = 0; Unesc(pw); }
            Unesc(host);
            sep++;
            requestUrl = (char *)Alloc(strlen(sep) + strlen(path) + 8);
            sprintf((char *)requestUrl, "http://%s%s", sep, path);
            Print("auth %s %s %s\n", host, pw, requestUrl);
            Free(host);
            Free(path);
        }
#if V == 43
        else
            goto copy;
    }
    else
    {
copy:
        SACopy((char **)&requestUrl, remoteUrl);
    }
#else
        else
            SACopy((char **)&requestUrl, remoteUrl);
    }
    else
        SACopy((char **)&requestUrl, remoteUrl);
#endif

    Free(scheme);
    Create(localName);
#if V == 1
    // stores via global pointer instead of the local
#endif
#if V == 44
    {
        int ok = Load(requestUrl, req, localName);
        if (ok != 1)
            Print("fail\n");
        Free(requestUrl);
        requestUrl = NULL;
        if (ok != 1)
        {
            Prof();
            return 0;
        }
    }
    if (0)
#else
    if (Load(requestUrl, req, localName) != 1)
#endif
    {
#if V == 4
        Free(requestUrl);
        requestUrl = NULL;
        Print("fail\n");
#elif V == 28
        Print("fail\n");
        FreeNull((char **)&requestUrl);
#else
        Print("fail\n");
        Free(requestUrl);
#if V == 14
        gs.f = NULL;
#elif V == 24
        force = 0;
#elif V == 25
        *(int *)&requestUrl = 0;
#elif V == 16
        gp = NULL;
#elif V == 31
        *(char * volatile *)&requestUrl = NULL;
#elif V == 38
        *pu = NULL;
#elif V == 32
        memset(&requestUrl, 0, sizeof(requestUrl));
#elif V != 2
        requestUrl = NULL;
#endif
#endif
        Prof();
        return 0;
    }
#if V == 28
    FreeNull((char **)&requestUrl);
#elif V == 44
#else
    Free(requestUrl);
#if V == 31
    *(char * volatile *)&requestUrl = NULL;
#elif V == 38
    *pu = NULL;
#elif V == 32
    memset(&requestUrl, 0, sizeof(requestUrl));
#elif V != 3 && V != 44
    requestUrl = NULL;
#endif
#endif
    host = Parse(remoteUrl, "", 8);
#if V == 3
    requestUrl = NULL;
#endif
#if V == 22
    Print("%s %s", host, localName);
#else
    Print("%s", host);
#endif
    Free(host);
    Init(req);
    running = 1;
    return 1;
}
