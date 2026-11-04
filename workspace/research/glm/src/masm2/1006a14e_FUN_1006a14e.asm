.686
.MODEL FLAT, C
EXTRN sub_10067E87:PROC
EXTRN sub_10068C6B:PROC
EXTRN sub_10068C80:PROC
EXTRN sub_10068C95:PROC
EXTRN sub_10068CAA:PROC
EXTRN sub_10068CBF:PROC
EXTRN sub_10069A3A:PROC
EXTRN sub_1006A3E8:PROC
EXTRN sub_1006A405:PROC
EXTRN sub_1006A470:PROC
EXTRN sub_1006A476:PROC
EXTRN sub_1006A49C:PROC
EXTRN sub_1006A4D7:PROC
EXTRN sub_1006A509:PROC
EXTRN sub_1006A543:PROC
EXTRN sub_1006A563:PROC
EXTRN sub_1006A56E:PROC
EXTRN sub_1006A58E:PROC
EXTRN sub_1006A5C3:PROC
EXTRN sub_1006A5D3:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 60
    push push ebx
    push push edi
    mov mov ebx, ecx
    push push 0464E4946h
    lea lea ecx, [ebp - 32]
    xor xor edi, edi
    call sub_100840A1
    mov mov ecx, dword ptr [ebx + 120]
    mov mov eax, dword ptr [ecx + 0ACh]
    add add eax, dword ptr [ecx + 0A8h]
    and and dword ptr [ebp - 16], edi
    add add eax, dword ptr [ecx + 0A4h]
    and and dword ptr [ebp - 4], edi
    add add eax, dword ptr [ecx + 0A0h]
    add add eax, dword ptr [ecx + 09Ch]
    je sub_1006A3E8
    shl shl eax, 2
    push push eax
    call sub_100F78BB
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 16], edi
    jne L0
    mov mov edi, 08007000Eh
    jmp sub_1006A405
    mov mov ecx, dword ptr [ebx + 120]
    push push esi
    push push edi
    call sub_10068C6B
    mov mov eax, dword ptr [ebx + 120]
    mov mov esi, dword ptr [eax + 0ACh]
    lea lea ecx, [edi + esi*4]
    push push ecx
    lea lea ecx, [eax + 112]
    call sub_10068C80
    mov mov eax, dword ptr [ebx + 120]
    add add esi, dword ptr [eax + 0A8h]
    lea lea ecx, [edi + esi*4]
    push push ecx
    lea lea ecx, [eax + 28]
    call sub_10068C95
    mov mov eax, dword ptr [ebx + 120]
    add add esi, dword ptr [eax + 09Ch]
    lea lea ecx, [edi + esi*4]
    push push ecx
    lea lea ecx, [eax + 56]
    call sub_10068CAA
    mov mov eax, dword ptr [ebx + 120]
    add add esi, dword ptr [eax + 0A0h]
    lea lea ecx, [edi + esi*4]
    push push ecx
    lea lea ecx, [eax + 84]
    call sub_10068CBF
    mov mov eax, dword ptr [ebx + 120]
    add add esi, dword ptr [eax + 0A4h]
    push push 01006A087h
    push push 4
    push push esi
    push push edi
    call sub_100F63EA
    lea lea eax, [esi + esi*4]
    shl shl eax, 2
    push push eax
    mov mov dword ptr [ebp - 12], eax
    call sub_100F7953
    add add esp, 20
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jne L1
    mov mov edi, 08007000Eh
    jmp sub_1006A49C
    push push 7
    pop pop ecx
    push push 28
    xor xor eax, eax
    lea lea edi, [ebp - 60]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [ebx + 60]
    and and dword ptr [ebp - 52], 0
    pop pop eax
    push push 0
    push push 1
    or or ecx, 4
    push push eax
    mov mov dword ptr [ebp - 60], eax
    lea lea eax, [ebp - 60]
    mov mov dword ptr [ebp - 40], ecx
    push push eax
    lea lea ecx, [ebp - 32]
    mov mov dword ptr [ebp - 48], esi
    call sub_10084209
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A4D7
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [ebp - 4]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    lea lea eax, [ebp - 44]
    push push eax
    push push 1
    push push edx
    push push dword ptr [ebp - 4]
    lea lea ecx, [ebp - 32]
    call sub_1008423B
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A509
    and and dword ptr [ebp - 8], 0
    test test esi, esi
    jbe sub_1006A470
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 12], eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 88]
    push push dword ptr [ecx]
    mov mov ecx, dword ptr [ebx + 124]
    push push dword ptr [eax + 4]
    push push dword ptr [eax]
    lea lea eax, [ebp - 32]
    push push dword ptr [ebp - 12]
    push push eax
    call sub_10084795
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A543
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 12], 20
    cmp cmp dword ptr [ebp - 8], esi
    jb sub_1006A476
    lea lea eax, [ebp - 56]
    push push eax
    push push 5
    push push -1
    push push 01010F030h
    lea lea ecx, [ebp - 32]
    call sub_100842A0
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A56E
    lea lea ecx, [ebp - 32]
    call sub_100843EB
    mov mov esi, eax
    cmp cmp esi, 08000h
    ja sub_1006A563
    push push esi
    mov mov ecx, ebx
    call sub_10069A3A
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A58E
    mov mov ecx, dword ptr [ebx + 92]
    mov mov eax, dword ptr [ebx + 88]
    lea lea ecx, [ecx*4 - 4]
    push push ecx
    lea lea ecx, [eax + 4]
    push push ecx
    lea lea eax, [eax + esi*4 + 4]
    push push eax
    call sub_100F69AB
    mov mov eax, dword ptr [ebx + 88]
    add add esp, 12
    push push esi
    add add eax, 4
    push push eax
    lea lea ecx, [ebp - 32]
    call sub_1008443E
    mov mov edi, eax
    test test edi, edi
    jl sub_1006A5C3
    add add dword ptr [ebx + 92], esi
    mov mov eax, dword ptr [ebx + 92]
    add add dword ptr [ebx + 104], esi
    mov mov dword ptr [ebx + 100], eax
    xor xor edi, edi
    jmp sub_1006A5D3
    push push 01010F004h
    push push 07EFh
    lea lea eax, [ebx + 16]
    push push eax
    push push dword ptr [ebx]
    call sub_10067E87
    add add esp, 16
    mov mov edi, 080004005h
    pop pop esi
    push push dword ptr [ebp - 16]
    call sub_100F7ABF
    push push dword ptr [ebp - 4]
    call sub_100F7AC7
    pop pop ecx
    pop pop ecx
    lea lea ecx, [ebp - 32]
    call sub_1008430F
    mov mov eax, edi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret
FUN_1006a14e ENDP
END
