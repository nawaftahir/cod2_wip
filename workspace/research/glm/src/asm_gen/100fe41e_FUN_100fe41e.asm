; FUN_100fe41e @ 0x100fe41e — auto-synthesized
    EXTRN g_101a50e4:DWORD
    sub_100f75b9 PROTO C
    sub_100f8611 PROTO C
.CODE
FUN_100fe41e PROC
    push esi
    mov esi, dword ptr [esp + 8]
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f75b9
    cmp eax, 0x65
    jmp L0
    inc esi
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f8611
    test eax, eax
    pop ecx
    jne L1
    mov al, byte ptr [esi]
    mov cl, byte ptr [g_101a50e4]
    mov byte ptr [esi], cl
    inc esi
    mov cl, byte ptr [esi]
    mov byte ptr [esi], al
    mov al, cl
    mov cl, byte ptr [esi]
    inc esi
    test cl, cl
    jne L2
    pop esi
    ret
FUN_100fe41e ENDP
END