.686
.MODEL FLAT, C
EXTRN sub_1008B1FD:PROC
EXTRN sub_100C4DF1:PROC
EXTRN sub_100C9994:PROC
.CODE
FUN_100ca44c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    test byte ptr [esi + 110], 64
    mov eax, dword ptr [esi + 000000100h]
    push edi
    je L3
    mov edi, dword ptr [eax + 4]
    xor edx, edx
    test edi, edi
    jbe L1
    mov ebx, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + 8]
L0:
    mov edi, dword ptr [ecx]
    mov edi, dword ptr [ebx + edi*4]
    cmp dword ptr [edi + 16], edx
    jne L2
    mov edi, dword ptr [eax + 4]
    inc edx
    add ecx, 4
    cmp edx, edi
    jb L0
L1:
    cmp edi, 3
    je L4
    push 01011A874h
    jmp L9
L2:
    push 01011A850h
    jmp L9
L3:
    cmp dword ptr [eax + 4], 4
    je L4
    push 01011A810h
    jmp L9
L4:
    mov ecx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [esi + 000000080h]
    jne L5
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push edx
    mov ecx, esi
    call dword ptr [eax + 0x88]
    test eax, eax
    jge L6
    push 01011A2D0h
    push 000001194h
    push 0
    jmp L10
L5:
    cmp ecx, dword ptr [esi + 000000088h]
    jne L8
    xor ecx, ecx
    mov dword ptr [ebp - 4], ecx
    mov eax, dword ptr [edx + 12]
    mov dword ptr [ebp - 8], eax
    jmp L7
L6:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 8]
L7:
    mov edi, ecx
    or edi, 0FFFFFFF8h
    shl edi, 20
    and ecx, 24
    or edi, ecx
    and eax, 0000007FFh
    shl edi, 8
    push 65
    mov ecx, esi
    or edi, eax
    call sub_100C9994
    test eax, eax
    jl L11
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x7c]
    test eax, eax
    jl L11
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push 0000F0000h
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L11
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L11
    mov ecx, esi
    call sub_100C4DF1
    test eax, eax
    jl L11
    xor eax, eax
    jmp L11
L8:
    push 01011A7DCh
L9:
    push 000001194h
    push dword ptr [eax + 60]
L10:
    push esi
    call sub_1008B1FD
    add esp, 16
    mov eax, 080004005h
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100ca44c ENDP
END
