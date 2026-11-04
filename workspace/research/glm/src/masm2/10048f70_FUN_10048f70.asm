.686
.MODEL FLAT, C
EXTRN sub_10048D01:PROC
EXTRN sub_10049049:PROC
EXTRN sub_1004904C:PROC
EXTRN sub_10049051:PROC
EXTRN sub_10049058:PROC
.CODE
FUN_10048f70 PROC
    sub sub esp, 8
    push push ebx
    mov mov ebx, dword ptr [esp + 20]
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push edi
    mov mov edi, dword ptr [ebx + 28]
    shl shl edi, 3
    lea lea eax, [edi + edi]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [eax + 36]
    mov mov edx, dword ptr [eax + 0E4h]
    push push ecx
    push push edx
    push push ebp
    mov mov dword ptr [esp + 28], edi
    call sub_10048D01
    mov mov eax, dword ptr [ebx + 12]
    add add esp, 16
    test test eax, eax
    mov mov dword ptr [esp + 24], 0
    jle sub_1004904C
    mov mov edx, dword ptr [esp + 36]
    sub sub edx, ebp
    mov mov dword ptr [esp + 16], edx
    push push esi
    mov mov edi, edi
    mov mov ecx, dword ptr [edx + ebp]
    mov mov eax, dword ptr [ebp]
    xor xor esi, esi
    test test edi, edi
    jbe sub_10049051
    lea lea esp, [esp]
    movzx movzx edx, byte ptr [eax + 1]
    movzx movzx ebx, byte ptr [eax]
    add add edx, esi
    add add ebx, edx
    sar sar ebx, 1
    mov mov byte ptr [ecx], bl
    inc inc ecx
    xor xor esi, 1
    add add eax, 2
    dec dec edi
    jne sub_10049049
    mov mov edi, dword ptr [esp + 16]
    mov mov ebx, dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [ebx + 12]
    inc inc eax
    add add ebp, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 28], eax
    jl sub_10049058
    pop pop esi
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10048f70 ENDP
END
