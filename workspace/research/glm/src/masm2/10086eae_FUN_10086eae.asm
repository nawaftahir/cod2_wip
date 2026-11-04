.686
.MODEL FLAT, C
EXTRN sub_1006C43D:PROC
EXTRN sub_10086F25:PROC
EXTRN sub_10086F46:PROC
.CODE
FUN_10086eae PROC
    mov mov edi, edi
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], edi
    jbe L0
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + edi*4]
    test test word ptr [ecx + 2], 0FFF0h
    jne L1
    push push 1
    call sub_1006C43D
    jmp L2
    mov mov dword ptr [eax + ebx*4], ecx
    inc inc ebx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L0
    mov mov ecx, dword ptr [esi + 12]
    xor xor eax, eax
    cmp cmp ebx, ecx
    jne sub_10086F25
    inc inc eax
    jmp sub_10086F46
    mov mov edx, dword ptr [esi + 24]
    sub sub ecx, ebx
    shl shl ecx, 2
L1:
    lea lea edi, [edx + ebx*4]
    mov mov edx, ecx
    shr shr ecx, 2
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov dword ptr [esi + 12], ebx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10086eae ENDP
END
