.686
.MODEL FLAT, C
EXTRN sub_100FC2AC:PROC
EXTRN sub_100FC2C0:PROC
EXTRN sub_100FC2DC:PROC
EXTRN sub_10106B3E:PROC
EXTRN sub_10108E11:PROC
EXTRN sub_10108E39:PROC
EXTRN sub_10108E54:PROC
EXTRN sub_10108E7F:PROC
EXTRN sub_10108E83:PROC
EXTRN sub_10108EA3:PROC
EXTRN sub_10108EB4:PROC
EXTRN sub_10108EC0:PROC
EXTRN sub_10108ED9:PROC
EXTRN sub_10108EDB:PROC
EXTRN sub_10108EE2:PROC
EXTRN sub_10108EEA:PROC
EXTRN sub_10108EEB:PROC
EXTRN sub_10108EED:PROC
EXTRN sub_10108F01:PROC
EXTRN sub_10108F13:PROC
EXTRN sub_10108F25:PROC
EXTRN sub_10108F29:PROC
EXTRN sub_10108F2F:PROC
EXTRN sub_10108F3A:PROC
EXTRN sub_10108F40:PROC
EXTRN sub_10108F4D:PROC
EXTRN sub_10108F5D:PROC
EXTRN sub_10108F73:PROC
EXTRN sub_10108FA3:PROC
EXTRN sub_10108FAC:PROC
EXTRN sub_10108FCB:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0B4:DWORD:DWORD
.CODE
__read_lk PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp + 16], 0
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    push push esi
    push push edi
    mov mov edx, ebx
    je sub_10108E11
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, eax
    and and eax, 31
    sar sar ecx, 5
    lea lea esi, [eax + eax*8]
    lea lea edi, [ecx*4 + 01076ACA0h]
    mov mov eax, dword ptr [edi]
    shl shl esi, 2
    add add eax, esi
    mov mov cl, byte ptr [eax + 4]
    test test cl, 2
    jne sub_10108E39
    test test cl, 72
    je L0
    cmp cmp byte ptr [eax + 5], 10
    je L1
    mov mov eax, dword ptr [edi]
    mov mov al, byte ptr [eax + esi + 5]
    dec dec dword ptr [ebp + 16]
    mov mov byte ptr [ebx], al
    mov mov eax, dword ptr [edi]
    lea lea edx, [ebx + 1]
    mov mov dword ptr [ebp - 8], 1
    mov mov byte ptr [eax + esi + 5], 10
    push push 0
    lea lea eax, [ebp - 12]
    push push eax
    push push dword ptr [ebp + 16]
    mov mov eax, dword ptr [edi]
    push push edx
    push push dword ptr [eax + esi]
    call dword ptr [fp_1010C0B4]
    test test eax, eax
    jne L3
    call dword ptr [fp_1010C054]
    push push 5
    pop pop esi
    cmp cmp eax, esi
    jne L2
    call sub_100FC2AC
    mov mov dword ptr [eax], 9
    call sub_100FC2C0
    mov mov dword ptr [eax], esi
    jmp L4
    cmp cmp eax, 109
    je sub_10108EA3
    push push eax
    call sub_100FC2DC
L0:
    pop pop ecx
    or or eax, -1
    jmp sub_10108EB4
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [edi]
    add add dword ptr [ebp - 8], eax
    test test byte ptr [ecx + esi + 4], 080h
    je sub_10108EC0
    test test eax, eax
    je L5
    cmp cmp byte ptr [ebx], 10
    jne L6
    mov mov eax, ecx
    lea lea eax, [eax + esi + 4]
    or or byte ptr [eax], 4
    jmp L7
    mov mov eax, dword ptr [edi]
    lea lea eax, [eax + esi + 4]
    and and byte ptr [eax], 0FBh
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    add add ecx, eax
    cmp cmp eax, ecx
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 8], ecx
    jae sub_10108EED
    mov mov eax, dword ptr [ebp + 16]
    mov mov al, byte ptr [eax]
    cmp cmp al, 26
    je sub_10108EEA
    cmp cmp al, 13
    je sub_10108E54
    mov mov byte ptr [ebx], al
    inc inc ebx
    inc inc dword ptr [ebp + 16]
    jmp sub_10108EEB
    dec dec ecx
    cmp cmp dword ptr [ebp + 16], ecx
    jae sub_10108E7F
    mov mov eax, dword ptr [ebp + 16]
    inc inc eax
    cmp cmp byte ptr [eax], 10
    jne sub_10108E83
    add add dword ptr [ebp + 16], 2
    jmp sub_10108EE2
    mov mov dword ptr [ebp + 16], eax
    jmp sub_10108F01
    inc inc dword ptr [ebp + 16]
    push push 0
    lea lea eax, [ebp - 12]
L3:
    push push eax
    push push 1
    lea lea eax, [ebp - 1]
    push push eax
    mov mov eax, dword ptr [edi]
    push push dword ptr [eax + esi]
    call dword ptr [fp_1010C0B4]
    test test eax, eax
    jne sub_10108ED9
    call dword ptr [fp_1010C054]
    test test eax, eax
    jne sub_10108F29
    cmp cmp dword ptr [ebp - 12], 0
    je sub_10108F2F
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 72
    je sub_10108F13
    mov mov al, byte ptr [ebp - 1]
    cmp cmp al, 10
    je sub_10108F25
    mov mov byte ptr [ebx], 13
    mov mov ecx, dword ptr [edi]
    mov mov byte ptr [ecx + esi + 5], al
    jmp sub_10108F4D
    cmp cmp ebx, dword ptr [ebp + 12]
    jne sub_10108F3A
    cmp cmp byte ptr [ebp - 1], 10
    jne sub_10108F40
    mov mov byte ptr [ebx], 10
    jmp sub_10108F5D
    push push 1
    push push -1
    push push dword ptr [ebp + 8]
    call sub_10106B3E
    add add esp, 12
    cmp cmp byte ptr [ebp - 1], 10
    je sub_10108F73
    mov mov byte ptr [ebx], 13
    inc inc ebx
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp + 16], ecx
    jb sub_10108EDB
    jmp sub_10108FA3
    mov mov eax, dword ptr [edi]
    test test byte ptr [eax + esi + 4], 64
    jne sub_10108FAC
    lea lea esi, [eax + esi + 4]
    or or byte ptr [esi], 2
    sub sub ebx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [ebp - 8]
    jmp sub_10108FCB
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
__read_lk ENDP
END
