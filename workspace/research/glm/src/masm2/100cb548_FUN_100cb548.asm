.686
.MODEL FLAT, C
EXTRN sub_100C4D25:PROC
EXTRN sub_100C98C2:PROC
EXTRN sub_100CB5C4:PROC
EXTRN sub_100CB5E8:PROC
EXTRN sub_100CB5FE:PROC
EXTRN sub_100CB609:PROC
EXTRN sub_100CB614:PROC
.CODE
FUN_100cb548 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push esi
    push push 38
    mov mov esi, ecx
    call sub_100C98C2
    test test eax, eax
    jl sub_100CB5C4
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CB5E8
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push 0E40000h
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CB5FE
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CB609
    mov mov ecx, esi
    call sub_100C4D25
    test test eax, eax
    jl sub_100CB614
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_100cb548 ENDP
END
