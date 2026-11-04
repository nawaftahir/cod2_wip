.686
.MODEL FLAT, C
EXTRN sub_100650C3:PROC
EXTRN sub_1008277D:PROC
EXTRN sub_10082ADC:PROC
EXTRN sub_1009AA03:PROC
EXTRN sub_1009AA0D:PROC
EXTRN sub_1009AA17:PROC
EXTRN sub_1009AA22:PROC
EXTRN sub_1009AA2C:PROC
EXTRN sub_1009AA38:PROC
EXTRN sub_1009AA39:PROC
EXTRN sub_1009AA55:PROC
EXTRN sub_1009AA5A:PROC
EXTRN sub_1009AAB0:PROC
EXTRN sub_1009AAD2:PROC
EXTRN sub_100F7902:PROC
EXTRN sub_100F794E:PROC
.CODE
FUN_1009a904 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov dword ptr [ebp - 4], ecx
    je sub_1009AA03
    cmp cmp dword ptr [edi + 4], 3
    jne sub_1009AA0D
    cmp cmp dword ptr [edi + 16], 2
    jne sub_1009AA17
    mov mov esi, dword ptr [ebp + 12]
    test test esi, esi
    je sub_1009AA22
    cmp cmp dword ptr [esi + 4], 3
    jne sub_1009AA2C
    lea lea ebx, [esi + 16]
    cmp cmp dword ptr [ebx], 9
    jne sub_1009AA38
    push push 48
    call sub_100650C3
    test test eax, eax
    je L0
    push push ebx
    mov mov ecx, eax
    call sub_10082ADC
    mov mov dword ptr [ebp + 8], eax
    jmp L1
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebp + 8], 0
    je sub_1009AA5A
    mov mov eax, dword ptr [edi + 24]
    mov mov ebx, dword ptr [esi + 24]
    push push eax
    push push 010110458h
    mov mov dword ptr [ebp + 12], eax
    lea lea eax, [ebp - 20]
    push push 16
    push push eax
    call sub_100F7902
    lea lea eax, [ebp - 20]
    add add esp, 16
    mov mov byte ptr [ebp - 5], 0
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne sub_1009AA39
    sub sub eax, ecx
    mov mov ecx, ebx
    lea lea esi, [ecx + 1]
    mov mov dl, byte ptr [ecx]
    inc inc ecx
    test test dl, dl
    jne sub_1009AA55
    sub sub ecx, esi
    lea lea edi, [ecx + eax + 1]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 4]
    push push 1
    push push edi
    call sub_1008277D
    mov mov esi, eax
    test test esi, esi
    je sub_1009AAB0
    push push ebx
    push push dword ptr [ebp + 12]
    push push 0101149ACh
    push push edi
L1:
    push push esi
    call sub_100F794E
    mov mov eax, dword ptr [ebp + 8]
    mov mov byte ptr [esi + edi - 1], 0
    add add esp, 20
    mov mov dword ptr [eax + 24], esi
    jmp sub_1009AAD2
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_1009a904 ENDP
END
