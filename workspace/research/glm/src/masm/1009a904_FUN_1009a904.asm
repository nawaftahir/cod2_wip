.686
.MODEL FLAT, C
EXTRN sub_100650C3:PROC
EXTRN sub_1008277D:PROC
EXTRN sub_10082ADC:PROC
EXTRN sub_100F7902:PROC
EXTRN sub_100F794E:PROC
.CODE
FUN_1009a904 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov dword ptr [ebp - 4], ecx
    je L4
    cmp dword ptr [edi + 4], 3
    jne L4
    cmp dword ptr [edi + 16], 2
    jne L4
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    je L4
    cmp dword ptr [esi + 4], 3
    jne L4
    lea ebx, [esi + 16]
    cmp dword ptr [ebx], 9
    jne L4
    push 48
    call sub_100650C3
    test eax, eax
    je L0
    push ebx
    mov ecx, eax
    call sub_10082ADC
    mov dword ptr [ebp + 8], eax
    jmp L1
L0:
    and dword ptr [ebp + 8], 0
L1:
    cmp dword ptr [ebp + 8], 0
    je L4
    mov eax, dword ptr [edi + 24]
    mov ebx, dword ptr [esi + 24]
    push eax
    push 010110458h
    mov dword ptr [ebp + 12], eax
    lea eax, [ebp - 20]
    push 16
    push eax
    call sub_100F7902
    lea eax, [ebp - 20]
    add esp, 16
    mov byte ptr [ebp - 5], 0
    lea ecx, [eax + 1]
L2:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L2
    sub eax, ecx
    mov ecx, ebx
    lea esi, [ecx + 1]
L3:
    mov dl, byte ptr [ecx]
    inc ecx
    test dl, dl
    jne L3
    sub ecx, esi
    lea edi, [ecx + eax + 1]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 4]
    push 1
    push edi
    call sub_1008277D
    mov esi, eax
    test esi, esi
    je L4
    push ebx
    push dword ptr [ebp + 12]
    push 0101149ACh
    push edi
    push esi
    call sub_100F794E
    mov eax, dword ptr [ebp + 8]
    mov byte ptr [esi + edi - 1], 0
    add esp, 20
    mov dword ptr [eax + 24], esi
    jmp L5
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_1009a904 ENDP
END
