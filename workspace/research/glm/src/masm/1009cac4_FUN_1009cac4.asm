.686
.MODEL FLAT, C
EXTRN sub_100637AF:PROC
EXTRN sub_100637C0:PROC
EXTRN sub_10099BC0:PROC
EXTRN sub_1009B5FB:PROC
EXTRN sub_1009B630:PROC
EXTRN sub_1009B7C1:PROC
EXTRN sub_1009B7F6:PROC
.CODE
FUN_1009cac4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, dword ptr [ebp + 12]
    xor esi, esi
    cmp edi, esi
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 4], esi
    je L6
    mov eax, dword ptr [ebx + 28]
    cmp eax, esi
    je L6
    lea ecx, [ebp - 20]
    push ecx
    push esi
    push dword ptr [eax + 24]
    call sub_100637AF
    test eax, eax
    jl L1
    lea eax, [ebp - 32]
    push eax
    push esi
    push dword ptr [edi + 24]
    call sub_100637C0
    test eax, eax
    jl L1
    mov eax, dword ptr [ebp - 28]
    cmp dword ptr [ebp - 16], eax
    je L7
    mov ecx, eax
    xor ecx, dword ptr [ebp - 16]
    test ecx, 0FFFF0000h
    jne L18
    mov ecx, 00000FFFFh
    test dword ptr [ebp - 16], ecx
    je L0
    test ecx, eax
    jne L18
L0:
    and eax, ecx
    neg eax
    sbb eax, eax
    inc eax
    inc eax
    mov dword ptr [ebp - 4], eax
    jmp L7
L1:
    mov eax, dword ptr [ebx + 28]
    mov esi, dword ptr [eax + 24]
    mov eax, dword ptr [edi + 24]
L2:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L4
    test cl, cl
    je L3
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L4
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L2
L3:
    xor eax, eax
    jmp L5
L4:
    sbb eax, eax
    sbb eax, -1
L5:
    test eax, eax
    je L7
    jmp L18
L6:
    xor eax, eax
    cmp dword ptr [ebx + 28], esi
    sete al
    xor ecx, ecx
    cmp edi, esi
    sete cl
    cmp ecx, eax
    je L7
    mov dword ptr [ebp - 4], 2
L7:
    mov edi, dword ptr [ebx + 36]
    test edi, edi
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp + 8], eax
    je L17
    mov eax, dword ptr [ebp + 20]
    and eax, 16
    mov dword ptr [ebp + 16], eax
L8:
    mov eax, dword ptr [edi + 8]
    mov edi, dword ptr [edi + 12]
    xor ecx, ecx
    test edi, edi
    je L9
    mov edx, dword ptr [edi + 8]
    cmp dword ptr [edx + 4], 12
    jne L9
    mov edi, dword ptr [edi + 12]
    inc ecx
L9:
    cmp dword ptr [ebp + 16], 0
    je L10
    mov edx, dword ptr [eax + 24]
    test byte ptr [edx + 28], 64
    je L16
L10:
    mov edx, dword ptr [ebp + 8]
    test edx, edx
    je L15
    mov esi, dword ptr [eax + 24]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    mov ebx, dword ptr [esi + 32]
    je L11
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp + 12], eax
    jmp L12
L11:
    and dword ptr [ebp + 12], 0
L12:
    test byte ptr [esi + 28], 16
    je L13
    mov ecx, dword ptr [ebp - 8]
    push 0
    push dword ptr [ebp + 12]
    push ebx
    call sub_1009B7C1
    test eax, eax
    je L18
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    push ebx
    call sub_1009B5FB
    add dword ptr [ebp - 4], eax
L13:
    test byte ptr [esi + 28], 32
    je L14
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    call sub_10099BC0
    test eax, eax
    jne L18
    mov ecx, dword ptr [ebp - 8]
    push eax
    push ebx
    push dword ptr [ebp + 12]
    call sub_1009B7F6
    test eax, eax
    je L18
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp + 12]
    call sub_1009B630
    add dword ptr [ebp - 4], eax
L14:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp + 8], eax
    jmp L16
L15:
    test ecx, ecx
    je L18
L16:
    test edi, edi
    jne L8
L17:
    cmp dword ptr [ebp + 8], 0
    je L19
L18:
    or eax, 0FFFFFFFFh
    jmp L20
L19:
    mov eax, dword ptr [ebp - 4]
L20:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_1009cac4 ENDP
END
