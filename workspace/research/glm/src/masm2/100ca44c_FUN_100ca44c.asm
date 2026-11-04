.686
.MODEL FLAT, C
EXTRN sub_1008B1FD:PROC
EXTRN sub_100C4DF1:PROC
EXTRN sub_100C9994:PROC
EXTRN sub_100CA5CC:PROC
EXTRN sub_100CA5D2:PROC
EXTRN sub_100CA5DC:PROC
EXTRN sub_100CA5EC:PROC
EXTRN sub_100CA631:PROC
EXTRN sub_100CA632:PROC
EXTRN sub_100CA683:PROC
EXTRN sub_100CA6A3:PROC
EXTRN sub_100CA6B7:PROC
EXTRN sub_100CA6C2:PROC
EXTRN sub_100CA6CD:PROC
EXTRN sub_100CA6D1:PROC
.CODE
FUN_100ca44c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    test test byte ptr [esi + 110], 64
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    je L2
    mov mov edi, dword ptr [eax + 4]
    xor xor edx, edx
    test test edi, edi
    jbe L0
    mov mov ebx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edi, dword ptr [ecx]
    mov mov edi, dword ptr [ebx + edi*4]
    cmp cmp dword ptr [edi + 16], edx
    jne L3
    mov mov edi, dword ptr [eax + 4]
    inc inc edx
    add add ecx, 4
    cmp cmp edx, edi
    jb L1
    cmp cmp edi, 3
    je L4
    push push 01011A874h
    jmp sub_100CA5D2
    push push 01011A850h
    jmp sub_100CA5DC
    cmp cmp dword ptr [eax + 4], 4
    je L5
    push push 01011A810h
    jmp sub_100CA5EC
    mov mov ecx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [edx + 4]
    cmp cmp ecx, dword ptr [esi + 080h]
    jne L6
    mov mov eax, dword ptr [esi]
L3:
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    push push edx
    mov mov ecx, esi
    call call dword ptr [eax + 088h]
    test test eax, eax
    jge L7
    push push 01011A2D0h
    push push 01194h
    push push 0
    jmp sub_100CA632
    cmp cmp ecx, dword ptr [esi + 088h]
    jne sub_100CA631
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 4], ecx
    mov mov eax, dword ptr [edx + 12]
    mov mov dword ptr [ebp - 8], eax
    jmp sub_100CA5CC
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 8]
    mov mov edi, ecx
    or or edi, -8
    shl shl edi, 20
    and and ecx, 24
    or or edi, ecx
    and and eax, 07FFh
    shl shl edi, 8
    push push 65
    mov mov ecx, esi
    or or edi, eax
    call sub_100C9994
    test test eax, eax
    jl sub_100CA683
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 124]
    test test eax, eax
    jl sub_100CA6A3
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push 0F0000h
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CA6B7
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CA6C2
    mov mov ecx, esi
    call sub_100C4DF1
    test test eax, eax
    jl sub_100CA6CD
    xor xor eax, eax
    jmp sub_100CA6D1
    push push 01011A7DCh
    push push 01194h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B1FD
    add add esp, 16
    mov mov eax, 080004005h
L7:
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100ca44c ENDP
END
