.686
.MODEL FLAT, C
EXTRN sub_10106AF8:PROC
EXTRN sub_10108E4B:PROC
.CODE
__filbuf PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 12]
    test al, 000000083h
    je L8
    test al, 64
    jne L8
    test al, 2
    je L0
    or eax, 32
    mov dword ptr [esi + 12], eax
    jmp L8
L0:
    or eax, 1
    test ax, 00000010Ch
    mov dword ptr [esi + 12], eax
    jne L1
    push esi
    call sub_10106AF8
    pop ecx
    jmp L2
L1:
    mov eax, dword ptr [esi + 8]
    mov dword ptr [esi], eax
L2:
    push dword ptr [esi + 24]
    push dword ptr [esi + 8]
    push dword ptr [esi + 16]
    call sub_10108E4B
    add esp, 12
    test eax, eax
    mov dword ptr [esi + 4], eax
    je L7
    cmp eax, -1
    je L7
    mov edx, dword ptr [esi + 12]
    test dl, 000000082h
    jne L5
    mov ecx, dword ptr [esi + 16]
    cmp ecx, -1
    push edi
    je L3
    mov edi, ecx
    sar edi, 5
    mov edi, dword ptr [edi*4 + 01076ACA0h]
    and ecx, 31
    lea ecx, [ecx + ecx*8]
    lea edi, [edi + ecx*4]
    jmp L4
L3:
    mov edi, 0101A4E60h
L4:
    mov cl, byte ptr [edi + 4]
    and cl, 000000082h
    cmp cl, 000000082h
    pop edi
    jne L5
    or edx, 000002000h
    mov dword ptr [esi + 12], edx
L5:
    cmp dword ptr [esi + 24], 000000200h
    jne L6
    mov ecx, dword ptr [esi + 12]
    test cl, 8
    je L6
    test ch, 4
    jne L6
    mov dword ptr [esi + 24], 000001000h
L6:
    mov ecx, dword ptr [esi]
    dec eax
    mov dword ptr [esi + 4], eax
    movzx eax, byte ptr [ecx]
    inc ecx
    mov dword ptr [esi], ecx
    pop esi
    ret
L7:
    neg eax
    sbb eax, eax
    and eax, 16
    add eax, 16
    or dword ptr [esi + 12], eax
    and dword ptr [esi + 4], 0
L8:
    or eax, 0FFFFFFFFh
    pop esi
    ret
__filbuf ENDP
END
