.686
.MODEL FLAT, C
EXTRN sub_100653E8:PROC
EXTRN sub_1006540C:PROC
EXTRN sub_10065427:PROC
EXTRN sub_1006545A:PROC
EXTRN sub_100654DE:PROC
EXTRN sub_10065501:PROC
EXTRN sub_10065529:PROC
EXTRN sub_10067CAF:PROC
EXTRN sub_10067DE7:PROC
EXTRN sub_10067EF2:PROC
EXTRN sub_10067F33:PROC
EXTRN sub_10068126:PROC
EXTRN sub_10069146:PROC
EXTRN sub_10069179:PROC
EXTRN sub_1006921E:PROC
EXTRN sub_10069857:PROC
EXTRN sub_100699E5:PROC
EXTRN sub_10069A58:PROC
EXTRN sub_1006B064:PROC
EXTRN sub_100828C9:PROC
EXTRN sub_10082D41:PROC
EXTRN sub_10082E43:PROC
EXTRN sub_10082E76:PROC
EXTRN sub_10082F1D:PROC
EXTRN sub_1008559A:PROC
EXTRN sub_10085608:PROC
EXTRN g_1010C728:DWORD
.CODE
FUN_1006b2b4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 64
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    cmp dword ptr [esi + 80], edi
    jne L43
    mov edx, dword ptr [ebp + 12]
    cmp edx, edi
    push ebx
    mov ecx, edx
    jbe L1
L0:
    mov eax, dword ptr [esi + 52]
    dec ecx
    test eax, eax
    je L2
    mov ebx, dword ptr [eax + 8]
    mov dword ptr [ebp + ecx*4 - 64], ebx
    mov ebx, dword ptr [eax + 12]
    mov dword ptr [esi + 52], ebx
    and dword ptr [eax + 8], 0
    and dword ptr [eax + 12], 0
    test ecx, ecx
    ja L0
L1:
    mov eax, dword ptr [ebp + 8]
    xor ebx, ebx
    inc ebx
    cmp eax, 63
    ja L38
    movzx eax, byte ptr [eax + 01006B821h]
    jmp dword ptr [eax*4 + 0x1006b7b1]
L2:
    push 01010C97Ch
    push 0
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067CAF
    add esp, 16
    mov dword ptr [esi + 76], 1
    jmp L42
    xor edi, edi
    jmp L38
    mov edi, dword ptr [ebp - 64]
    jmp L38
    push dword ptr [ebp - 64]
    push dword ptr [ebp - 60]
    call sub_100828C9
    mov edi, eax
    jmp L38
    xor edi, edi
    cmp dword ptr [esi + 116], edi
    jne L38
    mov eax, dword ptr [ebp - 64]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [esi + 116], eax
    jmp L38
    mov edi, dword ptr [ebp - 64]
    jmp L3
    mov eax, dword ptr [esi + 56]
    cmp eax, 6
    mov edi, dword ptr [ebp - 64]
    jl L4
    cmp eax, 9
    jg L4
    mov dword ptr [edi + 84], ebx
L3:
    push edi
    mov ecx, esi
    call sub_100699E5
    jmp L38
L4:
    push 01010F620h
    push 0000007EBh
    jmp L8
    mov eax, dword ptr [esi + 56]
    cmp eax, 2
    mov edi, dword ptr [ebp - 60]
    jl L5
    cmp eax, 5
    jle L6
L5:
    cmp eax, 11
    jl L7
    cmp eax, 14
    jg L7
L6:
    mov eax, dword ptr [ebp - 64]
    mov dword ptr [edi + 64], eax
    jmp L38
L7:
    push 01010F5E0h
    push 0000007ECh
L8:
    lea eax, [edi + 16]
    jmp L22
    mov edi, dword ptr [ebp - 64]
    and dword ptr [ebp - 64], 0
    cmp edx, ebx
    jbe L9
    mov eax, dword ptr [ebp - 60]
    and dword ptr [ebp - 60], 0
    mov dword ptr [edi + 60], eax
