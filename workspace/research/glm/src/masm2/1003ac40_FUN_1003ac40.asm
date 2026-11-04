.686
.MODEL FLAT, C
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
.CODE
FUN_1003ac40 PROC
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    push push esi
    mov mov esi, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 3]
    mov mov word ptr [edx + esi*2], cx
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + edx*2 + 2], ax
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    lea lea ecx, [eax + 2]
    mov mov word ptr [edx + esi*2 + 4], cx
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov word ptr [edx + esi*2 + 6], cx
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + edx*2 + 8], ax
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea ecx, [eax + 1]
    mov mov word ptr [esi + edx*2 + 10], cx
    mov mov edx, dword ptr [esp + 8]
    xor xor ecx, ecx
    mov mov esi, 03F800000h
    movzx movzx eax, ax
    lea lea eax, [eax + eax*8]
    lea lea eax, [eax*4 + 0106D3200h]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], esi
    mov mov dword ptr [eax + 28], ecx
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 24], edx
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [eax + 52], ecx
    mov mov dword ptr [eax + 56], esi
    mov mov dword ptr [eax + 64], esi
    mov mov dword ptr [eax + 68], ecx
    mov mov dword ptr [eax + 60], edx
    mov mov dword ptr [eax + 84], ecx
    mov mov dword ptr [eax + 88], ecx
    mov mov dword ptr [eax + 92], esi
    mov mov dword ptr [eax + 100], esi
    mov mov dword ptr [eax + 104], esi
    mov mov dword ptr [eax + 96], edx
    mov mov dword ptr [eax + 120], ecx
    mov mov dword ptr [eax + 124], ecx
    mov mov dword ptr [eax + 080h], esi
    mov mov dword ptr [eax + 088h], ecx
    mov mov dword ptr [eax + 08Ch], esi
    mov mov dword ptr [eax + 084h], edx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    add add edx, 4
    add add ecx, 6
    mov mov dword ptr [g_1072D9D4], edx
    mov mov dword ptr [g_1072D9D0], ecx
    pop pop esi
    ret ret
FUN_1003ac40 ENDP
END
