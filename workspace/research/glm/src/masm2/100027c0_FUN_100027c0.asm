.686
.MODEL FLAT, C
EXTRN sub_10002833:PROC
EXTRN sub_10002859:PROC
EXTRN sub_1000286F:PROC
EXTRN sub_10061D32:PROC
.CODE
FUN_100027c0 PROC
    push push ebp
    push push esi
    xor xor esi, esi
    xor xor edx, edx
    test test edi, edi
    jle L3
    add add eax, 6
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [eax - 6]
    cmp cmp ecx, dword ptr [esp + 12]
    jne L2
    mov mov ecx, dword ptr [eax + 2]
    mov mov ebp, dword ptr [ecx + 28]
    cmp cmp ebp, dword ptr [ebx + 28]
    jne L0
    mov mov cx, word ptr [ecx + 32]
    cmp cmp cx, word ptr [ebx + 32]
    je sub_10002859
    xor xor ecx, ecx
    mov mov cx, word ptr [eax]
    cmp cmp si, cx
    ja sub_10002833
    lea lea esi, [ecx + 1]
    inc inc edx
    add add eax, 12
    cmp cmp edx, edi
    jl L1
    cmp cmp si, 0800h
    jb sub_1000286F
    mov mov edx, dword ptr [esp + 12]
    mov mov eax, dword ptr [edx]
    push push 0800h
    push push eax
    push push 010191A08h
    push push 1
    call sub_10061D32
    add add esp, 16
    mov mov ax, si
    pop pop esi
    pop pop ebp
    ret ret
    mov mov ax, word ptr [eax]
    pop pop esi
L3:
    pop pop ebp
    ret ret
FUN_100027c0 ENDP
END
