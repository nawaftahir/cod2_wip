.686
.MODEL FLAT, C
EXTRN sub_100FB11E:PROC
EXTRN sub_100FC47D:PROC
.CODE
_asctime PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    call sub_100FB11E
    mov esi, eax
    cmp dword ptr [esi + 60], 0
    jne L0
    push 26
    call sub_100FC47D
    test eax, eax
    pop ecx
    mov dword ptr [esi + 60], eax
    mov edx, 0101ADD60h
    je L1
L0:
    mov edx, dword ptr [esi + 60]
L1:
    mov ecx, dword ptr [esp + 24]
    mov eax, dword ptr [ecx + 24]
    lea edi, [eax + eax*2]
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [esp + 16], edx
    lea ebp, [eax + eax*2]
    xor esi, esi
L2:
    mov al, byte ptr [edi + esi + 01017C8CCh]
    mov byte ptr [edx], al
    mov al, byte ptr [esi + ebp + 01017C8E4h]
    inc esi
    mov byte ptr [edx + 4], al
    inc edx
    cmp esi, 3
    jl L2
    mov byte ptr [edx], 32
    add edx, 4
    mov byte ptr [edx], 32
    mov eax, dword ptr [ecx + 12]
    lea esi, [edx + 1]
    cdq
    push 10
    pop edi
    mov ebx, edi
    idiv ebx
    mov bl, 48
    mov ebp, edi
    push 100
    add al, bl
    mov byte ptr [esi], al
    add dl, bl
    inc esi
    mov byte ptr [esi], dl
    mov byte ptr [esi + 1], 32
    mov eax, dword ptr [ecx + 8]
    cdq
    idiv ebp
    add esi, 2
    add al, bl
    mov byte ptr [esi], al
    add dl, bl
    inc esi
    mov byte ptr [esi], dl
    mov byte ptr [esi + 1], 58
    mov eax, dword ptr [ecx + 4]
    cdq
    idiv ebp
    add esi, 2
    add al, bl
    mov byte ptr [esi], al
    add dl, bl
    inc esi
    mov byte ptr [esi], dl
    mov byte ptr [esi + 1], 58
    mov eax, dword ptr [ecx]
    cdq
    idiv ebp
    add esi, 2
    pop ebp
    push 100
    add al, bl
    mov byte ptr [esi], al
    add dl, bl
    inc esi
    mov byte ptr [esi], dl
    mov byte ptr [esi + 1], 32
    mov eax, dword ptr [ecx + 20]
    cdq
    idiv ebp
    mov ebp, edi
    add esi, 2
    add eax, 19
    cdq
    idiv ebp
    add al, bl
    mov byte ptr [esi], al
    add dl, bl
    inc esi
    mov byte ptr [esi], dl
    mov eax, dword ptr [ecx + 20]
    cdq
    pop ecx
    idiv ecx
    lea ecx, [esi + 1]
    mov eax, edx
    cdq
    idiv edi
    pop edi
    add al, bl
    mov byte ptr [ecx], al
    mov eax, dword ptr [esp + 12]
    inc ecx
    add dl, bl
    mov byte ptr [ecx], dl
    mov byte ptr [ecx + 1], 10
    mov byte ptr [ecx + 2], 0
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
_asctime ENDP
END
