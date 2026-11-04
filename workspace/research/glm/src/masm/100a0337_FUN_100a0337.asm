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
.CODE
FUN_100a0337 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 88
    and dword ptr [ebp - 20], 0
    push ebx
    push esi
    push edi
    mov edi, ecx
    call sub_10099929
    mov esi, eax
    lea ecx, [ebp - 88]
    mov dword ptr [ebp - 24], esi
    call sub_1008302E
    test esi, esi
    je L21
    mov ebx, dword ptr [ebp + 8]
    test ebx, ebx
    je L21
    mov eax, dword ptr [esi + 24]
    add ebx, 16
    test byte ptr [esi + 16], 64
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 4], ebx
    je L0
    push dword ptr [ebx + 8]
    push 010115118h
    push 000000BE7h
    push ebx
    push edi
    call sub_10099539
    add esp, 20
L0:
    test byte ptr [esi + 16], 1
    je L1
    push dword ptr [ebx + 8]
    push 0101150ECh
    push 000000BBEh
    push ebx
    push edi
    call sub_10099556
    add esp, 20
L1:
    push dword ptr [ebp - 16]
    mov ecx, edi
    call sub_10099B5E
    test eax, eax
    jne L2
    push dword ptr [ebx + 8]
    push 0101150C0h
    push 000000BDEh
    push ebx
    push edi
    call sub_1009957B
    add esp, 20
L2:
    and dword ptr [ebp - 12], 0
    mov esi, dword ptr [ebp + 12]
    jmp L6
L3:
    mov ecx, dword ptr [esi + 8]
    test ecx, ecx
    je L5
    cmp dword ptr [ecx + 4], 6
    jne L5
    mov eax, dword ptr [esi + 12]
    test eax, eax
    je L4
    mov edx, dword ptr [eax + 8]
    cmp dword ptr [edx + 4], 12
    jne L4
    mov dword ptr [ebp - 12], 1
    mov esi, eax
    jmp L5
L4:
    cmp dword ptr [ebp - 12], 0
    je L5
    mov eax, dword ptr [ecx + 20]
    push dword ptr [eax + 24]
    push dword ptr [ebx + 8]
    push 010115090h
    push 000000BE4h
    push ebx
    push edi
    call sub_100995CF
    add esp, 24
L5:
    mov esi, dword ptr [esi + 12]
L6:
    test esi, esi
    jne L3
    push 20
    call sub_10065171
    cmp eax, esi
    je L7
    push 010114734h
    push esi
    push esi
    mov ecx, eax
    call sub_10082987
    mov dword ptr [ebp - 12], eax
    jmp L8
L7:
    mov dword ptr [ebp - 12], esi
L8:
    cmp dword ptr [ebp - 12], esi
    je L21
    push 48
    call sub_1006519B
    cmp eax, esi
    je L9
    push esi
    push esi
    push esi
    push 2
    mov ecx, eax
    call sub_10082D88
    mov ebx, eax
    mov dword ptr [ebp - 8], ebx
    jmp L10
L9:
    mov dword ptr [ebp - 8], esi
    mov ebx, esi
L10:
    test ebx, ebx
    je L21
    mov eax, dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    mov dword ptr [eax + 8], ebx
    call sub_10082975
    test eax, eax
    mov dword ptr [ebx + 20], eax
    je L21
    push 64
    call sub_100651DF
    test eax, eax
    je L11
    mov ecx, eax
    call sub_10083030
    mov esi, eax
    jmp L12
L11:
    xor esi, esi
L12:
    test esi, esi
    je L21
    mov eax, dword ptr [ebp - 24]
    mov dword ptr [ebx + 24], esi
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [esi + 24], ecx
    mov eax, dword ptr [eax + 20]
    test eax, eax
    je L13
    push eax
    call sub_100829B9
    test eax, eax
    mov dword ptr [esi + 28], eax
    je L21
