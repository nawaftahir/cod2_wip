.686
.MODEL FLAT, C
EXTRN sub_10063828:PROC
EXTRN sub_1006DFCC:PROC
EXTRN sub_1006EDE5:PROC
EXTRN sub_1006EE0B:PROC
EXTRN sub_1006EE40:PROC
EXTRN sub_1006EE48:PROC
EXTRN sub_1006EE52:PROC
EXTRN sub_1006EE6A:PROC
EXTRN sub_1006EE6C:PROC
EXTRN sub_1006EE75:PROC
EXTRN sub_1006EEAC:PROC
EXTRN sub_1006EEDC:PROC
EXTRN sub_1006EEDE:PROC
EXTRN sub_1006EF01:PROC
EXTRN sub_1006EF05:PROC
EXTRN sub_1006EF06:PROC
EXTRN sub_1006EF09:PROC
EXTRN sub_1006EF30:PROC
EXTRN sub_1006EF40:PROC
EXTRN sub_1006EF4D:PROC
EXTRN sub_1006EFA8:PROC
EXTRN sub_10082897:PROC
EXTRN sub_10086312:PROC
.CODE
FUN_1006eb85 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 8], edi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 16], edi
    je L3
    cmp cmp dword ptr [ebp + 20], edi
    jne L0
    mov mov eax, dword ptr [ebp + 36]
    cmp cmp eax, edi
    je L1
    mov mov dword ptr [ebp + 28], eax
    lea lea eax, [ebp - 16]
    mov mov dword ptr [ebp + 32], eax
    mov mov dword ptr [ebp + 20], 1
    cmp cmp dword ptr [ebp + 24], edi
    jne L2
    mov mov esi, dword ptr [ebp + 40]
    cmp cmp esi, edi
    je L4
    cmp cmp dword ptr [ecx + 084h], edi
    je L5
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 12]
    push push eax
    push push dword ptr [ebp + 32]
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
L1:
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006DFCC
    cmp cmp eax, edi
    jl L6
    mov mov eax, dword ptr [ebp + 44]
    cmp cmp eax, edi
    je L7
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax], ecx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 40
    mov mov esi, dword ptr [ebp + 40]
    mov mov eax, dword ptr [esi + 8]
L3:
    cmp cmp dword ptr [eax + 4], 17
    mov mov dword ptr [ebp + 36], edi
    mov mov dword ptr [ebp - 8], edi
    jne L8
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 16]
    test test eax, eax
    mov mov ebx, dword ptr [ecx + 24]
    je L9
    lea lea ecx, [ebp - 28]
    push push ecx
    push push 0
    push push dword ptr [eax + 24]
    call sub_10063828
    test test eax, eax
    jl L11
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    cmp cmp eax, dword ptr [ebp - 24]
    jne L10
    mov mov dword ptr [ebp + 36], ebx
    jmp L12
    and and eax, 0FFFF0000h
    cmp cmp eax, dword ptr [ebp - 24]
    jne L13
    mov mov edi, ebx
    jmp L14
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [esi + 12]
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 36], ebx
    mov mov dword ptr [ebp + 40], eax
    jne L16
    cmp cmp edi, ebx
    je L15
    mov mov dword ptr [ebp + 36], edi
    jmp L16
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp + 36], eax
L7:
    cmp cmp dword ptr [ebp + 36], ebx
    je sub_1006EEAC
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ecx + 4]
    jae L17
    mov mov edx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [edx + eax*4]
    jmp L18
    xor xor eax, eax
    cmp cmp eax, ebx
    je sub_1006EEDC
    push push eax
    call sub_10086312
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp eax, dword ptr [ecx + 4]
    mov mov dword ptr [ebp + 16], eax
    jae sub_1006EDE5
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ebx, dword ptr [ecx + eax*4]
    test test ebx, ebx
    je sub_1006EF05
    mov mov eax, dword ptr [ebx + 4]
    test test ah, 8
    jne sub_1006EE6C
    mov mov ecx, dword ptr [ebp + 36]
    or or eax, 0840h
    test test al, 16
    mov mov dword ptr [ebx], ecx
    mov mov dword ptr [ebx + 4], eax
    je sub_1006EF01
    test test al, al
    js sub_1006EF09
    mov mov ecx, 0200h
    test test ecx, eax
    je sub_1006EE6A
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + 8]
    test test dword ptr [edx + 112], ecx
    je sub_1006EE75
    or or eax, 0400h
    mov mov dword ptr [ebx + 4], eax
    mov mov eax, dword ptr [ebx + 4]
    test test ecx, eax
    jne sub_1006EF30
L10:
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 8]
L11:
    test test byte ptr [ecx + 113], 4
    je sub_1006EF40
    or or eax, 0100400h
    mov mov dword ptr [ebx + 4], eax
    jmp sub_1006EF4D
    mov mov eax, dword ptr [ebx]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
L14:
    inc inc eax
    test test cl, cl
    jne sub_1006EEDE
    sub sub eax, edx
    mov mov esi, eax
    mov mov eax, dword ptr [ebp + 36]
    mov mov dword ptr [ebp - 8], esi
    lea lea edi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1006EF06
    sub sub eax, edi
    mov mov dword ptr [ebp + 24], eax
    lea lea eax, [eax + esi + 3]
    push push 4
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
L15:
    call sub_10082897
    test test eax, eax
    je sub_1006EFA8
    mov mov ecx, esi
L16:
    mov mov esi, dword ptr [ebx]
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebp + 36]
    lea lea edx, [eax + ecx]
    mov mov ecx, dword ptr [ebp + 24]
    mov mov byte ptr [edx], 59
    mov mov byte ptr [edx + 1], 32
    lea lea edi, [edx + 2]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 8]
    add add ecx, eax
    mov mov byte ptr [ecx + edx + 2], 0
    mov mov dword ptr [ebx], eax
    mov mov dword ptr [ebp + 24], 1
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 40], edi
    jne sub_1006EE40
    jmp sub_1006EE0B
    mov mov eax, 080004005h
    jmp sub_1006EE48
    mov mov eax, 08007000Eh
    jmp sub_1006EE52
FUN_1006eb85 ENDP
END
