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
EXTRN sub_1006B7B3:PROC
EXTRN sub_1006B7C0:PROC
EXTRN sub_1006B7C2:PROC
EXTRN sub_1006B7E9:PROC
EXTRN sub_1006B7F1:PROC
EXTRN sub_1006B803:PROC
EXTRN sub_1006B80E:PROC
EXTRN sub_1006B812:PROC
EXTRN sub_1006B813:PROC
EXTRN sub_1006B818:PROC
EXTRN sub_1006B81C:PROC
EXTRN sub_1006B82A:PROC
EXTRN sub_1006B834:PROC
EXTRN sub_1006B841:PROC
EXTRN sub_1006B872:PROC
EXTRN sub_1006B89E:PROC
EXTRN sub_1006B8A4:PROC
EXTRN sub_1006B8C3:PROC
EXTRN sub_1006B8D0:PROC
EXTRN sub_1006B8D4:PROC
EXTRN sub_1006B910:PROC
EXTRN sub_1006B920:PROC
EXTRN sub_1006B957:PROC
EXTRN sub_1006B95C:PROC
EXTRN sub_1006B98F:PROC
EXTRN sub_1006B99B:PROC
EXTRN sub_1006B9B3:PROC
EXTRN sub_1006B9BF:PROC
EXTRN sub_1006B9CB:PROC
EXTRN sub_1006B9D7:PROC
EXTRN sub_1006B9EF:PROC
EXTRN sub_1006BA21:PROC
EXTRN sub_1006BA2D:PROC
EXTRN sub_1006BA3D:PROC
EXTRN sub_1006BA4E:PROC
EXTRN sub_1006BA6C:PROC
EXTRN sub_1006BA71:PROC
EXTRN sub_1006BAA3:PROC
EXTRN sub_1006BAB4:PROC
EXTRN sub_1006BABD:PROC
EXTRN sub_1006BAC6:PROC
EXTRN sub_1006BAD3:PROC
EXTRN sub_1006BADE:PROC
EXTRN sub_1006BB02:PROC
EXTRN sub_1006BB2A:PROC
EXTRN sub_1006BB47:PROC
EXTRN sub_1006BB5B:PROC
EXTRN sub_1006BB70:PROC
EXTRN sub_1006BB78:PROC
EXTRN sub_1006BB7B:PROC
EXTRN sub_1006BB86:PROC
EXTRN sub_1006BBA5:PROC
EXTRN sub_1006BBCC:PROC
EXTRN sub_1006BBE0:PROC
EXTRN sub_1006BBE6:PROC
EXTRN sub_1006BBEF:PROC
EXTRN sub_1006BC44:PROC
EXTRN sub_1006BC58:PROC
EXTRN sub_1006BC5E:PROC
EXTRN sub_1006BC7E:PROC
EXTRN sub_1006BC9D:PROC
EXTRN sub_100828C9:PROC
EXTRN sub_10082D41:PROC
EXTRN sub_10082E43:PROC
EXTRN sub_10082E76:PROC
EXTRN sub_10082F1D:PROC
EXTRN sub_1008559A:PROC
EXTRN sub_10085608:PROC
EXTRN EXTRN g_1010C728:DWORD:DWORD
.CODE
FUN_1006b2b4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 64
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    cmp cmp dword ptr [esi + 80], edi
    jne sub_1006B7C2
    mov mov edx, dword ptr [ebp + 12]
    cmp cmp edx, edi
    push push ebx
    mov mov ecx, edx
    jbe L0
    mov mov eax, dword ptr [esi + 52]
    dec dec ecx
    test test eax, eax
    je L1
    mov mov ebx, dword ptr [eax + 8]
    mov mov dword ptr [ebp + ecx*4 - 64], ebx
    mov mov ebx, dword ptr [eax + 12]
    mov mov dword ptr [esi + 52], ebx
    and and dword ptr [eax + 8], 0
    and and dword ptr [eax + 12], 0
    test test ecx, ecx
    ja L0
    mov mov eax, dword ptr [ebp + 8]
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp eax, 63
    ja sub_1006B7B3
    movzx movzx eax, byte ptr [eax + 01006B821h]
    jmp jmp dword ptr [eax*4 + 01006B7B1h]
    push push 01010C97Ch
    push push 0
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067CAF
    add add esp, 16
    mov mov dword ptr [esi + 76], 1
    jmp sub_1006B82A
    xor xor edi, edi
    jmp sub_1006B7E9
    mov mov edi, dword ptr [ebp - 64]
    jmp sub_1006B7F1
    push push dword ptr [ebp - 64]
    push push dword ptr [ebp - 60]
    call sub_100828C9
    mov mov edi, eax
    jmp sub_1006B803
    xor xor edi, edi
    cmp cmp dword ptr [esi + 116], edi
    jne sub_1006B80E
    mov mov eax, dword ptr [ebp - 64]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [esi + 116], eax
    jmp sub_1006B81C
    mov mov edi, dword ptr [ebp - 64]
    jmp L2
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, 6
    mov mov edi, dword ptr [ebp - 64]
    jl L3
    cmp cmp eax, 9
    jg L4
    mov mov dword ptr [edi + 84], ebx
    push push edi
    mov mov ecx, esi
    call sub_100699E5
    jmp sub_1006B841
    push push 01010F620h
    push push 07EBh
    jmp L7
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, 2
    mov mov edi, dword ptr [ebp - 60]
    jl L5
    cmp cmp eax, 5
    jle L6
    cmp cmp eax, 11
    jl L8
    cmp cmp eax, 14
    jg L9
    mov mov eax, dword ptr [ebp - 64]
    mov mov dword ptr [edi + 64], eax
    jmp sub_1006B872
    push push 01010F5E0h
    push push 07ECh
    lea lea eax, [edi + 16]
    jmp L17
    mov mov edi, dword ptr [ebp - 64]
    and and dword ptr [ebp - 64], 0
    cmp cmp edx, ebx
    jbe L10
    mov mov eax, dword ptr [ebp - 60]
    and and dword ptr [ebp - 60], 0
    mov mov dword ptr [edi + 60], eax
    push push 2
    pop pop ecx
    cmp cmp edx, ecx
    jbe sub_1006B8A4
    lea lea edx, [edi + 68]
    lea lea eax, [ebp + ecx*4 - 64]
    mov mov ebx, dword ptr [eax]
    and and dword ptr [eax], 0
    mov mov dword ptr [edx], ebx
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, dword ptr [ebp + 12]
    jb L11
    xor xor ebx, ebx
    inc inc ebx
    jmp sub_1006B8C3
    mov mov edi, dword ptr [ebp - 64]
    and and dword ptr [ebp - 64], 0
    cmp cmp edx, ebx
    mov mov ecx, ebx
    jbe sub_1006B8D4
    lea lea edx, [edi + 68]
    lea lea eax, [ebp + ecx*4 - 64]
    mov mov ebx, dword ptr [eax]
    and and dword ptr [eax], 0
    mov mov dword ptr [edx], ebx
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, dword ptr [ebp + 12]
    jb L13
    jmp L12
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 28], 0
    je L15
    push push 01010F5B8h
    push push 07E6h
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067DE7
L3:
    xor xor ebx, ebx
    add add esp, 16
