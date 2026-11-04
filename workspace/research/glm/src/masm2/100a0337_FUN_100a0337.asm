.686
.MODEL FLAT, C
EXTRN sub_10065171:PROC
EXTRN sub_1006519B:PROC
EXTRN sub_100651DF:PROC
EXTRN sub_10082975:PROC
EXTRN sub_10082987:PROC
EXTRN sub_100829B9:PROC
EXTRN sub_100829D2:PROC
EXTRN sub_10082A1F:PROC
EXTRN sub_10082A40:PROC
EXTRN sub_10082A66:PROC
EXTRN sub_10082B2E:PROC
EXTRN sub_10082B39:PROC
EXTRN sub_10082D88:PROC
EXTRN sub_1008302E:PROC
EXTRN sub_10083030:PROC
EXTRN sub_10099539:PROC
EXTRN sub_10099556:PROC
EXTRN sub_1009957B:PROC
EXTRN sub_100995CF:PROC
EXTRN sub_100996D3:PROC
EXTRN sub_10099771:PROC
EXTRN sub_10099929:PROC
EXTRN sub_10099AF2:PROC
EXTRN sub_10099B5E:PROC
EXTRN sub_10099C51:PROC
EXTRN sub_10099E42:PROC
EXTRN sub_10099E8F:PROC
EXTRN sub_1009AEDB:PROC
EXTRN sub_1009E374:PROC
EXTRN sub_1009EAF8:PROC
EXTRN sub_100A06F4:PROC
EXTRN sub_100A0712:PROC
EXTRN sub_100A071F:PROC
EXTRN sub_100A0738:PROC
EXTRN sub_100A074F:PROC
EXTRN sub_100A0758:PROC
EXTRN sub_100A0776:PROC
EXTRN sub_100A077C:PROC
EXTRN sub_100A0786:PROC
EXTRN sub_100A0789:PROC
EXTRN sub_100A078C:PROC
EXTRN sub_100A0795:PROC
EXTRN sub_100A07D3:PROC
EXTRN sub_100A07D8:PROC
EXTRN sub_100A07E2:PROC
EXTRN sub_100A07FF:PROC
EXTRN sub_100A0825:PROC
EXTRN sub_100A0854:PROC
EXTRN sub_100A088C:PROC
EXTRN sub_100A08B5:PROC
EXTRN sub_100A08C3:PROC
EXTRN sub_100A0915:PROC
EXTRN sub_100A0935:PROC
EXTRN sub_100A0951:PROC
EXTRN sub_100A09E8:PROC
.CODE
FUN_100a0337 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 88
    and and dword ptr [ebp - 20], 0
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    call sub_10099929
    mov mov esi, eax
    lea lea ecx, [ebp - 88]
    mov mov dword ptr [ebp - 24], esi
    call sub_1008302E
    test test esi, esi
    je L14
    mov mov ebx, dword ptr [ebp + 8]
    test test ebx, ebx
    je L15
    mov mov eax, dword ptr [esi + 24]
    add add ebx, 16
    test test byte ptr [esi + 16], 64
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 4], ebx
    je L0
    push push dword ptr [ebx + 8]
    push push 010115118h
    push push 0BE7h
    push push ebx
    push push edi
    call sub_10099539
    add add esp, 20
    test test byte ptr [esi + 16], 1
    je L1
    push push dword ptr [ebx + 8]
    push push 0101150ECh
    push push 0BBEh
    push push ebx
    push push edi
    call sub_10099556
    add add esp, 20
    push push dword ptr [ebp - 16]
    mov mov ecx, edi
    call sub_10099B5E
    test test eax, eax
    jne L2
    push push dword ptr [ebx + 8]
    push push 0101150C0h
    push push 0BDEh
    push push ebx
    push push edi
    call sub_1009957B
    add add esp, 20
    and and dword ptr [ebp - 12], 0
    mov mov esi, dword ptr [ebp + 12]
    jmp L5
    mov mov ecx, dword ptr [esi + 8]
    test test ecx, ecx
    je L6
    cmp cmp dword ptr [ecx + 4], 6
    jne L7
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    je L3
    mov mov edx, dword ptr [eax + 8]
    cmp cmp dword ptr [edx + 4], 12
    jne L4
    mov mov dword ptr [ebp - 12], 1
    mov mov esi, eax
    jmp L8
    cmp cmp dword ptr [ebp - 12], 0
    je L9
    mov mov eax, dword ptr [ecx + 20]
    push push dword ptr [eax + 24]
    push push dword ptr [ebx + 8]
