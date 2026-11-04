.686
.MODEL FLAT, C
EXTRN sub_1001E77F:PROC
EXTRN sub_1001E9CB:PROC
EXTRN sub_1001EAD5:PROC
EXTRN sub_1001EC81:PROC
EXTRN sub_1001EE2C:PROC
EXTRN sub_1001EE70:PROC
EXTRN sub_1001F15C:PROC
EXTRN sub_1001F15E:PROC
EXTRN sub_1001F169:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE770:DWORD:DWORD
EXTRN EXTRN g_101CE7E0:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
.CODE
FUN_1001f030 PROC
    mov mov ecx, dword ptr [edx + 8]
    test test ecx, ecx
    push push ebx
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [edx + 4]
    push push edi
    jl L0
    mov mov edx, dword ptr [g_101D49B0]
    lea lea edi, [ecx + edx]
    jmp L1
    mov mov edi, dword ptr [edx + 12]
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    movsx movsx ecx, word ptr [eax + 6]
    jne L4
    cmp cmp ecx, -1
    jne L3
    mov mov ecx, dword ptr [g_101CE770]
    mov mov dl, byte ptr [ecx + 8]
    test test dl, dl
    je L2
    mov mov edx, dword ptr [g_101CE7E0]
    mov mov cl, byte ptr [edx + 8]
    test test cl, cl
    je L5
    mov mov ebx, esi
    mov mov ecx, edi
    call sub_1001EAD5
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push esi
    mov mov ecx, edi
    call sub_1001EC81
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push edi
    mov mov edx, esi
    call sub_1001EE70
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp ecx, -1
    jne sub_1001F15E
    mov mov ecx, dword ptr [g_101CE770]
    mov mov dl, byte ptr [ecx + 8]
    test test dl, dl
    je sub_1001F15C
    mov mov edx, dword ptr [g_101CE7E0]
    mov mov cl, byte ptr [edx + 8]
    test test cl, cl
    je sub_1001F169
    mov mov ecx, eax
L2:
    mov mov edx, edi
L3:
    call sub_1001E77F
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push esi
L4:
    mov mov ecx, edi
    call sub_1001E9CB
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    mov mov edx, ecx
    push push esi
    mov mov ecx, edi
    call sub_1001EE2C
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_1001f030 ENDP
END
