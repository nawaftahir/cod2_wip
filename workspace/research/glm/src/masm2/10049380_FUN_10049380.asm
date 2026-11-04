.686
.MODEL FLAT, C
EXTRN sub_10048D01:PROC
EXTRN sub_10049552:PROC
EXTRN sub_10049562:PROC
EXTRN sub_1004958D:PROC
EXTRN sub_10049591:PROC
.CODE
FUN_10049380 PROC
    sub sub esp, 24
    push push ebx
    mov mov ebx, dword ptr [esp + 36]
    push push ebp
    mov mov ebp, dword ptr [esp + 44]
    push push esi
    mov mov esi, dword ptr [ebx + 28]
    push push edi
    mov mov edi, dword ptr [esp + 44]
    mov mov eax, dword ptr [edi + 36]
    mov mov ecx, dword ptr [edi + 0E4h]
    shl shl esi, 3
    push push esi
    push push eax
    add add ecx, 2
    push push ecx
    lea lea edx, [ebp - 4]
    push push edx
    call sub_10048D01
    mov mov eax, dword ptr [edi + 0BCh]
    mov mov ecx, 080h
    sub sub ecx, eax
    shl shl eax, 6
    shl shl ecx, 9
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [ebx + 12]
    mov mov dword ptr [esp + 36], ecx
    xor xor ecx, ecx
    add add esp, 16
    test test eax, eax
    mov mov dword ptr [esp + 28], ecx
    jle sub_10049552
    add add esi, -2
    lea lea eax, [ebp + 4]
    mov mov dword ptr [esp + 36], esi
    mov mov dword ptr [esp + 32], eax
    mov mov edi, edi
    mov mov edx, dword ptr [esp + 56]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [eax - 8]
    mov mov ebp, dword ptr [eax]
    movzx movzx edx, byte ptr [edi]
    movzx movzx ebx, byte ptr [edi + 1]
    mov mov dword ptr [esp + 52], ecx
    mov mov ecx, dword ptr [eax - 4]
    movzx movzx esi, byte ptr [ecx]
    movzx movzx eax, byte ptr [ebp]
    add add eax, esi
    add add edx, eax
    movzx movzx eax, byte ptr [ebp + 1]
    inc inc ebp
    inc inc edi
    mov mov dword ptr [esp + 44], edx
    add add eax, ebx
    movzx movzx ebx, byte ptr [ecx + 1]
    add add edx, edx
    inc inc ecx
    sub sub edx, esi
    imul imul esi, dword ptr [esp + 20]
    add add eax, ebx
    mov mov ebx, dword ptr [esp + 36]
    add add edx, eax
    imul imul edx, dword ptr [esp + 16]
    lea lea edx, [edx + esi + 08000h]
    mov mov esi, dword ptr [esp + 52]
    sar sar edx, 16
    mov mov byte ptr [esi], dl
    mov mov edx, dword ptr [esp + 44]
    inc inc esi
    test test ebx, ebx
    mov mov dword ptr [esp + 52], esi
    mov mov dword ptr [esp + 44], eax
    jbe sub_1004958D
    mov mov dword ptr [esp + 24], ebx
    movzx movzx esi, byte ptr [ecx]
    movzx movzx ebx, byte ptr [edi + 1]
    movzx movzx eax, byte ptr [ebp + 1]
    inc inc ecx
    inc inc edi
    inc inc ebp
    add add eax, ebx
    movzx movzx ebx, byte ptr [ecx]
    sub sub edx, esi
    imul imul esi, dword ptr [esp + 20]
    add add eax, ebx
    mov mov ebx, dword ptr [esp + 44]
    add add edx, eax
    add add edx, ebx
    imul imul edx, dword ptr [esp + 16]
    lea lea edx, [edx + esi + 08000h]
    mov mov esi, dword ptr [esp + 52]
    sar sar edx, 16
    mov mov byte ptr [esi], dl
    mov mov edx, ebx
    mov mov ebx, dword ptr [esp + 24]
    inc inc esi
    dec dec ebx
    mov mov dword ptr [esp + 52], esi
    mov mov dword ptr [esp + 44], eax
    mov mov dword ptr [esp + 24], ebx
    jne sub_10049591
    movzx movzx ecx, byte ptr [ecx]
    add add eax, eax
    sub sub eax, ecx
    imul imul ecx, dword ptr [esp + 20]
    add add eax, edx
    imul imul eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 48]
    lea lea ecx, [eax + ecx + 08000h]
    mov mov eax, dword ptr [esp + 32]
    sar sar ecx, 16
    mov mov byte ptr [esi], cl
    mov mov ecx, dword ptr [esp + 28]
    mov mov esi, dword ptr [edx + 12]
    inc inc ecx
    add add eax, 4
    cmp cmp ecx, esi
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esp + 32], eax
    jl sub_10049562
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
FUN_10049380 ENDP
END