L4:
    inc inc ebx
    mov mov dword ptr [esi + 76], ebx
    mov mov dword ptr [edi + 32], 0F0000h
    jmp sub_1006B920
    mov mov eax, dword ptr [ebp - 60]
    add add eax, 16
    push push eax
    mov mov ecx, esi
    call sub_10069857
    mov mov dword ptr [edi + 32], eax
    jmp L14
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 20], 0
    je L16
    push push 01010F590h
    push push 07E2h
    jmp L25
    mov mov dword ptr [edi + 20], 0D000000h
    jmp sub_1006B957
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 20]
    test test eax, eax
    je L23
    cmp cmp eax, 02000000h
    je L22
    cmp cmp eax, 04000000h
    je L21
    cmp cmp eax, 07000000h
    je L19
    cmp cmp eax, 09000000h
    je L18
    cmp cmp eax, 0A000000h
    je L20
    cmp cmp eax, 0B000000h
    jne sub_1006B98F
    mov mov dword ptr [edi + 20], 0C000000h
    jmp sub_1006B99B
    push push 01010F560h
    push push 07DBh
    jmp L26
    mov mov dword ptr [edi + 20], 08000000h
    jmp sub_1006B9B3
    mov mov dword ptr [edi + 20], 05000000h
    jmp sub_1006B9BF
    mov mov dword ptr [edi + 20], 03000000h
L10:
    jmp sub_1006B9CB
    mov mov dword ptr [edi + 20], 01000000h
    jmp sub_1006B9D7
    mov mov eax, dword ptr [ebp - 64]
    cmp cmp dword ptr [eax + 24], ebx
    mov mov edi, dword ptr [ebp - 60]
    je sub_1006B7C0
    push push 01010F540h
    push push 07DAh
    jmp sub_1006B7E9
    mov mov eax, dword ptr [esi + 56]
    cmp cmp eax, 6
    jl sub_1006B813
    cmp cmp eax, 9
    jg sub_1006B818
    cmp cmp dword ptr [edi + 20], 0
    je sub_1006B812
    push push 01010F510h
    push push 07DCh
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067EF2
    add add esp, 16
    mov mov dword ptr [esi + 76], ebx
    jmp sub_1006BA21
    mov mov dword ptr [edi + 20], 06000000h
    jmp sub_1006BA2D
    push push 01010F4DCh
    push push 07EDh
    jmp sub_1006B834
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 28], 0
    je sub_1006B89E
    push push 01010F4B8h
    push push 07E6h
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067F33
    xor xor ebx, ebx
    add add esp, 16
    inc inc ebx
    mov mov dword ptr [esi + 76], ebx
