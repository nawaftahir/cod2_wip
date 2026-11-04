.686
.MODEL FLAT, C
EXTRN sub_100C4DFF:PROC
EXTRN sub_100C9915:PROC
EXTRN sub_100CA0B8:PROC
EXTRN sub_100CA0E0:PROC
EXTRN sub_100CA102:PROC
EXTRN sub_100CA116:PROC
EXTRN sub_100CA140:PROC
EXTRN sub_100CA161:PROC
EXTRN sub_100CA175:PROC
EXTRN sub_100CA180:PROC
EXTRN sub_100CA18B:PROC
.CODE
FUN_100c9f0b PROC
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
    cmp cmp eax, 074300000h
    je L0
    cmp cmp eax, 074400000h
    je L1
    cmp cmp eax, 074500000h
    je L3
    cmp cmp eax, 074600000h
    je L2
    cmp cmp eax, 074700000h
    jne L4
    push push 3
    jmp L5
    push push 4
    jmp L6
    push push 5
    jmp L7
    push push 2
    pop pop ecx
    shl shl ecx, 16
    or or ecx, 45
    push push ecx
    mov mov ecx, esi
    call sub_100C9915
    test test eax, eax
    jl sub_100CA0B8
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
L3:
    test test eax, eax
    jl sub_100CA0E0
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
L5:
    push push 0F0000h
    push push edi
    push push dword ptr [ecx + 8]
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA102
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA116
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
    jl sub_100CA140
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
    jl sub_100CA161
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA175
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CA180
    mov mov ecx, esi
    call sub_100C4DFF
    test test eax, eax
    jl sub_100CA18B
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c9f0b ENDP
END
