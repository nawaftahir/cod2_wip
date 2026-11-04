.686
.MODEL FLAT, C
EXTRN sub_100F65D4:PROC
EXTRN sub_100FB11C:PROC
EXTRN sub_10106E97:PROC
EXTRN g_1076AA34:DWORD
.CODE
__mbschr PROC
    push ebp
    mov ebp, esp
    call sub_100FB11C
    mov eax, dword ptr [eax + 96]
    cmp eax, dword ptr [g_1076AA34]
    je L0
    call sub_10106E97
L0:
    cmp dword ptr [eax + 8], 0
    jne L1
    pop ebp
    jmp sub_100F65D4
L1:
    mov ecx, dword ptr [ebp + 8]
    push ebx
    push esi
    jmp L5
L2:
    movzx esi, dl
    test byte ptr [esi + eax + 29], 4
    je L3
    inc ecx
    mov bl, byte ptr [ecx]
    test bl, bl
    je L8
    movzx edx, dx
    movzx esi, bl
    shl edx, 8
    or edx, esi
    cmp dword ptr [ebp + 12], edx
    jne L4
    lea eax, [ecx - 1]
    jmp L7
L3:
    movzx esi, dx
    cmp dword ptr [ebp + 12], esi
    je L6
L4:
    inc ecx
L5:
    movzx dx, byte ptr [ecx]
    test dx, dx
    jne L2
L6:
    mov eax, dword ptr [ebp + 12]
    movzx edx, dx
    sub eax, edx
    neg eax
    sbb eax, eax
    not eax
    and eax, ecx
L7:
    pop esi
    pop ebx
    pop ebp
    ret
L8:
    xor eax, eax
    jmp L7
__mbschr ENDP
END
