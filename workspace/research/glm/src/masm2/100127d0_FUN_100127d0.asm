.686
.MODEL FLAT, C
EXTRN sub_10012779:PROC
EXTRN sub_1001282A:PROC
EXTRN sub_1001282B:PROC
EXTRN sub_1001283A:PROC
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
.CODE
FUN_100127d0 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    call sub_10012779
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push eax
    xor xor ebp, ebp
    call call dword ptr [ecx + 16]
    mov mov ebx, eax
    xor xor esi, esi
    test test ebx, ebx
    jbe sub_1001282B
    test test edi, edi
    je sub_1001282A
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov edx, dword ptr [eax]
    push push esi
    push push eax
    call call dword ptr [edx + 60]
    cmp cmp eax, edi
    jne sub_1001283A
    mov mov ebp, esi
    inc inc esi
    cmp cmp esi, ebx
    jb sub_1001282B
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    ret ret
FUN_100127d0 ENDP
END
