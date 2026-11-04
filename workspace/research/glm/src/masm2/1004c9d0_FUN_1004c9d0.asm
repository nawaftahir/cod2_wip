.686
.MODEL FLAT, C
EXTRN sub_1004C8CA:PROC
EXTRN sub_1004C912:PROC
EXTRN sub_1004CAA9:PROC
EXTRN sub_1004CAEE:PROC
EXTRN sub_1004CB21:PROC
.CODE
FUN_1004c9d0 PROC
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [esp + 12]
    push push edi
    mov mov edi, ecx
    cmp cmp eax, edi
    mov mov dword ptr [esp + 8], edi
    jge L0
    push push edi
    push push eax
    push push edx
    push push ebx
    call sub_1004C8CA
    add add esp, 16
    test test al, al
    jne L1
    pop pop edi
    or or eax, -1
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [ebx + 12]
    push push ebp
    sub sub eax, edi
    push push esi
    mov mov ecx, eax
    mov mov esi, edx
    sar sar esi, cl
    mov mov ecx, edi
    mov mov ebp, 1
L0:
    shl shl ebp, cl
    mov mov ecx, dword ptr [esp + 28]
    dec dec ebp
    and and esi, ebp
    cmp cmp esi, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [esp + 16]
    jle sub_1004CAA9
    shl shl esi, 1
    cmp cmp eax, 1
    jge L2
    push push 1
    push push eax
    push push edx
    push push ebx
    call sub_1004C912
    add add esp, 16
    test test al, al
    je sub_1004CAEE
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [ebx + 12]
    dec dec eax
    mov mov ecx, eax
    mov mov ebp, edx
    sar sar ebp, cl
    mov mov ecx, dword ptr [esp + 28]
    and and ebp, 1
    or or esi, ebp
    mov mov ebp, dword ptr [ecx + edi*4 + 4]
    inc inc edi
    cmp cmp esi, ebp
    jg sub_1004CAA9
    cmp cmp edi, 16
    mov mov dword ptr [ebx + 8], edx
    mov mov dword ptr [ebx + 12], eax
    jle sub_1004CB21
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ecx + 20], 118
    mov mov ebx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebx]
    push push -1
    push push ebx
    call call dword ptr [edx + 4]
    add add esp, 8
    pop pop esi
    pop pop ebp
    pop pop edi
    xor xor eax, eax
    pop pop ebx
    pop pop ecx
    ret ret
    pop pop esi
    pop pop ebp
    pop pop edi
    or or eax, -1
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [ecx + edi*4 + 72]
    add add eax, dword ptr [ecx + 08Ch]
    movzx movzx eax, byte ptr [eax + esi + 17]
    pop pop esi
    pop pop ebp
    pop pop edi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1004c9d0 ENDP
END
