.686
.MODEL FLAT, C
EXTRN sub_1008B292:PROC
EXTRN sub_1008B39F:PROC
.CODE
FUN_100c44a5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 4]
    mov esi, ecx
    cmp dword ptr [esi + 000000088h], eax
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + eax*4]
    mov ebx, 000040000h
    jne L2
    mov eax, dword ptr [edi + 12]
    and dword ptr [ebp + 8], 0
    cmp eax, dword ptr [esi + 44]
    mov dword ptr [ebp - 8], eax
    jb L1
    push 01011A2A8h
L0:
    push 000001199h
    jmp L16
L1:
    mov ecx, dword ptr [esi + 80]
    test ecx, ecx
    je L5
    cmp eax, ecx
    jb L5
    sub eax, ecx
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp + 8], 3
    jmp L5
L2:
    mov ecx, dword ptr [ecx + 4]
    mov edx, ecx
    and edx, 16
    je L4
    test cl, 4
    je L4
    mov dword ptr [ebp + 8], 15
    xor eax, eax
L3:
    mov dword ptr [ebp - 8], eax
    jmp L5
L4:
    test edx, edx
    mov eax, 000000200h
    je L6
    test eax, ecx
    jne L6
    mov eax, dword ptr [esi]
    lea ecx, [ebp + 8]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x88]
    test eax, eax
    jl L34
    mov eax, dword ptr [ebp - 8]
L5:
    mov ecx, dword ptr [edi + 60]
    and dword ptr [ebp - 4], 0
    and ecx, 0001F0000h
    cmp ecx, 000100000h
    jne L17
    mov dword ptr [ebp - 4], 00B000000h
    jmp L26
L6:
    mov edx, ecx
    and edx, eax
    je L11
    test ecx, 000042080h
    jne L11
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 56]
    mov dword ptr [ebp - 8], eax
    jb L7
    push 010119E50h
    push 00000119Bh
    jmp L16
L7:
    cmp eax, 000000800h
    jae L8
    mov dword ptr [ebp + 8], 2
    jmp L10
L8:
    cmp eax, 000001000h
    jae L9
    mov dword ptr [ebp + 8], 11
    jmp L10
L9:
    cmp eax, 000001800h
    sbb ecx, ecx
    add ecx, 13
    mov dword ptr [ebp + 8], ecx
L10:
    and eax, 0000007FFh
    jmp L3
L11:
    test edx, edx
    je L12
    test cl, cl
    js L13
    test ch, 32
    je L12
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 96]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp + 8], 14
    jb L5
    push 01011A354h
    push 000001194h
    jmp L16
L12:
    test cl, cl
    jns L14
L13:
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 76]
    mov dword ptr [ebp + 8], 10
    mov dword ptr [ebp - 8], eax
    jb L5
    push 010119F18h
    jmp L0
L14:
    test ebx, ecx
    je L15
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 64]
    mov dword ptr [ebp + 8], 7
    mov dword ptr [ebp - 8], eax
    jb L5
    push 01011A32Ch
    jmp L0
L15:
    mov eax, dword ptr [esi + 000000090h]
    cmp eax, dword ptr [edi + 4]
    jne L31
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [esi + 52]
    mov dword ptr [ebp + 8], 19
    mov dword ptr [ebp - 8], eax
    jb L5
    push 01011A254h
    push 0000011C5h
L16:
    mov eax, dword ptr [esi + 000000100h]
    push dword ptr [eax + 60]
    push esi
    call sub_1008B292
    mov eax, 088760B59h
    jmp L33
L17:
    cmp ecx, 000180000h
    jne L18
    mov dword ptr [ebp - 4], 00C000000h
    jmp L26
L18:
    cmp ecx, 000080000h
    jne L19
    mov dword ptr [ebp - 4], 001000000h
    jmp L26
L19:
    cmp ecx, 000020000h
    jne L20
    mov dword ptr [ebp - 4], 002000000h
    jmp L26
L20:
    cmp ecx, 0000A0000h
    jne L21
    mov dword ptr [ebp - 4], 003000000h
    jmp L26
L21:
    cmp ecx, 000060000h
    jne L22
    mov dword ptr [ebp - 4], 004000000h
    jmp L26
L22:
    cmp ecx, 0000E0000h
    jne L23
    mov dword ptr [ebp - 4], 005000000h
    jmp L26
L23:
    cmp ecx, 000010000h
    jne L24
    mov dword ptr [ebp - 4], 006000000h
    jmp L26
L24:
    cmp ecx, ebx
    jne L25
    mov dword ptr [ebp - 4], 007000000h
    jmp L26
L25:
    cmp ecx, 0000C0000h
    jne L26
    mov dword ptr [ebp - 4], 008000000h
L26:
    mov ecx, dword ptr [ebp + 12]
    test ecx, ecx
    je L27
    mov edx, dword ptr [ebp + 8]
    mov ebx, edx
    or ebx, 0FFFFFFF8h
    shl ebx, 20
    and edx, 24
    or ebx, edx
    shl ebx, 8
    and eax, 0000007FFh
    or ebx, eax
    or ebx, dword ptr [ebp - 4]
    mov dword ptr [ecx], ebx
L27:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L28
    mov edx, dword ptr [edi + 8]
    mov dword ptr [eax], edx
L28:
    cmp dword ptr [edi + 8], -1
    je L30
    cmp dword ptr [esi + 000000154h], 0
    jne L29
    mov eax, dword ptr [esi + 000000100h]
    push 01011A300h
    push 00000119Fh
    push dword ptr [eax + 60]
    jmp L32
L29:
    or byte ptr [ecx + 1], 32
L30:
    xor eax, eax
    jmp L34
L31:
    push 01011A2D0h
    push 0
    push 0
L32:
    push esi
    call sub_1008B39F
    mov eax, 080004005h
L33:
    add esp, 16
L34:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_100c44a5 ENDP
END
