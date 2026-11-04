.686
.MODEL FLAT, C
EXTRN sub_100C4DFF:PROC
EXTRN sub_100C9915:PROC
EXTRN sub_100CABA1:PROC
EXTRN sub_100CABA5:PROC
EXTRN sub_100CABA9:PROC
EXTRN sub_100CABB9:PROC
EXTRN sub_100CABC0:PROC
EXTRN sub_100CABC4:PROC
EXTRN sub_100CABC7:PROC
EXTRN sub_100CABEC:PROC
EXTRN sub_100CAC0E:PROC
EXTRN sub_100CAC22:PROC
EXTRN sub_100CAC4C:PROC
EXTRN sub_100CAC6D:PROC
EXTRN sub_100CAC81:PROC
EXTRN sub_100CAC8C:PROC
EXTRN sub_100CAC97:PROC
.CODE
FUN_100caa17 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    push push edi
    mov mov edi, eax
    and and eax, 0FFF00000h
    xor xor ecx, ecx
    and and edi, 0FFFFFh
    cmp cmp eax, 073000000h
    je L0
    cmp cmp eax, 073900000h
    je sub_100CABA1
    cmp cmp eax, 073A00000h
    je sub_100CABA5
    cmp cmp eax, 073B00000h
    je sub_100CABA9
    cmp cmp eax, 073C00000h
    jne L1
    push push 2
    pop pop ecx
    shl shl ecx, 16
    or or ecx, 41
    push push ecx
    mov mov ecx, esi
    call sub_100C9915
    test test eax, eax
    jl sub_100CABC4
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CABEC
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    push push 0F0000h
    push push edi
    push push dword ptr [ecx + 8]
L1:
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CAC0E
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CAC22
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ebx, edi
    shl shl ebx, 2
    mov mov ecx, dword ptr [ebx + ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CAC4C
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    push push 0F0000h
    add add ecx, ebx
    push push edi
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CAC6D
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CAC81
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAC8C
    mov mov ecx, esi
    call sub_100C4DFF
    test test eax, eax
    jl sub_100CAC97
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    push push 5
    jmp sub_100CABB9
    push push 4
    jmp sub_100CABC0
    push push 3
    jmp sub_100CABC7
FUN_100caa17 ENDP
END
