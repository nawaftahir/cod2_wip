.686
.MODEL FLAT, C
EXTRN sub_100C4D3E:PROC
EXTRN sub_100C98C2:PROC
EXTRN sub_100CB648:PROC
EXTRN sub_100CB664:PROC
EXTRN sub_100CB688:PROC
EXTRN sub_100CB69A:PROC
EXTRN sub_100CB6A5:PROC
EXTRN sub_100CB6B0:PROC
.CODE
FUN_100cb5b2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push esi
    push push 27
    mov mov esi, ecx
    call sub_100C98C2
    test test eax, eax
    jl sub_100CB648
    mov mov eax, dword ptr [esi]
    and and dword ptr [ebp - 4], 0
    push push edi
    push push 0
    mov mov edi, 0E40000h
    push push edi
    push push 0F0000800h
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CB664
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
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
    jl sub_100CB688
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push edi
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CB69A
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CB6A5
    mov mov ecx, esi
    call sub_100C4D3E
    test test eax, eax
    jl sub_100CB6B0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100cb5b2 ENDP
END
