.686
.MODEL FLAT, C
EXTRN sub_101060F4:PROC
EXTRN sub_10106135:PROC
.CODE
__RoundMan PROC
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 12]
    dec edi
    push 32
    lea eax, [edi + 1]
    pop ecx
    cdq
    idiv ecx
    push 31
    pop esi
    sub esi, edx
    xor edx, edx
    inc edx
    mov ecx, esi
    shl edx, cl
    mov ebx, eax
    mov eax, dword ptr [ebp + 8]
    test dword ptr [eax + ebx*4], edx
    je L1
    lea ecx, [edi + 1]
    push ecx
    push eax
    call sub_101060F4
    test eax, eax
    pop ecx
    pop ecx
    jne L0
    push edi
    push dword ptr [ebp + 8]
    call sub_10106135
    pop ecx
    pop ecx
    mov dword ptr [ebp - 4], eax
L0:
    mov eax, dword ptr [ebp + 8]
L1:
    or edx, 0FFFFFFFFh
    mov ecx, esi
    shl edx, cl
    push 3
    pop ecx
    and dword ptr [eax + ebx*4], edx
    inc ebx
    cmp ebx, ecx
    jge L2
    lea edi, [eax + ebx*4]
    sub ecx, ebx
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
L2:
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
__RoundMan ENDP
END
