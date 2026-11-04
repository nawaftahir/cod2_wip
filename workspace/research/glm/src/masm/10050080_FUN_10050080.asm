.686
.MODEL FLAT, C
.CODE
FUN_10050080 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [edi + 4]
    mov esi, dword ptr [edi + 0000001A8h]
    push 000000400h
    push 1
    push edi
    call dword ptr [eax]
    push 000000400h
    mov dword ptr [esi + 16], eax
    mov ecx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [ecx]
    push 000000400h
    mov dword ptr [esi + 20], eax
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx]
    push 000000400h
    mov dword ptr [esi + 24], eax
    mov eax, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [eax]
    add esp, 48
    mov dword ptr [esi + 28], eax
    xor eax, eax
    mov dword ptr [esp + 16], 0005B6900h
    mov edi, 0FF1DAF00h
    mov edx, 0FF4D0B80h
    mov ecx, 0002C8D00h
    lea esp, [esp]
L0:
    mov ebp, dword ptr [esi + 16]
    mov ebx, edx
    sar ebx, 16
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 20]
    mov ebx, edi
    sar ebx, 16
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 24]
    mov ebx, dword ptr [esp + 16]
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 28]
    mov dword ptr [eax + ebp], ecx
    sub ebx, 00000B6D2h
    sub ecx, 00000581Ah
    add edx, 0000166E9h
    add edi, 00001C5A2h
    add eax, 4
    cmp ecx, 0FFD4CB1Ah
    mov dword ptr [esp + 16], ebx
    jge L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10050080 ENDP
END
