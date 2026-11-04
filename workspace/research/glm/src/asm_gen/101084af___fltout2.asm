; __fltout2 @ 0x101084af — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_100fe8e8 PROTO C
    sub_10100db5 PROTO C
    sub_10108412 PROTO C
    sub_10109828 PROTO C
.CODE
__fltout2 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x2c
    mov eax, dword ptr [g_101a50d0]
    mov dword ptr [ebp - 4], eax
    push esi
    push edi
    lea eax, [ebp + 8]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_10108412
    pop ecx
    pop ecx
    lea eax, [ebp - 0x2c]
    push eax
    push 0
    push 0x11
    sub esp, 0xc
    lea esi, [ebp - 0x10]
    mov edi, esp
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsw word ptr es:[edi], word ptr [esi]
    call sub_10109828
    mov esi, dword ptr [ebp + 0x10]
    mov edi, dword ptr [ebp + 0x14]
    mov dword ptr [esi + 8], eax
    movsx eax, byte ptr [ebp - 0x2a]
    mov dword ptr [esi], eax
    movsx eax, word ptr [ebp - 0x2c]
    mov dword ptr [esi + 4], eax
    lea eax, [ebp - 0x28]
    push eax
    push edi
    call sub_100fe8e8
    mov ecx, dword ptr [ebp - 4]
    add esp, 0x20
    mov dword ptr [esi + 0xc], edi
    mov eax, esi
    call sub_10100db5
    pop edi
    pop esi
    leave
    ret
__fltout2 ENDP
END