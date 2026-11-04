.686
.MODEL FLAT, C
EXTRN sub_10106BF3:PROC
.CODE
FID_conflict:@x64toa@20 PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    xor ecx, ecx
    cmp dword ptr [ebp + 20], ecx
    mov esi, eax
    mov eax, dword ptr [ebp + 12]
    push edi
    je L0
    mov byte ptr [esi], 45
    inc esi
    neg ebx
    adc eax, ecx
    neg eax
L0:
    mov edi, esi
    mov dword ptr [ebp + 12], ecx
L1:
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 16]
    push eax
    push ebx
    call sub_10106BF3
    cmp ecx, 9
    mov dword ptr [ebp - 4], ebx
    mov ebx, eax
    mov eax, edx
    jbe L2
    add cl, 87
    jmp L3
L2:
    add cl, 48
L3:
    mov byte ptr [esi], cl
    inc esi
    test eax, eax
    ja L1
    jb L4
    test ebx, ebx
    ja L1
L4:
    mov byte ptr [esi], 0
    dec esi
L5:
    mov cl, byte ptr [edi]
    mov al, byte ptr [esi]
    mov byte ptr [esi], cl
    dec esi
    mov byte ptr [edi], al
    inc edi
    cmp edi, esi
    jb L5
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FID_conflict:@x64toa@20 ENDP
END
