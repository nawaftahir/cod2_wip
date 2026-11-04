.686
.MODEL FLAT, C
EXTRN g_101CE708:DWORD
.CODE
FUN_1002e550 PROC
    push esi
    mov esi, ecx
    mov ecx, dword ptr [g_101CE708]
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [esp + 12]
    cmp edx, 2
    mov edx, dword ptr [esp + 8]
    jne L0
    lea eax, [eax + eax*8]
    shl eax, 2
    mov dword ptr [eax + 0106D3200h], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 0106D3204h], ecx
    mov dword ptr [eax + 0106D3208h], edx
    mov edx, dword ptr [esp + 20]
    xor ecx, ecx
    mov dword ptr [eax + 0106D320Ch], ecx
    mov dword ptr [eax + 0106D3210h], ecx
    mov dword ptr [eax + 0106D3214h], 03F800000h
    mov ecx, dword ptr [esi]
    mov dword ptr [eax + 0106D3218h], ecx
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D321Ch], edx
    mov dword ptr [eax + 0106D3220h], ecx
    pop esi
    ret
L0:
    shl eax, 6
    mov dword ptr [eax + 0106D3200h], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 0106D3208h], edx
    mov dword ptr [eax + 0106D3204h], ecx
    xor ecx, ecx
    mov edx, 03F800000h
    mov dword ptr [eax + 0106D320Ch], edx
    mov dword ptr [eax + 0106D3210h], ecx
    mov dword ptr [eax + 0106D3214h], ecx
    mov dword ptr [eax + 0106D3218h], edx
    mov esi, dword ptr [esi]
    mov dword ptr [eax + 0106D321Ch], esi
    mov esi, dword ptr [esp + 20]
    mov dword ptr [eax + 0106D3220h], esi
    mov esi, dword ptr [esp + 24]
    mov dword ptr [eax + 0106D3224h], esi
    mov dword ptr [eax + 0106D3234h], edx
    mov dword ptr [eax + 0106D3238h], ecx
    mov dword ptr [eax + 0106D323Ch], ecx
    mov dword ptr [eax + 0106D3228h], ecx
    mov dword ptr [eax + 0106D322Ch], edx
    mov dword ptr [eax + 0106D3230h], ecx
    pop esi
    ret
FUN_1002e550 ENDP
END
