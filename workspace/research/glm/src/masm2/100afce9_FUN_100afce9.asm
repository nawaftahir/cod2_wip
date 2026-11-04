.686
.MODEL FLAT, C
EXTRN sub_100AFE4E:PROC
EXTRN sub_100AFE6A:PROC
EXTRN sub_100AFE7F:PROC
EXTRN sub_100AFEA3:PROC
EXTRN sub_100AFEB7:PROC
EXTRN sub_100AFECD:PROC
EXTRN sub_100AFED8:PROC
EXTRN sub_100AFEE3:PROC
EXTRN sub_100AFEF3:PROC
EXTRN sub_100AFF09:PROC
EXTRN sub_100AFF1C:PROC
EXTRN sub_100AFF25:PROC
EXTRN sub_100C4DBC:PROC
EXTRN sub_100C98F6:PROC
EXTRN sub_100C99B9:PROC
.CODE
FUN_100afce9 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    push push edi
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    and and ebx, 0FFFFFh
    cmp cmp eax, 0104h
    mov mov ecx, esi
    push push 64
    jne L0
    call sub_100C98F6
    test test eax, eax
    jl L1
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push 0
    lea lea ecx, [ebp - 4]
    push push ecx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100AFE4E
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    push push ebx
    push push dword ptr [ecx + 16]
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100AFE6A
    mov mov eax, dword ptr [esi]
    push push 0
    push push 070000h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100AFE7F
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100AFEA3
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push ebx
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100AFEB7
    push push dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi]
    push push 0E40000h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100AFECD
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100AFED8
    mov mov ecx, esi
    call sub_100C4DBC
    test test eax, eax
    jl sub_100AFEE3
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    call sub_100C99B9
    test test eax, eax
    jl sub_100AFEF3
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    push push 0
    lea lea ecx, [ebp - 4]
    push push ecx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100AFF09
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    push push ebx
    push push dword ptr [ecx + 16]
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100AFF25
    mov mov eax, dword ptr [esi]
    push push 0
    push push 0F0000h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    jmp sub_100AFF1C
FUN_100afce9 ENDP
END
