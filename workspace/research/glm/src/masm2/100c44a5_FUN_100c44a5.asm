.686
.MODEL FLAT, C
EXTRN sub_1008B292:PROC
EXTRN sub_1008B39F:PROC
EXTRN sub_100C47C3:PROC
EXTRN sub_100C47CA:PROC
EXTRN sub_100C47EB:PROC
EXTRN sub_100C4838:PROC
EXTRN sub_100C488F:PROC
EXTRN sub_100C48B4:PROC
EXTRN sub_100C48D6:PROC
EXTRN sub_100C48F8:PROC
EXTRN sub_100C491A:PROC
EXTRN sub_100C491D:PROC
EXTRN sub_100C492E:PROC
EXTRN sub_100C493C:PROC
EXTRN sub_100C493F:PROC
EXTRN sub_100C4950:PROC
EXTRN sub_100C495E:PROC
EXTRN sub_100C4961:PROC
EXTRN sub_100C4972:PROC
EXTRN sub_100C4978:PROC
EXTRN sub_100C497B:PROC
EXTRN sub_100C4983:PROC
EXTRN sub_100C4990:PROC
EXTRN sub_100C4998:PROC
EXTRN sub_100C49CC:PROC
EXTRN sub_100C49FE:PROC
EXTRN sub_100C4A31:PROC
EXTRN sub_100C4A36:PROC
EXTRN sub_100C4A5C:PROC
EXTRN sub_100C4A72:PROC
.CODE
FUN_100c44a5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 4]
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 088h], eax
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ebx, 040000h
    jne L1
    mov mov eax, dword ptr [edi + 12]
    and and dword ptr [ebp + 8], 0
    cmp cmp eax, dword ptr [esi + 44]
    mov mov dword ptr [ebp - 8], eax
    jb L0
    push push 01011A2A8h
    push push 01199h
    jmp L18
    mov mov ecx, dword ptr [esi + 80]
    test test ecx, ecx
    je L4
    cmp cmp eax, ecx
    jb L5
    sub sub eax, ecx
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp + 8], 3
    jmp L6
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edx, ecx
    and and edx, 16
    je L2
    test test cl, 4
    je L3
    mov mov dword ptr [ebp + 8], 15
    xor xor eax, eax
    mov mov dword ptr [ebp - 8], eax
L0:
    jmp L7
    test test edx, edx
    mov mov eax, 0200h
    je L8
    test test eax, ecx
    jne L9
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp + 8]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 088h]
    test test eax, eax
    jl sub_100C4838
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [edi + 60]
    and and dword ptr [ebp - 4], 0
    and and ecx, 01F0000h
    cmp cmp ecx, 0100000h
    jne L28
    mov mov dword ptr [ebp - 4], 0B000000h
    jmp sub_100C47EB
    mov mov edx, ecx
    and and edx, eax
    je L15
    test test ecx, 042080h
    jne L17
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 56]
    mov mov dword ptr [ebp - 8], eax
    jb L12
    push push 010119E50h
    push push 0119Bh
    jmp L29
    cmp cmp eax, 0800h
    jae L16
    mov mov dword ptr [ebp + 8], 2
    jmp L21
    cmp cmp eax, 01000h
    jae L20
    mov mov dword ptr [ebp + 8], 11
    jmp L22
    cmp cmp eax, 01800h
    sbb sbb ecx, ecx
    add add ecx, 13
    mov mov dword ptr [ebp + 8], ecx
    and and eax, 07FFh
    jmp L10
    test test edx, edx
    je L25
    test test cl, cl
    js L26
    test test ch, 32
    je L27
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 96]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp + 8], 14
    jb L14
L8:
    push push 01011A354h
    push push 01194h
    jmp sub_100C47CA
    test test cl, cl
    jns L30
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 76]
    mov mov dword ptr [ebp + 8], 10
    mov mov dword ptr [ebp - 8], eax
    jb L19
    push push 010119F18h
    jmp L11
    test test ebx, ecx
    je sub_100C47C3
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 64]
    mov mov dword ptr [ebp + 8], 7
    mov mov dword ptr [ebp - 8], eax
    jb L23
    push push 01011A32Ch
    jmp L13
    mov mov eax, dword ptr [esi + 090h]
    cmp cmp eax, dword ptr [edi + 4]
    jne sub_100C492E
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 52]
L11:
    mov mov dword ptr [ebp + 8], 19
    mov mov dword ptr [ebp - 8], eax
    jb L24
    push push 01011A254h
    push push 011C5h
    mov mov eax, dword ptr [esi + 0100h]
    push push dword ptr [eax + 60]
    push push esi
L13:
    call sub_1008B292
    mov mov eax, 088760B59h
    jmp sub_100C497B
    cmp cmp ecx, 0180000h
    jne sub_100C488F
L14:
    mov mov dword ptr [ebp - 4], 0C000000h
    jmp sub_100C491D
    cmp cmp ecx, 080000h
    jne sub_100C48B4
    mov mov dword ptr [ebp - 4], 01000000h
    jmp sub_100C492E
    cmp cmp ecx, 020000h
    jne sub_100C48D6
    mov mov dword ptr [ebp - 4], 02000000h
    jmp sub_100C493F
    cmp cmp ecx, 0A0000h
    jne sub_100C48F8
    mov mov dword ptr [ebp - 4], 03000000h
    jmp sub_100C4950
    cmp cmp ecx, 060000h
    jne sub_100C491A
    mov mov dword ptr [ebp - 4], 04000000h
    jmp sub_100C4961
    cmp cmp ecx, 0E0000h
    jne sub_100C493C
    mov mov dword ptr [ebp - 4], 05000000h
    jmp sub_100C4972
    cmp cmp ecx, 010000h
    jne sub_100C495E
    mov mov dword ptr [ebp - 4], 06000000h
    jmp sub_100C4983
    cmp cmp ecx, ebx
    jne sub_100C4978
    mov mov dword ptr [ebp - 4], 07000000h
    jmp sub_100C4990
    cmp cmp ecx, 0C0000h
    jne sub_100C4998
    mov mov dword ptr [ebp - 4], 08000000h
    mov mov ecx, dword ptr [ebp + 12]
    test test ecx, ecx
    je sub_100C49CC
    mov mov edx, dword ptr [ebp + 8]
    mov mov ebx, edx
    or or ebx, -8
L27:
    shl shl ebx, 20
    and and edx, 24
    or or ebx, edx
    shl shl ebx, 8
    and and eax, 07FFh
    or or ebx, eax
    or or ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx], ebx
    mov mov eax, dword ptr [ebp + 16]
    test test eax, eax
    je sub_100C49FE
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [eax], edx
    cmp cmp dword ptr [edi + 8], -1
    je sub_100C4A31
    cmp cmp dword ptr [esi + 0154h], 0
    jne sub_100C4A36
    mov mov eax, dword ptr [esi + 0100h]
    push push 01011A300h
    push push 0119Fh
    push push dword ptr [eax + 60]
    jmp sub_100C4A5C
    or or byte ptr [ecx + 1], 32
    xor xor eax, eax
    jmp sub_100C4A72
    push push 01011A2D0h
    push push 0
    push push 0
    push push esi
    call sub_1008B39F
    mov mov eax, 080004005h
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
FUN_100c44a5 ENDP
END
