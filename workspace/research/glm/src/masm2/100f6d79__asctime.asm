.686
.MODEL FLAT, C
EXTRN sub_100FB11E:PROC
EXTRN sub_100FC47D:PROC
.CODE
_asctime PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    call sub_100FB11E
    mov mov esi, eax
    cmp cmp dword ptr [esi + 60], 0
    jne L0
    push push 26
    call sub_100FC47D
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 60], eax
    mov mov edx, 0101ADD60h
    je L1
    mov mov edx, dword ptr [esi + 60]
    mov mov ecx, dword ptr [esp + 24]
    mov mov eax, dword ptr [ecx + 24]
    lea lea edi, [eax + eax*2]
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [esp + 16], edx
    lea lea ebp, [eax + eax*2]
    xor xor esi, esi
    mov mov al, byte ptr [edi + esi + 01017C8CCh]
    mov mov byte ptr [edx], al
    mov mov al, byte ptr [esi + ebp + 01017C8E4h]
L1:
    inc inc esi
    mov mov byte ptr [edx + 4], al
    inc inc edx
    cmp cmp esi, 3
    jl L2
    mov mov byte ptr [edx], 32
    add add edx, 4
    mov mov byte ptr [edx], 32
    mov mov eax, dword ptr [ecx + 12]
    lea lea esi, [edx + 1]
    cdq cdq
    push push 10
    pop pop edi
    mov mov ebx, edi
    idiv idiv ebx
    mov mov bl, 48
    mov mov ebp, edi
    push push 100
    add add al, bl
    mov mov byte ptr [esi], al
    add add dl, bl
    inc inc esi
    mov mov byte ptr [esi], dl
    mov mov byte ptr [esi + 1], 32
    mov mov eax, dword ptr [ecx + 8]
    cdq cdq
    idiv idiv ebp
    add add esi, 2
    add add al, bl
    mov mov byte ptr [esi], al
    add add dl, bl
    inc inc esi
    mov mov byte ptr [esi], dl
    mov mov byte ptr [esi + 1], 58
    mov mov eax, dword ptr [ecx + 4]
    cdq cdq
    idiv idiv ebp
    add add esi, 2
    add add al, bl
    mov mov byte ptr [esi], al
    add add dl, bl
    inc inc esi
    mov mov byte ptr [esi], dl
    mov mov byte ptr [esi + 1], 58
    mov mov eax, dword ptr [ecx]
    cdq cdq
    idiv idiv ebp
    add add esi, 2
    pop pop ebp
    push push 100
    add add al, bl
    mov mov byte ptr [esi], al
    add add dl, bl
    inc inc esi
    mov mov byte ptr [esi], dl
    mov mov byte ptr [esi + 1], 32
    mov mov eax, dword ptr [ecx + 20]
    cdq cdq
    idiv idiv ebp
    mov mov ebp, edi
    add add esi, 2
    add add eax, 19
    cdq cdq
    idiv idiv ebp
    add add al, bl
    mov mov byte ptr [esi], al
    add add dl, bl
    inc inc esi
    mov mov byte ptr [esi], dl
    mov mov eax, dword ptr [ecx + 20]
    cdq cdq
    pop pop ecx
    idiv idiv ecx
    lea lea ecx, [esi + 1]
    mov mov eax, edx
    cdq cdq
    idiv idiv edi
    pop pop edi
    add add al, bl
    mov mov byte ptr [ecx], al
    mov mov eax, dword ptr [esp + 12]
    inc inc ecx
    add add dl, bl
    mov mov byte ptr [ecx], dl
    mov mov byte ptr [ecx + 1], 10
    mov mov byte ptr [ecx + 2], 0
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
_asctime ENDP
END
