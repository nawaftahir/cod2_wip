.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1002e640 PROC
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], 2
    jne L0
    fld fld dword ptr [g_1019BC78]
    lea lea eax, [eax + eax*8]
    fdiv fdiv dword ptr [esp + 16]
    shl shl eax, 2
    xor xor ecx, ecx
    fld fld dword ptr [esp + 4]
    fmul fmul st(1)
    fstp fstp dword ptr [eax + 0106D3200h]
    fld fld dword ptr [esp + 8]
    fmul fmul st(1)
    fstp fstp dword ptr [eax + 0106D3204h]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [eax + 0106D3208h]
    mov mov dword ptr [eax + 0106D320Ch], ecx
    mov mov dword ptr [eax + 0106D3210h], ecx
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [eax + 0106D3214h], 03F800000h
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [eax + 0106D3218h], edx
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [eax + 0106D321Ch], ecx
    mov mov dword ptr [eax + 0106D3220h], edx
    ret ret
    mov mov ecx, dword ptr [esp + 4]
    shl shl eax, 6
    mov mov dword ptr [eax + 0106D3200h], ecx
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 0106D3204h], ecx
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [eax + 0106D3208h], ecx
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [eax + 0106D320Ch], ecx
    mov mov dword ptr [eax + 0106D3218h], 03F800000h
    xor xor ecx, ecx
    mov mov dword ptr [eax + 0106D3210h], ecx
    mov mov dword ptr [eax + 0106D3214h], ecx
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [eax + 0106D321Ch], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [eax + 0106D3220h], edx
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [eax + 0106D3224h], edx
    mov mov dword ptr [eax + 0106D3234h], 03F800000h
    mov mov dword ptr [eax + 0106D3238h], ecx
    mov mov dword ptr [eax + 0106D323Ch], ecx
    mov mov dword ptr [eax + 0106D3228h], ecx
    mov mov dword ptr [eax + 0106D322Ch], 03F800000h
    mov mov dword ptr [eax + 0106D3230h], ecx
    ret ret
FUN_1002e640 ENDP
END
