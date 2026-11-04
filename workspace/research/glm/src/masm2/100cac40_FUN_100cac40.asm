.686
.MODEL FLAT, C
EXTRN sub_100C4DC8:PROC
EXTRN sub_100C98C3:PROC
EXTRN sub_100CAD64:PROC
EXTRN sub_100CAD90:PROC
EXTRN sub_100CADB2:PROC
EXTRN sub_100CADCA:PROC
EXTRN sub_100CADEE:PROC
EXTRN sub_100CADF5:PROC
EXTRN sub_100CAE08:PROC
EXTRN sub_100CAE0C:PROC
EXTRN sub_100CAE3C:PROC
EXTRN sub_100CAE47:PROC
EXTRN sub_100CAE52:PROC
.CODE
FUN_100cac40 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push esi
    push push 1
    mov mov esi, ecx
    call sub_100C98C3
    test test eax, eax
    jl sub_100CAD64
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
    jl sub_100CAD90
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
    jl sub_100CADB2
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CADCA
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CADEE
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [eax + 12]
    push push dword ptr [eax + 8]
    call call dword ptr [edx + 120]
    test test eax, eax
    jl sub_100CAE0C
    mov mov eax, dword ptr [ebp - 4]
    test test eax, 0B000000h
    mov mov ecx, dword ptr [ebp - 16]
    push push dword ptr [ebp - 12]
    mov mov edx, dword ptr [esi]
    je sub_100CADF5
    or or ecx, 0C000000h
    and and eax, 0F4FFFFFFh
    jmp sub_100CAE08
    or or ecx, 01000000h
    push push ecx
    mov mov ecx, esi
    push push eax
    call call dword ptr [edx + 104]
    test test eax, eax
    jl sub_100CAE3C
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAE47
    mov mov ecx, esi
    call sub_100C4DC8
    test test eax, eax
    jl sub_100CAE52
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_100cac40 ENDP
END
