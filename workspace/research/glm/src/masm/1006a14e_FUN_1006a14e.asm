.686
.MODEL FLAT, C
EXTRN sub_10067E87:PROC
EXTRN sub_10068C6B:PROC
EXTRN sub_10068C80:PROC
EXTRN sub_10068C95:PROC
EXTRN sub_10068CAA:PROC
EXTRN sub_10068CBF:PROC
EXTRN sub_10069A3A:PROC
EXTRN sub_100840A1:PROC
EXTRN sub_10084209:PROC
EXTRN sub_1008423B:PROC
EXTRN sub_100842A0:PROC
EXTRN sub_1008430F:PROC
EXTRN sub_100843EB:PROC
EXTRN sub_1008443E:PROC
EXTRN sub_10084795:PROC
EXTRN sub_100F63EA:PROC
EXTRN sub_100F69AB:PROC
EXTRN sub_100F78BB:PROC
EXTRN sub_100F7953:PROC
EXTRN sub_100F7ABF:PROC
EXTRN sub_100F7AC7:PROC
.CODE
FUN_1006a14e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 60
    push ebx
    push edi
    mov ebx, ecx
    push 0464E4946h
    lea ecx, [ebp - 32]
    xor edi, edi
    call sub_100840A1
    mov ecx, dword ptr [ebx + 120]
    mov eax, dword ptr [ecx + 0000000ACh]
    add eax, dword ptr [ecx + 0000000A8h]
    and dword ptr [ebp - 16], edi
    add eax, dword ptr [ecx + 0000000A4h]
    and dword ptr [ebp - 4], edi
    add eax, dword ptr [ecx + 0000000A0h]
    add eax, dword ptr [ecx + 00000009Ch]
    je L6
    shl eax, 2
    push eax
    call sub_100F78BB
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 16], edi
    jne L0
    mov edi, 08007000Eh
    jmp L6
L0:
    mov ecx, dword ptr [ebx + 120]
    push esi
    push edi
    call sub_10068C6B
    mov eax, dword ptr [ebx + 120]
    mov esi, dword ptr [eax + 0000000ACh]
    lea ecx, [edi + esi*4]
    push ecx
    lea ecx, [eax + 112]
    call sub_10068C80
    mov eax, dword ptr [ebx + 120]
    add esi, dword ptr [eax + 0000000A8h]
    lea ecx, [edi + esi*4]
    push ecx
    lea ecx, [eax + 28]
    call sub_10068C95
    mov eax, dword ptr [ebx + 120]
    add esi, dword ptr [eax + 00000009Ch]
    lea ecx, [edi + esi*4]
    push ecx
    lea ecx, [eax + 56]
    call sub_10068CAA
    mov eax, dword ptr [ebx + 120]
    add esi, dword ptr [eax + 0000000A0h]
    lea ecx, [edi + esi*4]
    push ecx
    lea ecx, [eax + 84]
    call sub_10068CBF
    mov eax, dword ptr [ebx + 120]
    add esi, dword ptr [eax + 0000000A4h]
    push 01006A087h
    push 4
    push esi
    push edi
    call sub_100F63EA
    lea eax, [esi + esi*4]
    shl eax, 2
    push eax
    mov dword ptr [ebp - 12], eax
    call sub_100F7953
    add esp, 20
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jne L1
    mov edi, 08007000Eh
    jmp L5
L1:
    push 7
    pop ecx
    push 28
    xor eax, eax
    lea edi, [ebp - 60]
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [ebx + 60]
    and dword ptr [ebp - 52], 0
    pop eax
    push 0
    push 1
    or ecx, 4
    push eax
    mov dword ptr [ebp - 60], eax
    lea eax, [ebp - 60]
    mov dword ptr [ebp - 40], ecx
    push eax
    lea ecx, [ebp - 32]
    mov dword ptr [ebp - 48], esi
    call sub_10084209
    mov edi, eax
    test edi, edi
    jl L5
    mov ecx, dword ptr [ebp - 12]
    mov edi, dword ptr [ebp - 4]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    lea eax, [ebp - 44]
    push eax
    push 1
    push edx
    push dword ptr [ebp - 4]
    lea ecx, [ebp - 32]
    call sub_1008423B
    mov edi, eax
    test edi, edi
    jl L5
    and dword ptr [ebp - 8], 0
    test esi, esi
    jbe L3
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 12], eax
L2:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 88]
    push dword ptr [ecx]
    mov ecx, dword ptr [ebx + 124]
    push dword ptr [eax + 4]
    push dword ptr [eax]
    lea eax, [ebp - 32]
    push dword ptr [ebp - 12]
    push eax
    call sub_10084795
    mov edi, eax
    test edi, edi
    jl L5
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 12], 20
    cmp dword ptr [ebp - 8], esi
    jb L2
L3:
    lea eax, [ebp - 56]
    push eax
    push 5
    push -1
    push 01010F030h
    lea ecx, [ebp - 32]
    call sub_100842A0
    mov edi, eax
    test edi, edi
    jl L5
    lea ecx, [ebp - 32]
    call sub_100843EB
    mov esi, eax
    cmp esi, 000008000h
    ja L4
    push esi
    mov ecx, ebx
    call sub_10069A3A
    mov edi, eax
    test edi, edi
    jl L5
    mov ecx, dword ptr [ebx + 92]
    mov eax, dword ptr [ebx + 88]
    lea ecx, [ecx*4 - 4]
    push ecx
    lea ecx, [eax + 4]
    push ecx
    lea eax, [eax + esi*4 + 4]
    push eax
    call sub_100F69AB
    mov eax, dword ptr [ebx + 88]
    add esp, 12
    push esi
    add eax, 4
    push eax
    lea ecx, [ebp - 32]
    call sub_1008443E
    mov edi, eax
    test edi, edi
    jl L5
    add dword ptr [ebx + 92], esi
    mov eax, dword ptr [ebx + 92]
    add dword ptr [ebx + 104], esi
    mov dword ptr [ebx + 100], eax
    xor edi, edi
    jmp L5
L4:
    push 01010F004h
    push 0000007EFh
    lea eax, [ebx + 16]
    push eax
    push dword ptr [ebx]
    call sub_10067E87
    add esp, 16
    mov edi, 080004005h
L5:
    pop esi
L6:
    push dword ptr [ebp - 16]
    call sub_100F7ABF
    push dword ptr [ebp - 4]
    call sub_100F7AC7
    pop ecx
    pop ecx
    lea ecx, [ebp - 32]
    call sub_1008430F
    mov eax, edi
    pop edi
    pop ebx
    leave
    ret
FUN_1006a14e ENDP
END
