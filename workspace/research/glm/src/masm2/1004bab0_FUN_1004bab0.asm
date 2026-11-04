.686
.MODEL FLAT, C
EXTRN sub_1004BBDD:PROC
.CODE
FUN_1004bab0 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [edi + 4]
    mov mov esi, dword ptr [edi + 01ACh]
    push push 0400h
    push push 1
    push push edi
    call call dword ptr [eax]
    push push 0400h
    mov mov dword ptr [esi + 8], eax
    mov mov ecx, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [ecx]
    push push 0400h
    mov mov dword ptr [esi + 12], eax
    mov mov edx, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [edx]
    push push 0400h
    mov mov dword ptr [esi + 16], eax
    mov mov eax, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [eax]
    add add esp, 48
    mov mov dword ptr [esi + 20], eax
    xor xor eax, eax
    mov mov dword ptr [esp + 16], 05B6900h
    mov mov edi, 0FF1DAF00h
    mov mov edx, 0FF4D0B80h
    mov mov ecx, 02C8D00h
    lea lea esp, [esp]
    mov mov ebp, dword ptr [esi + 8]
    mov mov ebx, edx
    sar sar ebx, 16
    mov mov dword ptr [eax + ebp], ebx
    mov mov ebp, dword ptr [esi + 12]
    mov mov ebx, edi
    sar sar ebx, 16
    mov mov dword ptr [eax + ebp], ebx
    mov mov ebp, dword ptr [esi + 16]
    mov mov ebx, dword ptr [esp + 16]
    mov mov dword ptr [eax + ebp], ebx
    mov mov ebp, dword ptr [esi + 20]
    mov mov dword ptr [eax + ebp], ecx
    sub sub ebx, 0B6D2h
    sub sub ecx, 0581Ah
    add add edx, 0166E9h
    add add edi, 01C5A2h
    add add eax, 4
    cmp cmp ecx, 0FFD4CB1Ah
    mov mov dword ptr [esp + 16], ebx
    jge sub_1004BBDD
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1004bab0 ENDP
END