L13:
    cmp dword ptr [ebp - 16], 0
    je L14
    push dword ptr [ebp - 16]
    call sub_100829D2
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L21
L14:
    push 1
    push dword ptr [esi + 32]
    mov ecx, edi
    call sub_10099AF2
    xor ebx, ebx
    cmp dword ptr [ebp + 16], ebx
    je L18
    cmp dword ptr [esi + 32], ebx
    jne L15
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax + 8]
    push 010115064h
    push 000000C04h
    push eax
    push edi
    call sub_100996D3
    add esp, 20
    mov dword ptr [ebp + 16], ebx
L15:
    cmp dword ptr [ebp + 16], ebx
    je L18
    push dword ptr [ebp + 16]
    call sub_10082A1F
    cmp eax, ebx
    mov dword ptr [esi + 52], eax
    je L21
L16:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 8]
    cmp eax, ebx
    je L17
    cmp dword ptr [eax + 4], 3
    jne L17
    push eax
    call sub_10082A40
    cmp eax, ebx
    mov dword ptr [esi + 48], eax
    je L21
L17:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 12]
    cmp eax, ebx
    mov dword ptr [ebp + 16], eax
    jne L16
L18:
    mov eax, dword ptr [ebp + 12]
    cmp eax, ebx
    je L19
    cmp dword ptr [eax + 8], ebx
    je L19
    push eax
    call sub_10082A66
    cmp eax, ebx
    mov dword ptr [esi + 36], eax
    je L21
L19:
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp + 12]
    push eax
    mov eax, dword ptr [edi + 16]
    push 10
    push dword ptr [eax + 32]
    mov ecx, edi
    push dword ptr [esi + 36]
    push dword ptr [esi + 28]
    push dword ptr [ebp - 4]
    push 2
    call sub_1009E374
    cmp eax, ebx
    jge L23
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax + 8]
    push 0101149D4h
    push 000000BBBh
L20:
    push eax
    push edi
    call sub_10099771
    add esp, 20
L21:
    xor eax, eax
L22:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L23:
    mov ebx, dword ptr [ebp + 12]
    mov ecx, edi
    jne L25
    push dword ptr [ebx + 32]
    push dword ptr [esi + 32]
    call sub_10099E8F
    test eax, eax
    jne L24
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax + 8]
    push 010115030h
    push 000000BFCh
    jmp L20
L24:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [esi + 16], eax
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ecx + 36], eax
    jmp L26
L25:
    mov eax, dword ptr [edi + 88]
    push dword ptr [esi + 32]
    mov dword ptr [esi + 16], eax
    call sub_10099E42
    mov dword ptr [esi + 20], eax
    add dword ptr [edi + 88], eax
L26:
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 72], eax
    mov eax, dword ptr [esi + 20]
    and dword ptr [ebp - 60], 0
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 64], 3
    push dword ptr [esi + 32]
    call sub_10082B2E
    push dword ptr [ebp + 16]
    mov dword ptr [ebp - 56], eax
    call sub_10082B39
    push 0
    push dword ptr [ebp - 56]
    mov ecx, edi
    mov dword ptr [ebp - 44], eax
    call sub_10099C51
    lea eax, [ebp - 88]
    push eax
    push dword ptr [ebp + 8]
    mov ecx, edi
    call sub_1009EAF8
    test ebx, ebx
    mov dword ptr [esi + 44], eax
    jne L27
    mov ebx, dword ptr [edi + 16]
    mov eax, dword ptr [ebx + 32]
    push 0
    push dword ptr [ebp - 8]
    mov ecx, edi
    mov dword ptr [edi + 16], eax
    call sub_1009AEDB
    test eax, eax
    mov dword ptr [edi + 16], ebx
    jl L21
    inc dword ptr [edi + 84]
L27:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 20], ecx
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [edi + 24], esi
    jmp L22
FUN_100a0337 ENDP
END
