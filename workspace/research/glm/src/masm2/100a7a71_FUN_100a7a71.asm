.686
.MODEL FLAT, C
EXTRN sub_1006C5C7:PROC
EXTRN sub_10085410:PROC
EXTRN sub_1008548A:PROC
EXTRN sub_100858A0:PROC
EXTRN sub_1008591E:PROC
EXTRN sub_100861A2:PROC
EXTRN sub_10086242:PROC
EXTRN sub_100A7C34:PROC
EXTRN sub_100A7C3C:PROC
EXTRN sub_100A7C76:PROC
EXTRN sub_100A7CAC:PROC
EXTRN sub_100A7CB6:PROC
EXTRN sub_100A7CBC:PROC
EXTRN sub_100A7CDC:PROC
EXTRN sub_100A7CF7:PROC
EXTRN sub_100A7D77:PROC
EXTRN sub_100A7D95:PROC
EXTRN sub_100A7D9F:PROC
EXTRN sub_100A7DB5:PROC
EXTRN sub_100A7DBB:PROC
.CODE
FUN_100a7a71 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    and and dword ptr [ebp - 4], 0
    push push ebx
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 76], 0
    push push edi
    jbe L2
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + ecx*4]
    test test edx, edx
    je L3
    mov mov ecx, dword ptr [edx]
    mov mov eax, ecx
    and and eax, 0FFF00000h
    cmp cmp eax, 072100000h
    je sub_100A7C34
    test test eax, eax
    je sub_100A7C3C
    sub sub eax, 011000000h
    mov mov ebx, 0FFFFFh
    and and ecx, ebx
    neg neg eax
    sbb sbb eax, eax
    and and eax, ecx
    shl shl eax, 2
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [edx + 8]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 5], 2
    je sub_100A7C76
    push push 116
    call sub_100858A0
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_10085410
    mov mov edi, eax
    jmp L1
    xor xor edi, edi
    test test edi, edi
    je sub_100A7CAC
    mov mov eax, dword ptr [ebp - 8]
    push push 0
    push push dword ptr [ebp - 8]
    and and eax, ebx
    push push dword ptr [ebp - 8]
    or or eax, 010000000h
    push push eax
    mov mov ecx, edi
    call sub_1008591E
    test test eax, eax
    jl sub_100A7CDC
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, edi
    call sub_1008548A
    test test eax, eax
    jl sub_100A7CF7
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 16], ebx
    jbe sub_100A7CB6
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 12], eax
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086242
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx + 60], 0
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + ebx*4], eax
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [ebp - 12]
L0:
    mov mov ecx, dword ptr [ebx + ecx]
    mov mov edx, dword ptr [edi + 8]
    mov mov ebx, dword ptr [ebp - 16]
    mov mov dword ptr [edx + ebx*4], ecx
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + 8]
    add add dword ptr [ebp - 12], 4
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp - 8]
    mov mov dword ptr [edx + ecx], eax
    mov mov dword ptr [ebp - 16], ebx
    jb sub_100A7CBC
    lea lea eax, [esi + 0220h]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 0200h
    jae sub_100A7D77
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov dword ptr [edx + ecx*4], edi
    inc inc dword ptr [eax]
    push push edi
    mov mov ecx, esi
    call sub_100861A2
    test test eax, eax
    jl sub_100A7D95
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 76]
    jb L2
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100A7D9F
    mov mov esi, 08007000Eh
    jmp sub_100A7DBB
    mov mov esi, eax
    push push 1
    mov mov ecx, edi
L2:
    call sub_1006C5C7
L3:
    mov mov eax, esi
    jmp sub_100A7DB5
FUN_100a7a71 ENDP
END
