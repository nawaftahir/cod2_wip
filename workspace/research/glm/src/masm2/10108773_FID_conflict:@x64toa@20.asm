.686
.MODEL FLAT, C
EXTRN sub_10106BF3:PROC
EXTRN sub_101087E7:PROC
EXTRN sub_101087ED:PROC
EXTRN sub_101087F6:PROC
EXTRN sub_101087FE:PROC
EXTRN sub_10108817:PROC
EXTRN sub_10108831:PROC
.CODE
FID_conflict:@x64toa@20 PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 20], ecx
    mov mov esi, eax
    mov mov eax, dword ptr [ebp + 12]
    push push edi
    je L0
    mov mov byte ptr [esi], 45
    inc inc esi
    neg neg ebx
    adc adc eax, ecx
    neg neg eax
    mov mov edi, esi
    mov mov dword ptr [ebp + 12], ecx
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 16]
    push push eax
    push push ebx
    call sub_10106BF3
    cmp cmp ecx, 9
    mov mov dword ptr [ebp - 4], ebx
    mov mov ebx, eax
    mov mov eax, edx
    jbe sub_101087F6
    add add cl, 87
    jmp sub_101087FE
    add add cl, 48
    mov mov byte ptr [esi], cl
    inc inc esi
    test test eax, eax
    ja sub_101087E7
    jb sub_10108817
    test test ebx, ebx
    ja sub_101087ED
    mov mov byte ptr [esi], 0
    dec dec esi
    mov mov cl, byte ptr [edi]
    mov mov al, byte ptr [esi]
    mov mov byte ptr [esi], cl
    dec dec esi
    mov mov byte ptr [edi], al
    inc inc edi
    cmp cmp edi, esi
    jb sub_10108831
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FID_conflict:@x64toa@20 ENDP
END
