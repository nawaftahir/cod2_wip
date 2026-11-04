.686
.MODEL FLAT, C
EXTRN sub_100A58A2:PROC
EXTRN sub_100A58AF:PROC
EXTRN sub_100C41C4:PROC
.CODE
FUN_100a5849 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, dword ptr [ebp + 20]
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    push push ebx
    push push dword ptr [ebp + 16]
    mov mov esi, ecx
    push push dword ptr [ebp + 12]
    push push edi
    call sub_100C41C4
    test test eax, eax
    jl sub_100A58A2
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    cmp cmp eax, 17
    jne sub_100A58AF
    mov mov dword ptr [ebx], 1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 16
FUN_100a5849 ENDP
END
