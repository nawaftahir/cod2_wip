.686
.MODEL FLAT, C
EXTRN sub_100C99CC:PROC
EXTRN sub_100C9A4B:PROC
.CODE
FUN_100b7518 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    or edi, dword ptr [ebp + 12]
    mov esi, ecx
    push edi
    call sub_100C99CC
    test eax, eax
    jl L5
    test edi, 000002000h
    je L4
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jb L4
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [esi + 16]
    shl eax, 2
    mov ecx, dword ptr [ecx + eax]
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 16
    je L0
    mov eax, 0F0E40800h
    jmp L3
L0:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx]
    mov eax, dword ptr [ecx + 12]
    mov ecx, dword ptr [ecx + 16]
    and eax, 0000007FFh
    or eax, 0B0000000h
    sub ecx, 0
    je L3
    dec ecx
    je L2
    dec ecx
    je L1
    dec ecx
    jne L3
    or eax, 000FF0000h
    jmp L3
L1:
    or eax, 000AA0000h
    jmp L3
L2:
    or eax, 000550000h
L3:
    push eax
    mov ecx, esi
    call sub_100C9A4B
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebp
    ret 12
FUN_100b7518 ENDP
END
