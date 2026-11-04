.686
.MODEL FLAT, C
EXTRN sub_1003DEAB:PROC
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003eea0 PROC
    mov mov eax, dword ptr [g_10730550]
    mov mov edx, dword ptr [ecx + 8]
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEF0h
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [eax + 8], edx
    xor xor edx, edx
    mov mov dword ptr [eax + 12], edx
    push push esi
    mov mov esi, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 16], esi
    mov mov esi, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 20], esi
    mov mov esi, dword ptr [ecx + 28]
    mov mov dword ptr [eax + 24], esi
    mov mov dword ptr [eax + 28], edx
    mov mov esi, dword ptr [ecx + 32]
    mov mov dword ptr [eax + 32], esi
    mov mov esi, dword ptr [ecx + 36]
    mov mov dword ptr [eax + 36], esi
    mov mov esi, dword ptr [ecx + 40]
    mov mov dword ptr [eax + 40], esi
    mov mov dword ptr [eax + 44], edx
    mov mov edx, dword ptr [ecx + 44]
    mov mov dword ptr [eax + 48], edx
    mov mov edx, dword ptr [ecx + 48]
    mov mov dword ptr [eax + 52], edx
    mov mov ecx, dword ptr [ecx + 52]
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 56], ecx
    mov mov dword ptr [eax + 60], 03F800000h
    mov mov eax, dword ptr [edx + 56]
    pop pop esi
    mov mov dword ptr [esp + 4], eax
    jmp sub_1003DEAB
FUN_1003eea0 ENDP
END
