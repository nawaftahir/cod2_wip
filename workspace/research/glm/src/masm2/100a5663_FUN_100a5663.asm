.686
.MODEL FLAT, C
EXTRN sub_1008B0F5:PROC
EXTRN sub_100A57AD:PROC
EXTRN sub_100A57C5:PROC
EXTRN sub_100A57D7:PROC
EXTRN sub_100A57E4:PROC
EXTRN sub_100A57FC:PROC
EXTRN sub_100A5810:PROC
EXTRN sub_100A5826:PROC
EXTRN sub_100A583A:PROC
EXTRN sub_100A5845:PROC
EXTRN sub_100A5850:PROC
EXTRN sub_100C4DB1:PROC
EXTRN sub_100C9931:PROC
.CODE
FUN_100a5663 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0100h
    ja L1
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115CD0h
    push push 0119Fh
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B0F5
    add add esp, 16
    mov mov eax, 080004001h
    jmp sub_100A57AD
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp eax, -1
    je L2
    push push eax
    mov mov ecx, esi
    call L0
L0:
    test test eax, eax
    jl sub_100A57C5
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi + 0138h], eax
    jne L3
    xor xor eax, eax
    jmp sub_100A57D7
    push push 1
    mov mov ecx, esi
    call sub_100C9931
    test test eax, eax
    jl sub_100A57E4
    mov mov eax, dword ptr [esi]
    push push edi
    push push 0
    mov mov edi, 010000h
    push push edi
    push push 0B0000000h
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100A57FC
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100A5810
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push edi
    push push 1
L2:
    lea lea ecx, [ebp + 8]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100A5826
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100A583A
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100A5845
    mov mov ecx, esi
    call sub_100C4DB1
    test test eax, eax
    jl sub_100A5850
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 0138h], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100a5663 ENDP
END
