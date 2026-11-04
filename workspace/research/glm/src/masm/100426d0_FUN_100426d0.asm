.686
.MODEL FLAT, C
.CODE
FUN_100426d0 PROC
    sub esp, 8
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [eax + 4]
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [eax + 000000158h]
    push edi
    push 000002000h
    push 1
    push eax
    call dword ptr [ecx]
    xor edx, edx
    mov dword ptr [esi + 8], eax
    add esp, 12
    xor ebx, ebx
    xor edi, edi
    xor esi, esi
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 28], 000807FFFh
    mov ecx, 000008000h
    add eax, 000000800h
    jmp L0
    lea esp, [esp]
    nop
L0:
    mov ebp, dword ptr [esp + 28]
    mov dword ptr [eax + 000000C00h], ebp
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [eax + 000001000h], ebp
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [eax + 000001400h], ebp
    add dword ptr [esp + 28], 000008000h
    sub dword ptr [esp + 16], 000006B2Fh
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [eax], ecx
    mov dword ptr [eax - 000000800h], edx
    mov dword ptr [eax - 000000400h], esi
    mov dword ptr [eax + 000000400h], edi
    mov dword ptr [eax + 000000800h], ebx
    add ecx, 000001D2Fh
    sub ebp, 0000014D1h
    add edx, 000004C8Bh
    add eax, 4
    add esi, 000009646h
    sub edi, 000002B33h
    sub ebx, 0000054CDh
    cmp ecx, 0001D91D1h
    mov dword ptr [esp + 20], ebp
    jle L0
FUN_100426d0 ENDP
END
