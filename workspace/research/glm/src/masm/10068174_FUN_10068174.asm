.686
.MODEL FLAT, C
EXTRN sub_10067CAA:PROC
.CODE
FUN_10068174 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ecx + 4]
    cmp ebx, edi
    mov dword ptr [ebp - 4], ecx
    jae L6
    cmp byte ptr [ebx], 48
    jne L6
    push esi
    xor eax, eax
    xor ecx, ecx
    lea esi, [ebx + 1]
    jmp L2
L0:
    mov dl, byte ptr [esi]
    cmp dl, 48
    jl L3
    cmp dl, 55
    jg L3
    test eax, 0E0000000h
    je L1
    xor ecx, ecx
    inc ecx
L1:
    movsx edx, dl
    lea eax, [edx + eax*8 - 48]
    inc esi
L2:
    cmp esi, edi
    jb L0
L3:
    mov edx, dword ptr [ebp + 12]
    test edx, edx
    je L4
    mov dword ptr [edx], eax
L4:
    test ecx, ecx
    je L5
    mov eax, dword ptr [ebp - 4]
    push 01010CB38h
    push 0000003EBh
    lea ecx, [eax + 8]
    push ecx
    push dword ptr [eax + 48]
    call sub_10067CAA
    add esp, 16
L5:
    mov eax, esi
    sub eax, ebx
    pop esi
    jmp L7
L6:
    xor eax, eax
L7:
    pop edi
    pop ebx
    leave
    ret 8
FUN_10068174 ENDP
END
