.686
.MODEL FLAT, C
EXTRN sub_101060F4:PROC
EXTRN sub_10106135:PROC
EXTRN sub_101061B8:PROC
EXTRN sub_101061C5:PROC
EXTRN sub_10106206:PROC
.CODE
__RoundMan PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    dec dec edi
    push push 32
    lea lea eax, [edi + 1]
    pop pop ecx
    cdq cdq
    idiv idiv ecx
    push push 31
    pop pop esi
    sub sub esi, edx
    xor xor edx, edx
    inc inc edx
    mov mov ecx, esi
    shl shl edx, cl
    mov mov ebx, eax
    mov mov eax, dword ptr [ebp + 8]
    test test dword ptr [eax + ebx*4], edx
    je sub_101061B8
    lea lea ecx, [edi + 1]
    push push ecx
    push push eax
    call sub_101060F4
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_101061C5
    push push edi
    push push dword ptr [ebp + 8]
    call sub_10106135
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 8]
    or or edx, -1
    mov mov ecx, esi
    shl shl edx, cl
    push push 3
    pop pop ecx
    and and dword ptr [eax + ebx*4], edx
    inc inc ebx
    cmp cmp ebx, ecx
    jge sub_10106206
    lea lea edi, [eax + ebx*4]
    sub sub ecx, ebx
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
__RoundMan ENDP
END