L9:
    push 2
    pop ecx
    cmp edx, ecx
    jbe L38
    lea edx, [edi + 68]
L10:
    lea eax, [ebp + ecx*4 - 64]
    mov ebx, dword ptr [eax]
    and dword ptr [eax], 0
    mov dword ptr [edx], ebx
    inc ecx
    add edx, 4
    cmp ecx, dword ptr [ebp + 12]
    jb L10
L11:
    xor ebx, ebx
    inc ebx
    jmp L38
    mov edi, dword ptr [ebp - 64]
    and dword ptr [ebp - 64], 0
    cmp edx, ebx
    mov ecx, ebx
    jbe L38
    lea edx, [edi + 68]
L12:
    lea eax, [ebp + ecx*4 - 64]
    mov ebx, dword ptr [eax]
    and dword ptr [eax], 0
    mov dword ptr [edx], ebx
    inc ecx
    add edx, 4
    cmp ecx, dword ptr [ebp + 12]
    jb L12
    jmp L11
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 28], 0
    je L13
    push 01010F5B8h
    push 0000007E6h
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067DE7
    xor ebx, ebx
    add esp, 16
    inc ebx
    mov dword ptr [esi + 76], ebx
    mov dword ptr [edi + 32], 0000F0000h
    jmp L38
L13:
    mov eax, dword ptr [ebp - 60]
    add eax, 16
    push eax
    mov ecx, esi
    call sub_10069857
    mov dword ptr [edi + 32], eax
    jmp L11
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 20], 0
    je L14
    push 01010F590h
    push 0000007E2h
    jmp L21
L14:
    mov dword ptr [edi + 20], 00D000000h
    jmp L38
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 20]
    test eax, eax
    je L19
    cmp eax, 002000000h
    je L18
    cmp eax, 004000000h
    je L17
    cmp eax, 007000000h
    je L16
    cmp eax, 009000000h
    je L15
    cmp eax, 00A000000h
    je L15
    cmp eax, 00B000000h
    jne L38
    mov dword ptr [edi + 20], 00C000000h
    jmp L38
L15:
    push 01010F560h
    push 0000007DBh
    jmp L21
L16:
    mov dword ptr [edi + 20], 008000000h
    jmp L38
L17:
    mov dword ptr [edi + 20], 005000000h
    jmp L38
L18:
    mov dword ptr [edi + 20], 003000000h
    jmp L38
L19:
    mov dword ptr [edi + 20], 001000000h
    jmp L38
    mov eax, dword ptr [ebp - 64]
    cmp dword ptr [eax + 24], ebx
    mov edi, dword ptr [ebp - 60]
    je L20
    push 01010F540h
    push 0000007DAh
    jmp L21
L20:
    mov eax, dword ptr [esi + 56]
    cmp eax, 6
    jl L24
    cmp eax, 9
    jg L24
    cmp dword ptr [edi + 20], 0
    je L23
    push 01010F510h
    push 0000007DCh
L21:
    lea eax, [esi + 16]
L22:
    push eax
    push dword ptr [esi]
    call sub_10067EF2
    add esp, 16
    mov dword ptr [esi + 76], ebx
    jmp L38
L23:
    mov dword ptr [edi + 20], 006000000h
    jmp L38
L24:
    push 01010F4DCh
    push 0000007EDh
    jmp L21
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 28], 0
    je L25
    push 01010F4B8h
    push 0000007E6h
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067F33
    xor ebx, ebx
    add esp, 16
    inc ebx
    mov dword ptr [esi + 76], ebx
    mov dword ptr [edi + 36], 000E40000h
    jmp L38
L25:
    mov eax, dword ptr [ebp - 60]
    add eax, 16
    push eax
    mov ecx, esi
    call sub_10069A58
    mov dword ptr [edi + 36], eax
    jmp L11
    push 0
