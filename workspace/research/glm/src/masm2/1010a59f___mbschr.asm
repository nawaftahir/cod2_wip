.686
.MODEL FLAT, C
EXTRN sub_100F65D4:PROC
EXTRN sub_100FB11C:PROC
EXTRN sub_10106E97:PROC
EXTRN sub_1010A624:PROC
EXTRN sub_1010A625:PROC
EXTRN sub_1010A62D:PROC
EXTRN sub_1010A644:PROC
EXTRN sub_1010A652:PROC
EXTRN sub_1010A65B:PROC
EXTRN sub_1010A663:PROC
EXTRN sub_1010A68D:PROC
EXTRN EXTRN g_1076AA34:DWORD:DWORD
.CODE
__mbschr PROC
    push push ebp
    mov mov ebp, esp
    call sub_100FB11C
    mov mov eax, dword ptr [eax + 96]
    cmp cmp eax, dword ptr [g_1076AA34]
    je L0
    call sub_10106E97
    cmp cmp dword ptr [eax + 8], 0
    jne L1
    pop pop ebp
    jmp sub_100F65D4
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    push push esi
    jmp sub_1010A624
L0:
    movzx movzx esi, dl
    test test byte ptr [esi + eax + 29], 4
    je sub_1010A625
    inc inc ecx
    mov mov bl, byte ptr [ecx]
    test test bl, bl
    je sub_1010A652
    movzx movzx edx, dx
    movzx movzx esi, bl
L1:
    shl shl edx, 8
    or or edx, esi
    cmp cmp dword ptr [ebp + 12], edx
    jne sub_1010A644
    lea lea eax, [ecx - 1]
    jmp sub_1010A663
    movzx movzx esi, dx
    cmp cmp dword ptr [ebp + 12], esi
    je sub_1010A65B
    inc inc ecx
    movzx movzx dx, byte ptr [ecx]
    test test dx, dx
    jne sub_1010A62D
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx edx, dx
    sub sub eax, edx
    neg neg eax
    sbb sbb eax, eax
    not not eax
    and and eax, ecx
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
    xor xor eax, eax
    jmp sub_1010A68D
__mbschr ENDP
END
