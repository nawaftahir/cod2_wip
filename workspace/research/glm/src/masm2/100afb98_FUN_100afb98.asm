.686
.MODEL FLAT, C
EXTRN sub_100AFD29:PROC
EXTRN sub_100AFD4F:PROC
EXTRN sub_100AFD68:PROC
EXTRN sub_100AFD93:PROC
EXTRN sub_100AFDAB:PROC
EXTRN sub_100AFDBF:PROC
EXTRN sub_100AFDCA:PROC
EXTRN sub_100AFDD3:PROC
EXTRN sub_100AFDD7:PROC
EXTRN sub_100AFDE2:PROC
EXTRN sub_100AFE04:PROC
EXTRN sub_100AFE18:PROC
EXTRN sub_100AFE23:PROC
EXTRN sub_100AFE2E:PROC
EXTRN sub_100C4DB1:PROC
EXTRN sub_100C4E0A:PROC
EXTRN sub_100C98EC:PROC
EXTRN sub_100C99A9:PROC
.CODE
FUN_100afb98 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov eax, dword ptr [esi + 0C8h]
    and and edi, 0FFFFFh
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    mov mov dword ptr [ebp - 8], edi
    push push 66
    jne L0
    call sub_100C98EC
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jl sub_100AFD29
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    push push ebx
    push push ebx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    cmp cmp eax, ebx
    jl sub_100AFD4F
    mov mov eax, dword ptr [esi]
    push push ebx
    mov mov ebx, 0F0000h
    push push ebx
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100AFD68
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + 20]
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea edi, [eax + edi*4]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100AFD93
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    push push ebx
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100AFDAB
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100AFDBF
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100AFDCA
    mov mov ecx, esi
    call sub_100C4DB1
    test test eax, eax
    jge sub_100AFDD3
    jmp sub_100AFDD7
    call sub_100C99A9
    xor xor edi, edi
    cmp cmp eax, edi
    jl sub_100AFDE2
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    push push edi
    push push edi
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    cmp cmp eax, edi
    jl sub_100AFE04
    mov mov eax, dword ptr [esi]
    push push edi
    push push 0F0000h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    cmp cmp eax, edi
    jl sub_100AFE18
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    cmp cmp eax, edi
    jl sub_100AFE23
    mov mov ecx, esi
    call sub_100C4E0A
    cmp cmp eax, edi
    jl sub_100AFE2E
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100afb98 ENDP
END
