.686
.MODEL FLAT, C
EXTRN sub_100AFAED:PROC
EXTRN sub_100AFB13:PROC
EXTRN sub_100AFB27:PROC
EXTRN sub_100AFB4E:PROC
EXTRN sub_100AFB64:PROC
EXTRN sub_100AFB7F:PROC
EXTRN sub_100AFB8A:PROC
EXTRN sub_100AFB95:PROC
EXTRN sub_100C4D94:PROC
EXTRN sub_100C98D3:PROC
.CODE
FUN_100af9eb PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    mov mov edi, dword ptr [eax]
    push push 66
    and and edi, 0FFFFFh
    call sub_100C98D3
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jl sub_100AFAED
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
    jl sub_100AFB13
    mov mov eax, dword ptr [esi]
    push push ebx
    push push 0F0000h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    cmp cmp eax, ebx
    jl sub_100AFB27
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + 20]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ebx, [eax + edi*4]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100AFB4E
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push 0F0000h
    push push edi
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100AFB64
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    or or ecx, 09000000h
    push push ecx
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100AFB7F
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100AFB8A
    mov mov ecx, esi
    call sub_100C4D94
    test test eax, eax
    jl sub_100AFB95
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100af9eb ENDP
END