L26:
    mov eax, dword ptr [ebp - 64]
    add eax, 16
    push eax
    mov ecx, esi
    call sub_1006B064
    jmp L35
    push dword ptr [ebp - 60]
    jmp L26
    mov eax, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 64]
    mov ecx, dword ptr [eax + 24]
    add dword ptr [edi + 24], ecx
    xor ecx, ecx
    cmp dword ptr [edi + 40], ecx
    jne L27
    mov edx, dword ptr [eax + 40]
    mov dword ptr [edi + 40], edx
    mov dword ptr [eax + 40], ecx
    jmp L38
L27:
    cmp dword ptr [eax + 40], ecx
    je L38
    push 01010F468h
    push 0000007D9h
    jmp L21
    push 44
    call sub_100653E8
    xor edi, edi
    cmp eax, edi
    je L37
    push dword ptr [ebp - 64]
    push edi
    push edi
L28:
    push edi
    push edi
    mov ecx, eax
    call sub_1008559A
    jmp L35
    push 44
    call sub_1006540C
    xor edi, edi
    cmp eax, edi
    je L37
    mov ecx, dword ptr [ebp - 64]
    push edi
    push edi
    push dword ptr [ecx + 24]
    jmp L28
    push 48
    call sub_10065427
    test eax, eax
    je L29
    lea ecx, [esi + 16]
    push ecx
    mov ecx, eax
    call sub_10082E43
    mov edi, eax
    jmp L30
L29:
    xor edi, edi
L30:
    push edi
    mov ecx, esi
    call sub_10069146
    mov dword ptr [edi + 16], 2
    mov dword ptr [edi + 24], ebx
    jmp L38
    push 48
    call sub_1006545A
    test eax, eax
    je L31
    lea ecx, [esi + 16]
    push ecx
    mov ecx, eax
    call sub_10082E76
    mov edi, eax
    jmp L32
L31:
    xor edi, edi
L32:
    push edi
    mov ecx, esi
    call sub_10069179
    and dword ptr [edi + 24], 0
    mov dword ptr [edi + 16], 2
    jmp L38
    mov edi, dword ptr [ebp - 64]
    neg dword ptr [edi + 24]
    jmp L38
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    fild dword ptr [edi + 24]
    test eax, eax
    mov dword ptr [edi + 16], 5
    jge L33
    fadd qword ptr [g_1010C728]
L33:
    fstp qword ptr [edi + 24]
    jmp L38
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    fild dword ptr [edi + 24]
    test eax, eax
    mov dword ptr [edi + 16], 5
    jge L34
    fadd qword ptr [g_1010C728]
    jmp L34
    mov edi, dword ptr [ebp - 64]
    fld qword ptr [edi + 24]
L34:
    fchs
    jmp L33
    push 96
    call sub_100654DE
    test eax, eax
    je L36
    push dword ptr [esi + 72]
    lea ecx, [esi + 16]
    push dword ptr [esi + 68]
    push dword ptr [esi + 64]
    push ecx
    mov ecx, eax
    call sub_10085608
L35:
    mov edi, eax
    jmp L37
    push 48
    call sub_10065501
    test eax, eax
    je L36
    lea ecx, [esi + 16]
    push ecx
    mov ecx, eax
    call sub_10082F1D
    jmp L35
L36:
    xor edi, edi
L37:
    mov ecx, esi
    push edi
    call sub_1006921E
L38:
    cmp dword ptr [esi + 80], 0
    jne L42
    push 20
    call sub_10065529
    test eax, eax
    je L39
    push 01010C948h
    push dword ptr [esi + 52]
    mov ecx, eax
    push edi
    call sub_10082D41
    jmp L40
L39:
    xor eax, eax
L40:
    test eax, eax
    jne L41
    push 01010C928h
    push eax
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10068126
    add esp, 16
    mov dword ptr [esi + 80], ebx
    mov dword ptr [esi + 76], ebx
    jmp L42
L41:
    mov dword ptr [esi + 52], eax
L42:
    pop ebx
L43:
    pop edi
    pop esi
    leave
    ret 8
FUN_1006b2b4 ENDP
END
