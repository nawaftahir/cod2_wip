.686
.MODEL FLAT, C
EXTRN g_101CE708:DWORD
.CODE
FUN_100340f0 PROC
    mov edx, dword ptr [g_101CE708]
    push esi
    cmp dword ptr [edx + 8], 2
    mov edx, dword ptr [ecx]
    jne L0
    lea eax, [eax + eax*8]
    shl eax, 2
    mov dword ptr [eax + 0106D3200h], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 0106D3204h], edx
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0106D3208h], ecx
    xor ecx, ecx
    mov dword ptr [eax + 0106D320Ch], ecx
    mov dword ptr [eax + 0106D3210h], ecx
    mov dword ptr [eax + 0106D3214h], 03F800000h
    mov dword ptr [eax + 0106D3218h], edx
    mov dword ptr [eax + 0106D321Ch], ecx
    mov dword ptr [eax + 0106D3220h], ecx
    pop esi
    ret
L0:
    mov esi, dword ptr [esp + 8]
    shl eax, 6
    mov dword ptr [eax + 0106D3200h], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 0106D3204h], edx
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0106D3208h], ecx
    xor ecx, ecx
    mov edx, 03F800000h
    mov dword ptr [eax + 0106D320Ch], edx
    mov dword ptr [eax + 0106D3210h], ecx
    mov dword ptr [eax + 0106D3214h], ecx
    mov dword ptr [eax + 0106D3218h], edx
    mov dword ptr [eax + 0106D321Ch], esi
    mov dword ptr [eax + 0106D3228h], ecx
    mov dword ptr [eax + 0106D322Ch], edx
    mov dword ptr [eax + 0106D3230h], ecx
    mov dword ptr [eax + 0106D3234h], edx
    mov dword ptr [eax + 0106D3238h], ecx
    mov dword ptr [eax + 0106D323Ch], ecx
    mov dword ptr [eax + 0106D3220h], ecx
    mov dword ptr [eax + 0106D3224h], ecx
    pop esi
    ret
FUN_100340f0 ENDP
END
