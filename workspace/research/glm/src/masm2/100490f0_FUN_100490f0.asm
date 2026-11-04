.686
.MODEL FLAT, C
EXTRN sub_10048D04:PROC
EXTRN sub_100493D7:PROC
EXTRN sub_100493E4:PROC
EXTRN sub_10049426:PROC
EXTRN sub_1004942A:PROC
.CODE
FUN_100490f0 PROC
    sub sub esp, 40
    push push ebx
    mov mov ebx, dword ptr [esp + 56]
    push push ebp
    mov mov ebp, dword ptr [esp + 56]
    push push esi
    mov mov esi, dword ptr [ebp + 28]
    push push edi
    mov mov edi, dword ptr [esp + 60]
    mov mov ecx, dword ptr [edi + 36]
    mov mov edx, dword ptr [edi + 0E4h]
    shl shl esi, 3
    lea lea eax, [esi + esi]
    push push eax
    push push ecx
    add add edx, 2
    push push edx
    add add ebx, -4
    push push ebx
    call sub_10048D04
    mov mov eax, dword ptr [edi + 0BCh]
    lea lea ecx, [eax + eax*4]
    shl shl ecx, 4
    mov mov edx, ecx
    shl shl eax, 4
    mov mov ecx, 04000h
    sub sub ecx, edx
    mov mov dword ptr [esp + 84], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esp + 76], ecx
    xor xor ecx, ecx
    add add esp, 16
    test test eax, eax
    mov mov dword ptr [esp + 44], ecx
    jle sub_100493D7
    add add esi, -2
    mov mov eax, ebx
    mov mov dword ptr [esp + 52], esi
    mov mov dword ptr [esp + 40], eax
    mov mov ebx, dword ptr [eax + 8]
    mov mov edx, dword ptr [esp + 72]
    mov mov esi, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 12]
    lea lea ebp, [edx + 2]
    mov mov dword ptr [esp + 28], ebp
    movzx movzx ebp, byte ptr [eax]
    mov mov dword ptr [esp + 16], ebp
    movzx movzx ebp, byte ptr [ecx]
    mov mov dword ptr [esp + 48], ebp
    movzx movzx ebp, byte ptr [ebx]
    mov mov dword ptr [esp + 24], ebp
    movzx movzx ebp, byte ptr [edx]
    mov mov dword ptr [esp + 20], ebp
    lea lea ebp, [eax + 2]
    movzx movzx eax, byte ptr [eax + 1]
    mov mov dword ptr [esp + 36], ebp
    lea lea ebp, [ecx + 2]
    movzx movzx ecx, byte ptr [ecx + 1]
    add add eax, ecx
    movzx movzx ecx, byte ptr [ebx + 2]
    mov mov dword ptr [esp + 32], ebp
    add add ecx, dword ptr [esp + 20]
    mov mov ebp, dword ptr [esp + 28]
    movzx movzx ebp, byte ptr [ebp]
    add add ecx, eax
    mov mov eax, dword ptr [esp + 24]
    lea lea edi, [ebx + 2]
    add add ebp, ecx
    mov mov ecx, dword ptr [esp + 16]
    movzx movzx edx, byte ptr [edx + 1]
    add add ebp, eax
    mov mov eax, dword ptr [esp + 48]
    add add ebp, eax
    add add ebp, ecx
    mov mov ecx, dword ptr [esp + 32]
    movzx movzx ecx, byte ptr [ecx]
    add add ecx, eax
    mov mov eax, dword ptr [esp + 36]
    movzx movzx eax, byte ptr [eax]
    lea lea ecx, [ecx + ebp*2]
    mov mov ebp, dword ptr [esp + 16]
    add add eax, ecx
    movzx movzx ecx, byte ptr [ebx + 1]
    add add ecx, dword ptr [esp + 20]
    mov mov ebx, dword ptr [esp + 24]
    add add edx, ecx
    add add eax, ebp
    imul imul eax, dword ptr [esp + 68]
    add add edx, ebx
    imul imul edx, dword ptr [esp + 60]
    lea lea eax, [eax + edx + 08000h]
    mov mov edx, dword ptr [esp + 52]
    sar sar eax, 16
    mov mov byte ptr [esi], al
    mov mov eax, dword ptr [esp + 28]
    inc inc esi
    test test edx, edx
    mov mov dword ptr [esp + 16], esi
    mov mov esi, dword ptr [esp + 32]
    mov mov ecx, edi
    mov mov edi, dword ptr [esp + 36]
    jbe sub_10049426
    mov mov dword ptr [esp + 36], edx
    movzx movzx ebx, byte ptr [esi + 1]
    movzx movzx edx, byte ptr [edi + 1]
    add add edx, ebx
    movzx movzx ebx, byte ptr [ecx - 1]
    add add edx, ebx
    movzx movzx ebx, byte ptr [eax - 1]
    add add edx, ebx
    movzx movzx ebx, byte ptr [edi]
    add add edx, ebx
    movzx movzx ebx, byte ptr [ecx + 2]
    add add edx, ebx
    movzx movzx ebx, byte ptr [esi]
    add add edx, ebx
    movzx movzx ebx, byte ptr [eax + 2]
    add add edx, ebx
    movzx movzx ebx, byte ptr [edi - 1]
    movzx movzx ebp, byte ptr [eax + 1]
    lea lea edx, [ebx + edx*2]
    movzx movzx ebx, byte ptr [esi - 1]
    add add edx, ebx
    movzx movzx ebx, byte ptr [esi + 2]
    add add edx, ebx
    movzx movzx ebx, byte ptr [edi + 2]
    add add edx, ebx
    movzx movzx ebx, byte ptr [ecx + 1]
    imul imul edx, dword ptr [esp + 68]
    add add ebx, ebp
    movzx movzx ebp, byte ptr [ecx]
    add add ebx, ebp
    movzx movzx ebp, byte ptr [eax]
    add add ebx, ebp
    imul imul ebx, dword ptr [esp + 60]
    mov mov ebp, dword ptr [esp + 16]
    lea lea edx, [edx + ebx + 08000h]
    sar sar edx, 16
    mov mov byte ptr [ebp], dl
    mov mov edx, dword ptr [esp + 36]
    inc inc ebp
    add add eax, 2
    add add ecx, 2
    add add esi, 2
    add add edi, 2
    dec dec edx
    mov mov dword ptr [esp + 16], ebp
    mov mov dword ptr [esp + 36], edx
    jne sub_1004942A
    movzx movzx ebx, byte ptr [ecx - 1]
    movzx movzx ebp, byte ptr [eax - 1]
    movzx movzx edx, byte ptr [eax + 1]
    add add ebx, ebp
    movzx movzx ebp, byte ptr [edi]
    add add ebp, edx
    mov mov dword ptr [esp + 36], edx
    movzx movzx edx, byte ptr [esi]
    add add ebp, ebx
    movzx movzx ebx, byte ptr [esi + 1]
    movzx movzx esi, byte ptr [esi - 1]
    add add edx, ebp
    mov mov ebp, edx
    movzx movzx edx, byte ptr [ecx + 1]
    movzx movzx ecx, byte ptr [ecx]
    add add ebp, edx
    mov mov dword ptr [esp + 32], edx
    movzx movzx edx, byte ptr [edi + 1]
    movzx movzx edi, byte ptr [edi - 1]
    add add ebp, ebx
    add add ebp, edx
    add add edi, ebx
    lea lea edi, [edi + ebp*2]
    mov mov ebp, dword ptr [esp + 32]
    add add esi, edi
    mov mov edi, dword ptr [esp + 36]
    add add esi, edx
    movzx movzx edx, byte ptr [eax]
    imul imul esi, dword ptr [esp + 68]
    add add ecx, edi
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 16]
    add add edx, ebp
    imul imul edx, dword ptr [esp + 60]
    lea lea eax, [esi + edx + 08000h]
    mov mov edx, dword ptr [esp + 64]
    sar sar eax, 16
    mov mov byte ptr [ecx], al
    mov mov eax, dword ptr [esp + 40]
    mov mov ecx, dword ptr [esp + 44]
    mov mov esi, dword ptr [edx + 12]
    add add eax, 8
    inc inc ecx
    cmp cmp ecx, esi
    mov mov dword ptr [esp + 40], eax
    mov mov dword ptr [esp + 44], ecx
    jl sub_100493E4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 40
    ret ret
FUN_100490f0 ENDP
END
