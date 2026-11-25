// Renderer export table `re` (0x59c300, 0x1fc bytes, filled by GetRefAPI). Only the slots used so far are typed.
#ifndef REFEXPORT_H
#define REFEXPORT_H

struct refexport_t
{
    union
    {
        void *fn[0x7f];
        struct
        {
            unsigned char pad000[0x10];
            void *(*field_10)(const char *name, int type, int flags);
            unsigned char pad014[4];
            char (*field_18)(void *handle);
            unsigned char pad01c[0x94 - 0x1c];
            void (*field_94)(const float *color);
            void (*field_98)(float x, float y, float w, float h, float s0, float t0, float s1, float t1,
                             const float *color, void *material);
            unsigned char pad09c[0xac - 0x9c];
            void (*BeginScene)();
            void (*EndScene)();
            unsigned char pad0b4[0xc4 - 0xb4];
            void (*ClearScreen)(int mask, const float *color, float depth, int stencil);
            unsigned char pad0c8[0x114 - 0xc8];
            int (*field_114)(int arg);
            void (*field_118)(const char *text, int maxChars, int font, float x, float y,
                              float xScale, float yScale, const float *color, int style);
            void (*DrawText)(const char *text, int font, const float *origin, const float *right, const float *up, const float *color);
            unsigned char pad120[0x138 - 0x120];
            void (*field_138)(void *handle, void *info);
            unsigned char pad13c[4];
            bool (*BeginWindow)(HWND hwnd);
            void (*EndWindow)(HWND hwnd);
            void (*ResizeWindow)(HWND hwnd, int width, int height);
            unsigned char pad14c[0x154 - 0x14c];
            void (*SetupZ)(const float *origin, const float *axis, float scale);
            void (*SetupCamera)(const float *origin, float (*axis)[3], float fovX, float fovY);
            void (*DrawPoints)(int count, int size, const void *verts);
            void (*AddLines)(int count, int width, const void *verts);
            void (*DrawTris)(void *material, int a, int indexCount, const unsigned short *indices, int vertCount,
                             float (*xyzw)[4], float (*normal)[3], const unsigned int *colors, float (*st)[2]);
            void (*ColorToBytes)(const float *color, void *out);
            unsigned char pad16c[0x178 - 0x16c];
            void (*BeginBrushes)();
            void (*EndBrushes)();
            unsigned char pad180[0x1b0 - 0x180];
            void (*field_1b0)();
        };
    };
};
extern refexport_t re;

#endif
