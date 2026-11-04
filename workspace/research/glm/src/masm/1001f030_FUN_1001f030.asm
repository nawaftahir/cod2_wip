.686
.MODEL FLAT, C
EXTRN sub_1001E77F:PROC
EXTRN sub_1001E9CB:PROC
EXTRN sub_1001EAD5:PROC
EXTRN sub_1001EC81:PROC
EXTRN sub_1001EE2C:PROC
EXTRN sub_1001EE70:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE770:DWORD
EXTRN g_101CE7E0:DWORD
EXTRN g_101D49B0:DWORD
.CODE
FUN_1001f030 PROC
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [edx + 4]
    push edi
    jl L0
    mov edx, dword ptr [g_101D49B0]
    lea edi, [ecx + edx]
    jmp L1
L0:
    mov edi, dword ptr [edx + 12]
L1:
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    movsx ecx, word ptr [eax + 6]
    jne L4
    cmp ecx, -1
    jne L3
    mov ecx, dword ptr [g_101CE770]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L2
    mov edx, dword ptr [g_101CE7E0]
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L2
    mov ebx, esi
    mov ecx, edi
    call sub_1001EAD5
    pop edi
    pop esi
    pop ebx
    ret
L2:
    push esi
    mov ecx, edi
    call sub_1001EC81
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
L3:
    push edi
    mov edx, esi
    call sub_1001EE70
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
L4:
    cmp ecx, -1
    jne L6
    mov ecx, dword ptr [g_101CE770]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L5
    mov edx, dword ptr [g_101CE7E0]
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L5
    mov ecx, eax
    mov edx, edi
    call sub_1001E77F
    pop edi
    pop esi
    pop ebx
    ret
L5:
    push esi
    mov ecx, edi
    call sub_1001E9CB
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
L6:
    mov edx, ecx
    push esi
    mov ecx, edi
    call sub_1001EE2C
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
FUN_1001f030 ENDP
END
