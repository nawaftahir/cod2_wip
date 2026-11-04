.686
.MODEL FLAT, C
EXTRN sub_100C4E6B:PROC
EXTRN sub_100C9909:PROC
EXTRN sub_100CB2CB:PROC
EXTRN sub_100CB2F7:PROC
EXTRN sub_100CB319:PROC
EXTRN sub_100CB331:PROC
EXTRN sub_100CB36F:PROC
EXTRN sub_100CB38F:PROC
EXTRN sub_100CB3A3:PROC
EXTRN sub_100CB3CD:PROC
EXTRN sub_100CB3EC:PROC
EXTRN sub_100CB400:PROC
EXTRN sub_100CB40B:PROC
EXTRN sub_100CB416:PROC
.CODE
FUN_100cb0be PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax]
    mov mov ebx, ecx
    mov mov eax, 0FFFFFh
    and and ebx, eax
    sub sub ecx, 070500003h
    push push edi
    je L0
    sub sub ecx, 0100000h
    je L2
    dec dec ecx
    je L1
    sub sub ecx, eax
    je L1
    dec dec ecx
    jne L3
    push push 20
    jmp L4
    push push 22
    jmp L5
    push push 21
    jmp L6
    push push 23
    jmp L7
    push push 24
    pop pop eax
    jmp L8
    mov mov eax, dword ptr [ebp - 24]
    push push eax
    mov mov ecx, esi
    call sub_100C9909
    test test eax, eax
    jl sub_100CB2CB
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    lea lea ecx, [ebp - 24]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
L1:
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
L4:
    jl sub_100CB2F7
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push dword ptr [eax + 12]
    mov mov ecx, esi
    push push dword ptr [eax + 16]
    call call dword ptr [edx + 112]
    test test eax, eax
    jl sub_100CB319
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CB331
    mov mov edx, dword ptr [esi + 20]
    xor xor eax, eax
    cmp cmp ebx, 3
    setne setne al
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    dec dec eax
    and and eax, 0FFF80000h
    add add eax, 0F0000h
    mov mov dword ptr [ebp - 8], eax
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CB36F
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 0100h]
    push push ebx
    push push dword ptr [ecx + 8]
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CB38F
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CB3A3
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edi, ebx
    shl shl edi, 2
    mov mov ecx, dword ptr [edi + ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CB3CD
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    add add ecx, edi
    push push ebx
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CB3EC
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CB400
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CB40B
    mov mov ecx, esi
    call sub_100C4E6B
    test test eax, eax
    jl sub_100CB416
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100cb0be ENDP
END
