.686
.MODEL FLAT, C
EXTRN sub_10061D32:PROC
.CODE
FUN_100027c0 PROC
    push ebp
    push esi
    xor esi, esi
    xor edx, edx
    test edi, edi
    jle L3
    add eax, 6
    lea ecx, [ecx]
L0:
    mov ecx, dword ptr [eax - 6]
    cmp ecx, dword ptr [esp + 12]
    jne L2
    mov ecx, dword ptr [eax + 2]
    mov ebp, dword ptr [ecx + 28]
    cmp ebp, dword ptr [ebx + 28]
    jne L1
    mov cx, word ptr [ecx + 32]
    cmp cx, word ptr [ebx + 32]
    je L4
L1:
    xor ecx, ecx
    mov cx, word ptr [eax]
    cmp si, cx
    ja L2
    lea esi, [ecx + 1]
L2:
    inc edx
    add eax, 12
    cmp edx, edi
    jl L0
    cmp si, 000000800h
    jb L3
    mov edx, dword ptr [esp + 12]
    mov eax, dword ptr [edx]
    push 000000800h
    push eax
    push 010191A08h
    push 1
    call sub_10061D32
    add esp, 16
L3:
    mov ax, si
    pop esi
    pop ebp
    ret
L4:
    mov ax, word ptr [eax]
    pop esi
    pop ebp
    ret
FUN_100027c0 ENDP
END
