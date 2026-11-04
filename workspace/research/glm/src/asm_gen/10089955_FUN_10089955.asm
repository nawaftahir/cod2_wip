; FUN_10089955 @ 0x10089955 — auto-synthesized
    sub_10086190 PROTO C
.CODE
FUN_10089955 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    lea eax, [edx + edi*4]
    lea esi, [esi + eax*4]
    cmp dword ptr [esi], -1
    jne L0
    mov eax, dword ptr [ecx + 0x14]
    push ebx
    mov ebx, dword ptr [ebp + 0x14]
    shl ebx, 2
    mov eax, dword ptr [ebx + eax]
    cmp dword ptr [eax + 0xc], -1
    jne L1
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [eax + 0xc], edi
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [eax + 0x10], edx
    mov eax, dword ptr [ebp + 0x14]
    jmp L2
    fld qword ptr [eax + 0x20]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edx
    push edi
    push dword ptr [ecx + 0x78]
    call sub_10086190
    mov dword ptr [esi], eax
    pop ebx
    mov eax, dword ptr [esi]
    pop edi
    pop esi
    pop ebp
    ret 0x10
FUN_10089955 ENDP
END