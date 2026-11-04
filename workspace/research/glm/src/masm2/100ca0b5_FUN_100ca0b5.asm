.686
.MODEL FLAT, C
EXTRN sub_100853FB:PROC
EXTRN sub_1008540C:PROC
EXTRN sub_1008541D:PROC
EXTRN sub_1008542E:PROC
EXTRN sub_100C4EE8:PROC
EXTRN sub_100C992A:PROC
EXTRN sub_100CA360:PROC
EXTRN sub_100CA383:PROC
EXTRN sub_100CA39D:PROC
EXTRN sub_100CA3B5:PROC
EXTRN sub_100CA3D7:PROC
EXTRN sub_100CA3F1:PROC
EXTRN sub_100CA409:PROC
EXTRN sub_100CA42B:PROC
EXTRN sub_100CA445:PROC
EXTRN sub_100CA45D:PROC
EXTRN sub_100CA47F:PROC
EXTRN sub_100CA495:PROC
EXTRN sub_100CA4A9:PROC
EXTRN sub_100CA4C7:PROC
EXTRN sub_100CA4DD:PROC
EXTRN sub_100CA4F1:PROC
EXTRN sub_100CA4FC:PROC
EXTRN sub_100CA507:PROC
.CODE
FUN_100ca0b5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [ecx + 12]
    push push edi
    mov mov edi, dword ptr [ecx]
    mov mov dword ptr [ebp - 40], eax
    lea lea eax, [ebp - 24]
    push push eax
    push push 0
    and and edi, 0FFFFFh
    call sub_100853FB
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 20]
    push push eax
    push push 1
    call sub_1008540C
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 28]
    push push eax
    push push 2
    call sub_1008541D
    mov mov ecx, dword ptr [esi + 0100h]
    lea lea eax, [ebp - 32]
    push push eax
    push push 3
    call sub_1008542E
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax + 16]
    mov mov eax, dword ptr [esi]
    push push 93
    mov mov ecx, esi
    call call dword ptr [eax + 92]
    push push eax
    mov mov ecx, esi
    call sub_100C992A
    test test eax, eax
    jl sub_100CA360
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 36]
    push push ecx
    lea lea ecx, [ebp - 44]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100CA383
    push push dword ptr [ebp - 36]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 16]
    push push ecx
    push push dword ptr [ebp - 40]
    mov mov ecx, esi
    push push ebx
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100CA39D
    push push dword ptr [ebp - 44]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100CA3B5
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CA3D7
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push edi
    push push dword ptr [ebp - 20]
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA3F1
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA409
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CA42B
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push edi
    push push dword ptr [ebp - 24]
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA445
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA45D
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CA47F
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push edi
    push push dword ptr [ebp - 28]
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA495
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA4A9
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CA4C7
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push edi
    push push dword ptr [ebp - 32]
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100CA4DD
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CA4F1
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CA4FC
    mov mov ecx, esi
    call sub_100C4EE8
    test test eax, eax
    jl sub_100CA507
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100ca0b5 ENDP
END
