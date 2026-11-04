.686
.MODEL FLAT, C
EXTRN sub_100A5855:PROC
EXTRN sub_100A5873:PROC
EXTRN sub_100C4940:PROC
.CODE
FUN_100a5802 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [edi]
    mov mov ecx, dword ptr [edx + ecx*4]
    push push dword ptr [ecx + 108]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    cmp cmp eax, 17
    jne sub_100A5855
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [eax], 0E40000h
    xor xor eax, eax
    jmp sub_100A5873
    push push dword ptr [ebp + 20]
    mov mov ecx, esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push edi
    call sub_100C4940
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 16
FUN_100a5802 ENDP
END