L1:
    push push 010115090h
    push push 0BE4h
    push push ebx
    push push edi
    call sub_100995CF
    add add esp, 24
    mov mov esi, dword ptr [esi + 12]
    test test esi, esi
    jne L6
    push push 20
    call sub_10065171
    cmp cmp eax, esi
    je L10
    push push 010114734h
    push push esi
    push push esi
    mov mov ecx, eax
    call sub_10082987
    mov mov dword ptr [ebp - 12], eax
    jmp L11
    mov mov dword ptr [ebp - 12], esi
    cmp cmp dword ptr [ebp - 12], esi
    je sub_100A06F4
    push push 48
    call sub_1006519B
    cmp cmp eax, esi
    je L12
    push push esi
    push push esi
    push push esi
    push push 2
    mov mov ecx, eax
    call sub_10082D88
    mov mov ebx, eax
    mov mov dword ptr [ebp - 8], ebx
    jmp L13
    mov mov dword ptr [ebp - 8], esi
    mov mov ebx, esi
    test test ebx, ebx
    je sub_100A071F
    mov mov eax, dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    mov mov dword ptr [eax + 8], ebx
    call sub_10082975
    test test eax, eax
    mov mov dword ptr [ebx + 20], eax
    je sub_100A0738
    push push 64
    call sub_100651DF
    test test eax, eax
    je L16
    mov mov ecx, eax
    call sub_10083030
    mov mov esi, eax
    jmp L17
    xor xor esi, esi
    test test esi, esi
    je sub_100A0758
    mov mov eax, dword ptr [ebp - 24]
    mov mov dword ptr [ebx + 24], esi
L3:
    mov mov ecx, dword ptr [eax + 16]
    mov mov dword ptr [esi + 24], ecx
    mov mov eax, dword ptr [eax + 20]
L4:
    test test eax, eax
    je L18
    push push eax
    call sub_100829B9
    test test eax, eax
    mov mov dword ptr [esi + 28], eax
    je sub_100A077C
    cmp cmp dword ptr [ebp - 16], 0
    je L19
    push push dword ptr [ebp - 16]
    call sub_100829D2
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_100A0795
L8:
    push push 1
    push push dword ptr [esi + 32]
    mov mov ecx, edi
    call sub_10099AF2
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 16], ebx
    je sub_100A074F
    cmp cmp dword ptr [esi + 32], ebx
    jne sub_100A0712
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 8]
    push push 010115064h
    push push 0C04h
    push push eax
    push push edi
    call sub_100996D3
    add add esp, 20
    mov mov dword ptr [ebp + 16], ebx
    cmp cmp dword ptr [ebp + 16], ebx
    je sub_100A0776
    push push dword ptr [ebp + 16]
    call sub_10082A1F
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 52], eax
    je sub_100A07E2
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 8]
    cmp cmp eax, ebx
    je sub_100A0786
    cmp cmp dword ptr [eax + 4], 3
    jne sub_100A078C
    push push eax
    call sub_10082A40
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 48], eax
    je sub_100A07FF
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 12]
L11:
    cmp cmp eax, ebx
    mov mov dword ptr [ebp + 16], eax
    jne sub_100A0789
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, ebx
    je sub_100A07D3
    cmp cmp dword ptr [eax + 8], ebx
    je sub_100A07D8
    push push eax
    call sub_10082A66
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 36], eax
    je sub_100A0825
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp + 12]
    push push eax
    mov mov eax, dword ptr [edi + 16]
    push push 10
    push push dword ptr [eax + 32]
    mov mov ecx, edi
    push push dword ptr [esi + 36]
    push push dword ptr [esi + 28]
    push push dword ptr [ebp - 4]
    push push 2
    call sub_1009E374
    cmp cmp eax, ebx
    jge sub_100A0854
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 8]
    push push 0101149D4h
    push push 0BBBh
L13:
    push push eax
    push push edi
    call sub_10099771
    add add esp, 20
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    mov mov ebx, dword ptr [ebp + 12]
    mov mov ecx, edi
    jne sub_100A08C3
    push push dword ptr [ebx + 32]
    push push dword ptr [esi + 32]
    call sub_10099E8F
    test test eax, eax
    jne sub_100A08B5
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 8]
    push push 010115030h
    push push 0BFCh
    jmp sub_100A088C
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [esi + 16], eax
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ecx + 36], eax
    jmp sub_100A0915
    mov mov eax, dword ptr [edi + 88]
    push push dword ptr [esi + 32]
    mov mov dword ptr [esi + 16], eax
    call sub_10099E42
    mov mov dword ptr [esi + 20], eax
    add add dword ptr [edi + 88], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 72], eax
    mov mov eax, dword ptr [esi + 20]
L17:
    and and dword ptr [ebp - 60], 0
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 64], 3
    push push dword ptr [esi + 32]
    call sub_10082B2E
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 56], eax
    call sub_10082B39
    push push 0
    push push dword ptr [ebp - 56]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 44], eax
    call sub_10099C51
    lea lea eax, [ebp - 88]
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, edi
    call sub_1009EAF8
    test test ebx, ebx
    mov mov dword ptr [esi + 44], eax
    jne sub_100A09E8
    mov mov ebx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebx + 32]
    push push 0
    push push dword ptr [ebp - 8]
    mov mov ecx, edi
    mov mov dword ptr [edi + 16], eax
    call sub_1009AEDB
    test test eax, eax
    mov mov dword ptr [edi + 16], ebx
    jl sub_100A0935
    inc inc dword ptr [edi + 84]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 20], ecx
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [edi + 24], esi
    jmp sub_100A0951
FUN_100a0337 ENDP
END
