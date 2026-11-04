.686
.MODEL FLAT, C
EXTRN sub_10012779:PROC
EXTRN g_101D1BF4:DWORD
.CODE
FUN_100127d0 PROC
    push ebx
    push ebp
    push esi
    push edi
    call sub_10012779
    mov edi, eax
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push eax
    xor ebp, ebp
    call dword ptr [ecx + 0x10]
    mov ebx, eax
    xor esi, esi
    test ebx, ebx
    jbe L2
L0:
    test edi, edi
    je L1
    mov eax, dword ptr [g_101D1BF4]
    mov edx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [edx + 0x3c]
    cmp eax, edi
    jne L1
    mov ebp, esi
L1:
    inc esi
    cmp esi, ebx
    jb L0
L2:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_100127d0 ENDP
END
