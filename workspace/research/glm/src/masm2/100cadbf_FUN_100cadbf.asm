.686
.MODEL FLAT, C
EXTRN sub_100C4DD4:PROC
EXTRN sub_100C98DB:PROC
EXTRN sub_100CAF07:PROC
EXTRN sub_100CAF33:PROC
EXTRN sub_100CAF53:PROC
EXTRN sub_100CAF5B:PROC
EXTRN sub_100CAF6B:PROC
EXTRN sub_100CAF9A:PROC
EXTRN sub_100CAFAE:PROC
EXTRN sub_100CAFC2:PROC
EXTRN sub_100CAFDE:PROC
EXTRN sub_100CAFE9:PROC
.CODE
FUN_100cadbf PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    mov mov eax, dword ptr [esi]
    push push edi
    push push 18
    and and ebx, 0FFFFFh
    call call dword ptr [eax + 92]
    push push eax
    mov mov ecx, esi
    call sub_100C98DB
    test test eax, eax
    jl sub_100CAF07
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    lea lea ecx, [ebp - 24]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100CAF33
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    push push ebx
    push push dword ptr [ecx + 16]
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100CAF53
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CAF6B
    and and dword ptr [ebp - 12], 0
    and and dword ptr [ebp - 8], 0
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [eax + 8]
    add add edi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 28]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CAF9A
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 32]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push ebx
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CAFAE
    push push dword ptr [ebp - 28]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CAFC2
    inc inc dword ptr [ebp - 12]
    mov mov eax, ebx
    shl shl eax, 2
    add add dword ptr [ebp - 8], eax
    cmp cmp dword ptr [ebp - 12], 3
    jb sub_100CAF5B
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAFDE
    mov mov ecx, esi
    call sub_100C4DD4
    test test eax, eax
    jl sub_100CAFE9
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100cadbf ENDP
END
