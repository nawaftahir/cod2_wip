.686
.MODEL FLAT, C
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
.CODE
FUN_1003ad40 PROC
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    push push esi
    mov mov esi, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 3]
    mov mov word ptr [edx + esi*2], cx
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov word ptr [ecx + edx*2 + 2], ax
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov esi, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 2]
    mov mov word ptr [edx + esi*2 + 4], cx
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov word ptr [edx + esi*2 + 6], cx
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov word ptr [ecx + edx*2 + 8], ax
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea ecx, [eax + 1]
    mov mov word ptr [esi + edx*2 + 10], cx
    mov mov esi, dword ptr [esp + 8]
    xor xor ecx, ecx
    mov mov edx, 03F800000h
    movzx movzx eax, ax
    shl shl eax, 6
    add add eax, 0106D3200h
    mov mov dword ptr [eax + 24], edx
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 28], esi
    mov mov dword ptr [eax + 52], edx
    mov mov dword ptr [eax + 56], ecx
    mov mov dword ptr [eax + 60], ecx
    mov mov dword ptr [eax + 44], edx
    mov mov dword ptr [eax + 40], ecx
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [eax + 88], edx
    mov mov dword ptr [eax + 80], ecx
    mov mov dword ptr [eax + 84], ecx
    mov mov dword ptr [eax + 96], edx
    mov mov dword ptr [eax + 100], ecx
    mov mov dword ptr [eax + 92], esi
    mov mov dword ptr [eax + 116], edx
    mov mov dword ptr [eax + 120], ecx
    mov mov dword ptr [eax + 124], ecx
    mov mov dword ptr [eax + 108], edx
    mov mov dword ptr [eax + 104], ecx
    mov mov dword ptr [eax + 112], ecx
    mov mov dword ptr [eax + 098h], edx
    mov mov dword ptr [eax + 090h], ecx
    mov mov dword ptr [eax + 094h], ecx
    mov mov dword ptr [eax + 0A0h], edx
    mov mov dword ptr [eax + 0A4h], edx
    mov mov dword ptr [eax + 09Ch], esi
    mov mov dword ptr [eax + 0B4h], edx
    mov mov dword ptr [eax + 0B8h], ecx
    mov mov dword ptr [eax + 0BCh], ecx
    mov mov dword ptr [eax + 0ACh], edx
    mov mov dword ptr [eax + 0A8h], ecx
    mov mov dword ptr [eax + 0B0h], ecx
    mov mov dword ptr [eax + 0D8h], edx
    mov mov dword ptr [eax + 0D0h], ecx
    mov mov dword ptr [eax + 0D4h], ecx
    mov mov dword ptr [eax + 0E4h], edx
    mov mov dword ptr [eax + 0E0h], ecx
    mov mov dword ptr [eax + 0DCh], esi
    mov mov dword ptr [eax + 0F4h], edx
    mov mov dword ptr [eax + 0F8h], ecx
    mov mov dword ptr [eax + 0FCh], ecx
    mov mov dword ptr [eax + 0ECh], edx
    mov mov dword ptr [eax + 0E8h], ecx
    mov mov dword ptr [eax + 0F0h], ecx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    add add edx, 4
    mov mov dword ptr [g_1072D9D4], edx
    add add ecx, 6
    mov mov dword ptr [g_1072D9D0], ecx
    pop pop esi
    ret ret
FUN_1003ad40 ENDP
END