L13:
    mov mov dword ptr [edi + 36], 0E40000h
    jmp sub_1006BA6C
    mov mov eax, dword ptr [ebp - 60]
    add add eax, 16
    push push eax
    mov mov ecx, esi
    call sub_10069A58
    mov mov dword ptr [edi + 36], eax
    jmp L24
    push push 0
    mov mov eax, dword ptr [ebp - 64]
    add add eax, 16
    push push eax
    mov mov ecx, esi
    call sub_1006B064
    jmp sub_1006BA71
    push push dword ptr [ebp - 60]
    jmp sub_1006B910
    mov mov eax, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 64]
    mov mov ecx, dword ptr [eax + 24]
    add add dword ptr [edi + 24], ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [edi + 40], ecx
    jne sub_1006B95C
    mov mov edx, dword ptr [eax + 40]
    mov mov dword ptr [edi + 40], edx
    mov mov dword ptr [eax + 40], ecx
    jmp sub_1006BABD
    cmp cmp dword ptr [eax + 40], ecx
    je sub_1006BAC6
    push push 01010F468h
    push push 07D9h
    jmp sub_1006B8D0
    push push 44
    call sub_100653E8
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_1006BADE
    push push dword ptr [ebp - 64]
    push push edi
    push push edi
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_1008559A
    jmp sub_1006BAD3
    push push 44
    call sub_1006540C
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_1006BB02
    mov mov ecx, dword ptr [ebp - 64]
    push push edi
    push push edi
    push push dword ptr [ecx + 24]
    jmp sub_1006B9EF
    push push 48
    call sub_10065427
    test test eax, eax
    je sub_1006BA3D
    lea lea ecx, [esi + 16]
    push push ecx
    mov mov ecx, eax
L16:
    call sub_10082E43
    mov mov edi, eax
    jmp sub_1006BA4E
    xor xor edi, edi
L17:
    push push edi
    mov mov ecx, esi
    call sub_10069146
    mov mov dword ptr [edi + 16], 2
    mov mov dword ptr [edi + 24], ebx
    jmp sub_1006BB47
    push push 48
    call sub_1006545A
    test test eax, eax
    je sub_1006BAA3
    lea lea ecx, [esi + 16]
    push push ecx
    mov mov ecx, eax
    call sub_10082E76
    mov mov edi, eax
    jmp sub_1006BAB4
    xor xor edi, edi
    push push edi
    mov mov ecx, esi
    call sub_10069179
    and and dword ptr [edi + 24], 0
    mov mov dword ptr [edi + 16], 2
    jmp sub_1006BB7B
    mov mov edi, dword ptr [ebp - 64]
    neg neg dword ptr [edi + 24]
    jmp sub_1006BB86
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    fild fild dword ptr [edi + 24]
    test test eax, eax
    mov mov dword ptr [edi + 16], 5
    jge sub_1006BB2A
    fadd fadd qword ptr [g_1010C728]
    fstp fstp qword ptr [edi + 24]
    jmp sub_1006BBA5
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    fild fild dword ptr [edi + 24]
    test test eax, eax
    mov mov dword ptr [edi + 16], 5
    jge sub_1006BB70
    fadd fadd qword ptr [g_1010C728]
    jmp sub_1006BB78
    mov mov edi, dword ptr [ebp - 64]
    fld fld qword ptr [edi + 24]
    fchs fchs
    jmp sub_1006BB5B
    push push 96
    call sub_100654DE
    test test eax, eax
    je sub_1006BBCC
    push push dword ptr [esi + 72]
    lea lea ecx, [esi + 16]
    push push dword ptr [esi + 68]
    push push dword ptr [esi + 64]
    push push ecx
    mov mov ecx, eax
    call sub_10085608
    mov mov edi, eax
    jmp sub_1006BBE6
    push push 48
    call sub_10065501
    test test eax, eax
    je sub_1006BBEF
    lea lea ecx, [esi + 16]
    push push ecx
    mov mov ecx, eax
    call sub_10082F1D
    jmp sub_1006BBE0
    xor xor edi, edi
    mov mov ecx, esi
    push push edi
    call sub_1006921E
    cmp cmp dword ptr [esi + 80], 0
    jne sub_1006BC5E
    push push 20
    call sub_10065529
    test test eax, eax
    je sub_1006BC44
    push push 01010C948h
    push push dword ptr [esi + 52]
    mov mov ecx, eax
    push push edi
    call sub_10082D41
    jmp sub_1006BC58
    xor xor eax, eax
    test test eax, eax
    jne sub_1006BC7E
    push push 01010C928h
    push push eax
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10068126
    add add esp, 16
    mov mov dword ptr [esi + 80], ebx
L26:
    mov mov dword ptr [esi + 76], ebx
    jmp sub_1006BC9D
    mov mov dword ptr [esi + 52], eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 8
FUN_1006b2b4 ENDP
END
