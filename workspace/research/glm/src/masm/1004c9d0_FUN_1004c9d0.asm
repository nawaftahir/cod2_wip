.686
.MODEL FLAT, C
EXTRN sub_1004C8CA:PROC
EXTRN sub_1004C912:PROC
.CODE
FUN_1004c9d0 PROC
    push ecx
    push ebx
    mov ebx, dword ptr [esp + 12]
    push edi
    mov edi, ecx
    cmp eax, edi
    mov dword ptr [esp + 8], edi
    jge L1
    push edi
    push eax
    push edx
    push ebx
    call sub_1004C8CA
    add esp, 16
    test al, al
    jne L0
    pop edi
    or eax, 0FFFFFFFFh
    pop ebx
    pop ecx
    ret
L0:
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [ebx + 12]
L1:
    push ebp
    sub eax, edi
    push esi
    mov ecx, eax
    mov esi, edx
    sar esi, cl
    mov ecx, edi
    mov ebp, 1
    shl ebp, cl
    mov ecx, dword ptr [esp + 28]
    dec ebp
    and esi, ebp
    cmp esi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [esp + 16]
    jle L4
L2:
    shl esi, 1
    cmp eax, 1
    jge L3
    push 1
    push eax
    push edx
    push ebx
    call sub_1004C912
    add esp, 16
    test al, al
    je L5
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [ebx + 12]
L3:
    dec eax
    mov ecx, eax
    mov ebp, edx
    sar ebp, cl
    mov ecx, dword ptr [esp + 28]
    and ebp, 1
    or esi, ebp
    mov ebp, dword ptr [ecx + edi*4 + 4]
    inc edi
    cmp esi, ebp
    jg L2
L4:
    cmp edi, 16
    mov dword ptr [ebx + 8], edx
    mov dword ptr [ebx + 12], eax
    jle L6
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 118
    mov ebx, dword ptr [ebx + 16]
    mov edx, dword ptr [ebx]
    push -1
    push ebx
    call dword ptr [edx + 4]
    add esp, 8
    pop esi
    pop ebp
    pop edi
    xor eax, eax
    pop ebx
    pop ecx
    ret
L5:
    pop esi
    pop ebp
    pop edi
    or eax, 0FFFFFFFFh
    pop ebx
    pop ecx
    ret
L6:
    mov eax, dword ptr [ecx + edi*4 + 72]
    add eax, dword ptr [ecx + 00000008Ch]
    movzx eax, byte ptr [eax + esi + 17]
    pop esi
    pop ebp
    pop edi
    pop ebx
    pop ecx
    ret
FUN_1004c9d0 ENDP
END
