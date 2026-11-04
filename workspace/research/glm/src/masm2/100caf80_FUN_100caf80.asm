.686
.MODEL FLAT, C
EXTRN sub_100C4DF7:PROC
EXTRN sub_100C98DB:PROC
EXTRN sub_100CB0EB:PROC
EXTRN sub_100CB0FB:PROC
EXTRN sub_100CB109:PROC
EXTRN sub_100CB116:PROC
EXTRN sub_100CB117:PROC
EXTRN sub_100CB137:PROC
EXTRN sub_100CB13B:PROC
EXTRN sub_100CB14F:PROC
EXTRN sub_100CB1A1:PROC
EXTRN sub_100CB1B5:PROC
EXTRN sub_100CB1CD:PROC
EXTRN sub_100CB1E5:PROC
EXTRN sub_100CB1F0:PROC
.CODE
FUN_100caf80 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov eax, dword ptr [esi]
    push push 4
    and and edi, 0FFFFFh
    call call dword ptr [eax + 92]
    push push eax
    mov mov ecx, esi
    call sub_100C98DB
    test test eax, eax
    jl sub_100CB0EB
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    lea lea ecx, [ebp - 24]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100CB117
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    push push edi
    push push dword ptr [ecx + 16]
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100CB137
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 8]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CB14F
    and and dword ptr [ebp - 4], 0
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    imul imul ecx, edi
    cmp cmp dword ptr [ebp - 4], 1
    mov mov edx, dword ptr [eax + 8]
    lea lea ebx, [edx + ecx*4]
    jne sub_100CB0FB
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    cmp cmp eax, 070400000h
    jne sub_100CB109
    mov mov dword ptr [ebp - 16], 01000000h
    jmp sub_100CB116
    and and dword ptr [ebp - 16], 0
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 28]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [ebx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CB1A1
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 32]
    push push ecx
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push edi
    push push ebx
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CB1B5
    push push dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 16]
    push push dword ptr [ebp - 32]
    xor xor eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi]
    push push eax
    mov mov ecx, esi
    call call dword ptr [edx + 104]
    test test eax, eax
    jl sub_100CB1CD
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 3
    jb sub_100CB13B
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CB1E5
    mov mov ecx, esi
    call sub_100C4DF7
    test test eax, eax
    jl sub_100CB1F0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100caf80 ENDP
END
