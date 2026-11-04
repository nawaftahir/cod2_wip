.686
.MODEL FLAT, C
EXTRN sub_1006C43D:PROC
.CODE
FUN_10086eae PROC
    mov edi, edi
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L3
L0:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + edi*4]
    test word ptr [ecx + 2], 00000FFF0h
    jne L1
    push 1
    call sub_1006C43D
    jmp L2
L1:
    mov dword ptr [eax + ebx*4], ecx
    inc ebx
L2:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L0
L3:
    mov ecx, dword ptr [esi + 12]
    xor eax, eax
    cmp ebx, ecx
    jne L4
    inc eax
    jmp L5
L4:
    mov edx, dword ptr [esi + 24]
    sub ecx, ebx
    shl ecx, 2
    lea edi, [edx + ebx*4]
    mov edx, ecx
    shr ecx, 2
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov dword ptr [esi + 12], ebx
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10086eae ENDP
END
