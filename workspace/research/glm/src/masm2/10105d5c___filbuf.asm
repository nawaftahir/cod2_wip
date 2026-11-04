.686
.MODEL FLAT, C
EXTRN sub_10105E48:PROC
EXTRN sub_10105E50:PROC
EXTRN sub_10105E51:PROC
EXTRN sub_10105E5F:PROC
EXTRN sub_10105E62:PROC
EXTRN sub_10105E6D:PROC
EXTRN sub_10105E80:PROC
EXTRN sub_10105E85:PROC
EXTRN sub_10105E93:PROC
EXTRN sub_10105EC2:PROC
EXTRN sub_10105ECA:PROC
EXTRN sub_10105ECF:PROC
EXTRN sub_10106AF8:PROC
EXTRN sub_10108E4B:PROC
.CODE
__filbuf PROC
    push push esi
    mov mov esi, dword ptr [esp + 8]
    mov mov eax, dword ptr [esi + 12]
    test test al, 083h
    je sub_10105E48
    test test al, 64
    jne sub_10105E50
    test test al, 2
    je L0
    or or eax, 32
    mov mov dword ptr [esi + 12], eax
    jmp sub_10105E5F
    or or eax, 1
    test test ax, 010Ch
    mov mov dword ptr [esi + 12], eax
    jne L1
    push push esi
    call sub_10106AF8
    pop pop ecx
    jmp L2
    mov mov eax, dword ptr [esi + 8]
    mov mov dword ptr [esi], eax
    push push dword ptr [esi + 24]
    push push dword ptr [esi + 8]
    push push dword ptr [esi + 16]
    call sub_10108E4B
    add add esp, 12
    test test eax, eax
    mov mov dword ptr [esi + 4], eax
    je sub_10105E80
    cmp cmp eax, -1
    je sub_10105E85
    mov mov edx, dword ptr [esi + 12]
    test test dl, 082h
    jne sub_10105E62
    mov mov ecx, dword ptr [esi + 16]
    cmp cmp ecx, -1
    push push edi
    je sub_10105E51
L1:
    mov mov edi, ecx
    sar sar edi, 5
    mov mov edi, dword ptr [edi*4 + 01076ACA0h]
    and and ecx, 31
    lea lea ecx, [ecx + ecx*8]
    lea lea edi, [edi + ecx*4]
    jmp sub_10105E6D
    mov mov edi, 0101A4E60h
    mov mov cl, byte ptr [edi + 4]
    and and cl, 082h
    cmp cmp cl, 082h
    pop pop edi
    jne sub_10105E93
    or or edx, 02000h
    mov mov dword ptr [esi + 12], edx
    cmp cmp dword ptr [esi + 24], 0200h
    jne sub_10105EC2
    mov mov ecx, dword ptr [esi + 12]
    test test cl, 8
    je sub_10105ECA
    test test ch, 4
    jne sub_10105ECF
    mov mov dword ptr [esi + 24], 01000h
    mov mov ecx, dword ptr [esi]
    dec dec eax
    mov mov dword ptr [esi + 4], eax
    movzx movzx eax, byte ptr [ecx]
    inc inc ecx
    mov mov dword ptr [esi], ecx
    pop pop esi
    ret ret
    neg neg eax
    sbb sbb eax, eax
    and and eax, 16
    add add eax, 16
    or or dword ptr [esi + 12], eax
    and and dword ptr [esi + 4], 0
    or or eax, -1
    pop pop esi
    ret ret
__filbuf ENDP
END
