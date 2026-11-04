.686
.MODEL FLAT, C
EXTRN sub_1003DEAB:PROC
EXTRN g_10730550:DWORD
.CODE
FUN_1003eea0 PROC
    mov eax, dword ptr [g_10730550]
    mov edx, dword ptr [ecx + 8]
    imul eax, eax, 000000CD0h
    add eax, 01072DEF0h
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [eax + 8], edx
    xor edx, edx
    mov dword ptr [eax + 12], edx
    push esi
    mov esi, dword ptr [ecx + 20]
    mov dword ptr [eax + 16], esi
    mov esi, dword ptr [ecx + 24]
    mov dword ptr [eax + 20], esi
    mov esi, dword ptr [ecx + 28]
    mov dword ptr [eax + 24], esi
    mov dword ptr [eax + 28], edx
    mov esi, dword ptr [ecx + 32]
    mov dword ptr [eax + 32], esi
    mov esi, dword ptr [ecx + 36]
    mov dword ptr [eax + 36], esi
    mov esi, dword ptr [ecx + 40]
    mov dword ptr [eax + 40], esi
    mov dword ptr [eax + 44], edx
    mov edx, dword ptr [ecx + 44]
    mov dword ptr [eax + 48], edx
    mov edx, dword ptr [ecx + 48]
    mov dword ptr [eax + 52], edx
    mov ecx, dword ptr [ecx + 52]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 56], ecx
    mov dword ptr [eax + 60], 03F800000h
    mov eax, dword ptr [edx + 56]
    pop esi
    mov dword ptr [esp + 4], eax
    jmp sub_1003DEAB
FUN_1003eea0 ENDP
END
